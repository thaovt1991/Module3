package dao;

import model.Customer;
import model.Transfer;

import java.sql.SQLException;
import java.util.List;

public interface ITransferDAO {

    public List<Transfer> findAll();

    public void save(Transfer transfer) throws SQLException;

    public Transfer findById(int id);

}
