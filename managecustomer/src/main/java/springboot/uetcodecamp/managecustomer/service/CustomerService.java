package springboot.uetcodecamp.managecustomer.service;

import springboot.uetcodecamp.managecustomer.model.Customer;

import java.util.List;

public interface CustomerService {
    void insertCustomer(Customer customer);
    void deleteCustomer(Customer customer);
    void updateCustomer(Customer customer);
    List<Customer> getAllCustomer();
    Customer getCustomerByID(int id);
    Customer getCustomerByEmail(String email);
}
