/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mum.demo.services;

import com.mum.demo.domain.Customer;
import java.util.List;

/**
 *
 * @author sunil
 */
public interface CustomerService {

    public boolean save(Customer c);

    public List<Customer> getCustomersList();

    public Customer deleted(Customer c);
    public Customer update(Customer c);
}
