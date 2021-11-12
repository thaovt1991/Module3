package service;

import model.Customer;
import model.Transfer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TransferServiceImpl implements  TransferService{
    private static Map<Integer, Transfer> transfers ;

    static {
        transfers = new HashMap<>() ;
        transfers.put(1,new Transfer(1,3,"Alex",1,"John",1000000,10));
        transfers.put(2,new Transfer(2,1,"John",2,"Bill",2000000,10));
        transfers.put(3,new Transfer(3,1,"John",4,"Adam",3000000,10));
    }

    @Override
    public List<Transfer> findAll() {
        return new ArrayList<>(transfers.values());
    }

    @Override
    public void save(Transfer transfer) {
        transfers.put(transfer.getIdTransfer() ,transfer) ;
    }
    @Override
    public void update(int id , Transfer transfer) {
        transfers.put(id ,transfer) ;
    }

    @Override
    public Transfer findById(int id) {
        return transfers.get(id);
    }

    @Override
    public void remove(int id) {
       transfers.remove(id) ;
    }
}
