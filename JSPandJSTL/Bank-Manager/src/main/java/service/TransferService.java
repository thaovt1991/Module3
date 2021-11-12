package service;

import model.Transfer;

import java.util.List;

public interface TransferService {

    List<Transfer> findAll() ;

    void save(Transfer transfer) ;

    void update(int id , Transfer transfer) ;

    Transfer findById(int id) ;

    void remove(int id) ;

}
