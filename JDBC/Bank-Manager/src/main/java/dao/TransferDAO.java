package dao;

import model.Customer;
import model.Transfer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TransferDAO implements ITransferDAO{

    private String jdbcURL = "jdbc:mysql://localhost:3306/MyBankManager?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456";

    private static final String SELECT_ALL_TRANSFERS ="SELECT * FROM transfers";
    private static final String SELECT_TRANSFER_BY_ID = "SELECT*FROM transfers WHERE id = ?";
    private static final String INSERT_TRANSFER_SQL = "INSERT INTO transfers(id_sender,name_sender,id_recipient,name_recipient,transfer_amount,fees) VALUES(?,?,?,?,?,?)";

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
    public List<Transfer> findAll() {
        List<Transfer> transfers = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TRANSFERS);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idTransfer = rs.getInt("id_transfer");
                int idSender = rs.getInt("id_sender");
                String name_Sender = rs.getString("name_sender");
                int idRecipient = rs.getInt("id_recipient");
                String name_Recipient = rs.getString("name_recipient");
                long transferAmount = rs.getLong("transfer_amount");
                int fees = rs.getInt("fees");

                transfers.add(new Transfer(idTransfer, idSender, name_Sender, idRecipient, name_Recipient, transferAmount,fees));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return transfers;
    }

    @Override
    public void save(Transfer transfer) throws SQLException {
        System.out.println(INSERT_TRANSFER_SQL);
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_TRANSFER_SQL);
            preparedStatement.setInt(1, transfer.getIdSender());
            preparedStatement.setString(2, transfer.getName_Sender());
            preparedStatement.setInt(3, transfer.getIdRecipient());
            preparedStatement.setString(4, transfer.getName_Recipient());
            preparedStatement.setLong(5, transfer.getTransferAmount());
            preparedStatement.setInt(6,transfer.getFees());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }

    }

    @Override
    public Transfer findById(int id) {
        Transfer transfer = null;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TRANSFER_BY_ID);
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idSender = rs.getInt("id_sender");
                String name_Sender = rs.getString("name_sender");
                int idRecipient = rs.getInt("id_recipient");
                String name_Recipient = rs.getString("name_recipient");
                long transferAmount = rs.getLong("transfer_amount");
                int fees = rs.getInt("fees");
                transfer = new Transfer(id, idSender, name_Sender, idRecipient, name_Recipient, transferAmount,fees);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return transfer;
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
