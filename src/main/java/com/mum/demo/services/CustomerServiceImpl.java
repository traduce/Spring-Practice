/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mum.demo.services;

import com.mum.demo.domain.Customer;
import com.mum.demo.repository.CustomerDao;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author sunil
 */
@Service
@Transactional
public class CustomerServiceImpl implements CustomerService{

    @Autowired 
    private CustomerDao customerDao;
    @Override
    public boolean save(Customer c) {
        return customerDao.save(c);
    }

    @Override
    public List<Customer> getCustomersList() {
     return customerDao.getCustomersList();
    }

    @Override
    public Customer deleted(Customer c) {
        return customerDao.deleted(c);
    }

    @Override
    public Customer update(Customer c) {
          return customerDao.update(c);
    }
    
}
