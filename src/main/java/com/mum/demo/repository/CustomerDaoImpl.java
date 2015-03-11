/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mum.demo.repository;

import com.mum.demo.domain.Customer;
import com.mum.demo.util.SessionUtil;
import java.util.List;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 *
 * @author sunil
 */
@Repository
public class CustomerDaoImpl extends SessionUtil implements CustomerDao {

    @Override
    public boolean save(Customer c) {
        if (c != null) {
            getSession().save(c);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<Customer> getCustomersList() {
        return getSession().createCriteria(Customer.class).add(Restrictions.eq("isDeleted", false)).list();
    }

    @Override
    public Customer deleted(Customer c) {
        c.setIsDeleted(true);
        getSession().update(c);
        return c;
    }

    @Override
    public Customer update(Customer c) {
        Customer customer = (Customer) getSession().get(Customer.class, c.getId());
        customer.setEmail(c.getEmail());
        customer.setName(c.getName());
        customer.setSsn(c.getSsn());
        getSession().update(customer);
        return customer;
    }

}
