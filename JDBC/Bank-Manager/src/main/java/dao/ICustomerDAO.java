package dao;

import model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerDAO {
    public List<Customer> findAll();

    public boolean save(Customer customer) throws SQLException;

    public Customer findById(int id);

    public boolean remove(int id) throws SQLException;

    public boolean update(Customer customer) throws SQLException;

//    void transfersTrancition(int id_sender , int id_recipient , long amount) throws SQLException;
}
