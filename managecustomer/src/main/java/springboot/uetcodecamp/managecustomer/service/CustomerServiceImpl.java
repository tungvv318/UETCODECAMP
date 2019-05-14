package springboot.uetcodecamp.managecustomer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import springboot.uetcodecamp.managecustomer.model.Customer;
import springboot.uetcodecamp.managecustomer.repository.CustomerRepository;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService{

    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public void insertCustomer(Customer customer) {
        customerRepository.insertCustomer(customer);
    }

    @Override
    public void deleteCustomer(Customer customer) {
        customerRepository.deleteCustomer(customer);
    }

    @Override
    public void updateCustomer(Customer customer) {
        customerRepository.updateCustomer(customer);
    }

    @Override
    public List<Customer> getAllCustomer() {
        return customerRepository.getAllCustomer();
    }

    @Override
    public Customer getCustomerByID(int id) {
        return customerRepository.getCustomerByID(id);
    }

    @Override
    public Customer getCustomerByEmail(String email) {
        return customerRepository.getCustomerByEmail(email);
    }
}
