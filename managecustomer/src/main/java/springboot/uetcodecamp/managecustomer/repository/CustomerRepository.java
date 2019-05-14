package springboot.uetcodecamp.managecustomer.repository;

import springboot.uetcodecamp.managecustomer.model.Customer;

import java.util.List;

public interface CustomerRepository {

    void insertCustomer(Customer customer);

    void deleteCustomer(Customer customer);

    void updateCustomer(Customer customer);
    List<Customer> getAllCustomer();

    Customer getCustomerByID(int id);

    Customer getCustomerByEmail(String email);

    List<Customer> searchCustomerByText(String text);
}
