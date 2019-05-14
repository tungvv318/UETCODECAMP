package springboot.uetcodecamp.managecustomer.repository;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import springboot.uetcodecamp.managecustomer.model.Customer;

import java.util.List;

@Repository
public class CustomerRepositoryImpl implements CustomerRepository{

    @Autowired
    private SessionFactory sessionFactory;


    @Override
    public void insertCustomer(Customer customer) {
        sessionFactory.getCurrentSession().save(customer);
    }

    @Override
    public void deleteCustomer(Customer customer) {
        sessionFactory.getCurrentSession().delete(customer);
    }

    @Override
    public void updateCustomer(Customer customer) {
        sessionFactory.getCurrentSession().update(customer);
    }

    @Override
    public List<Customer> getAllCustomer() {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Customer.class);
        List<Customer> lstCustomer = criteria.list();
        return lstCustomer;
    }

    @Override
    public Customer getCustomerByID(int id) {
        Customer customer = (Customer) sessionFactory.getCurrentSession().get(Customer.class, id);
        return customer;
    }

    @Override
    public Customer getCustomerByEmail(String email) {
            Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Customer.class);
            criteria.add(Restrictions.eq("email", email));
            List<Customer> customers = criteria.list();
            if(customers.size() != 0) {
                return customers.get(0);
            }
            return null;
    }
}
