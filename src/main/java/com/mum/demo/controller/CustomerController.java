/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mum.demo.controller;

import com.mum.demo.domain.Customer;
import com.mum.demo.services.CustomerService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author sunil
 */
@Controller
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @RequestMapping(value = "/customer/add", method = RequestMethod.GET)
    public String redirectToCustomerAdd(Model model) {
        Customer customer = new Customer();
        model.addAttribute("customer", customer);
        return "addCustomer";
    }

    @RequestMapping(value = "/customer/delete", method = RequestMethod.POST)
    public @ResponseBody
    String deleteCustomerId(@RequestBody Customer customer) {
        Customer c = customerService.deleted(customer);
        System.out.println("Delete with customer name " + c.getName());
        return "";
    }

    @RequestMapping(value = "/customer/update", method = RequestMethod.POST)
    public @ResponseBody
    String updateCustomer(@RequestBody Customer customer) {
        //Customer c = customerService.deleted(customer);
        System.out.println("Update with customer name " + customer.getName()+" id is "+customer.getId());
          customerService.update(customer);
        return "";
    }

    @RequestMapping(value = "/customer/AddCustomerData", method = RequestMethod.POST)
    public @ResponseBody
    String addCustomerInfo(@RequestBody Customer customer) {
        customer.setCreatedDate(new Date());
        customer.setIsDeleted(false);
        if (customerService.save(customer) == true) {
            return "Success";
        } else {
            return "fail";
        }
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String redirectToHomePage(Model model) {
        Customer customer = new Customer();
        model.addAttribute("customer", customer);
        return "home";
    }

    @RequestMapping(value = "/customer/customerInfo")
    public @ResponseBody
    List<Customer> displayCustomerInfoAngular(Model model) {
        List<Customer> customers = new ArrayList<Customer>();
        customers = customerService.getCustomersList();
        //customer.setName("sunil");
        return customers;
    }
}
