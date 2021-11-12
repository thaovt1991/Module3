package service;

import model.Customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements CustomerService {
    private static Map<Integer,Customer> customers ;

    static {
        customers = new HashMap<>() ;
        customers.put(1, new Customer(1, "John", "john@codegym.vn","0972487265", "Hanoi",14500000));
        customers.put(2, new Customer(2, "Bill", "bill@codegym.vn","0951235135", "Danang",20000000));
        customers.put(3, new Customer(3, "Alex", "alex@codegym.vn","0962435126", "Saigon",5000000));
        customers.put(4, new Customer(4, "Adam", "adam@codegym.vn","0962308033", "Beijin",32000000));
        customers.put(5, new Customer(5, "Sophia", "sophia@codegym.vn","0966213546", "Miami",25000000));
        customers.put(6, new Customer(6, "Rose", "rose@codegym.vn","0972546823", "Newyork",10000000));
    }


    @Override
    public List<Customer> findAll() {
        return new ArrayList<>(customers.values());
    }

    @Override
    public void save(Customer customer) {
        customers.put(customer.getId(), customer);
    }

    @Override
    public Customer findById(int id) {
        return customers.get(id);
    }

    @Override
    public void update(int id, Customer customer) {
        customers.put(id, customer);
    }

    @Override
    public void remove(int id) {
        customers.remove(id);
    }
}
