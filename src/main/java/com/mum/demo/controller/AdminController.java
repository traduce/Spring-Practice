/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mum.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author sunil
 */
@Controller
public class AdminController {
    
    @RequestMapping(value = "/admin/adminHome",method = RequestMethod.GET)
    public String redirectToAdminPage(){
        return "adminHome";
    }
    
    @RequestMapping(value = "/admin1" ,method = RequestMethod.GET)
    public String redirectToAdminPageTest1(){
        return "admin1";
    }
    
//    @RequestMapping(value = "/data1/{adminName}" ,method = RequestMethod.POST)
//    public String getAdminData1(@PathVariable("adminName") String adminName){
//        System.out.println("NAME IS:: "+adminName);
//        return "admin1";
//    }
    @RequestMapping(value = "/data1/{adminName}/{adminEmail}/{adminSalary}" ,method = RequestMethod.POST)
    public @ResponseBody String getAdminData1(@PathVariable("adminName") String adminName,@PathVariable("adminEmail") String email,@PathVariable("adminSalary") int salary){
        System.out.println("NAME IS:: "+adminName);
        System.out.println("Email IS:: "+email);
        System.out.println("Salary IS:: "+salary);
        return "success";
    }
    
    @RequestMapping(value = "/data1/value1")
    public String getAdminDataName1(Model model){
        System.out.println("TEST IS:: ");
        model.addAttribute("name", "sunil");
        model.addAttribute("address","TEXAS");
        String result="result";
        return result;
    }
}
