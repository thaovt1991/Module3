package dao;

import model.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO implements ICustomerDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/MyBankManager?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456";

    private static final String SELECT_ALL_CUSTOMER = "SELECT * FROM customers";
    private static final String INSERT_CUSTOMER_SQL = "INSERT INTO customers(full_name,email,phone,address,balance) VALUES(?,?,?,?,?)";
    private static final String UPDATE_CUSTOMER_SQL = "UPDATE customers SET full_name =? , email = ?, phone =?, address =?, balance = ? WHERE id =?";
    private static final String SELECT_CUSTOMER_BY_ID = "SELECT*FROM customers WHERE id = ?";
    private static final String DELETE_CUSTOMER_SQL = "DELETE FROM customers WHERE id = ? ;";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }


    @Override
    public List<Customer> findAll() {
        List<Customer> customers = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String full_name = rs.getString("full_name");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                long balance = rs.getLong("balance");

                customers.add(new Customer(id, full_name, email, phone, address, balance));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customers;
    }


    @Override
    public boolean save(Customer customer) throws SQLException {
        boolean isInsert = false;
        System.out.println(INSERT_CUSTOMER_SQL);
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER_SQL);
            preparedStatement.setString(1, customer.getFullName());
            preparedStatement.setString(2, customer.getEmail());
            preparedStatement.setString(3, customer.getPhone());
            preparedStatement.setString(4, customer.getAddress());
            preparedStatement.setLong(5, customer.getBalance());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
            isInsert = true;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return isInsert;
    }

    @Override
    public Customer findById(int id) {
        Customer customer = null;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String full_name = rs.getString("full_name");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                long balance = rs.getLong("balance");
                customer = new Customer(id, full_name, email, phone, address, balance);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customer;
    }

    @Override
    public boolean remove(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_CUSTOMER_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean update(Customer customer) throws SQLException {
        boolean rowUpdated = false;
        try {
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(UPDATE_CUSTOMER_SQL);
            statement.setString(1, customer.getFullName());
            statement.setString(2, customer.getEmail());
            statement.setString(3, customer.getPhone());
            statement.setString(4, customer.getAddress());
            statement.setLong(5, customer.getBalance());
            statement.setInt(6, customer.getId());


            rowUpdated = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }

    @Override
    public void transfersTrancition(int id_sender, int id_recipient, long amount) throws SQLException {
        String query = "{CALL sp_transfers(?,?,?)}";
        Connection connection = null;

        try {
            connection = getConnection();
            connection.setAutoCommit(false);

            CallableStatement callableStatement = connection.prepareCall(query);

            callableStatement.setInt(1, id_sender);

            callableStatement.setInt(2, id_recipient);

            callableStatement.setLong(3, amount);

            System.out.println(callableStatement);

            callableStatement.executeUpdate();

            connection.commit();
        } catch (SQLException e) {
            connection.rollback();
            printSQLException(e);
        } finally {
            connection.setAutoCommit(true);
            connection.close();
        }
    }


    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
