/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mum.demo.controller;

import com.mum.demo.util.Employee;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author sunil
 */
@Controller
public class AdminController {

    List<Employee> employees = new ArrayList<Employee>();

    public AdminController() {
        employees.add(new Employee(1, "Sunil"));
        employees.add(new Employee(2, "Vickey"));
        employees.add(new Employee(3, "Sanjeev"));
        employees.add(new Employee(4, "Pawan"));
        employees.add(new Employee(5, "Manish"));
        employees.add(new Employee(6, "Mahesh"));
        employees.add(new Employee(7, "Dipesh"));
    }

    @RequestMapping(value = "/admin/adminHome", method = RequestMethod.GET)
    public String redirectToAdminPage() {
        return "adminHome";
    }

    @RequestMapping(value = "/admin1", method = RequestMethod.GET)
    public String redirectToAdminPageTest1() {
        return "admin1";
    }

//    @RequestMapping(value = "/data1/{adminName}" ,method = RequestMethod.POST)
//    public String getAdminData1(@PathVariable("adminName") String adminName){
//        System.out.println("NAME IS:: "+adminName);
//        return "admin1";
//    }
    @RequestMapping(value = "/data1/{adminName}/{adminEmail}/{adminSalary}", method = RequestMethod.POST)
    public @ResponseBody
    String getAdminData1(@PathVariable("adminName") String adminName, @PathVariable("adminEmail") String email, @PathVariable("adminSalary") int salary) {
        System.out.println("NAME IS:: " + adminName);
        System.out.println("Email IS:: " + email);
        System.out.println("Salary IS:: " + salary);
        return "success";
    }

    @RequestMapping(value = "/data1/value1")
    public String getAdminDataName1(Model model) {
        model.addAttribute("name", "sunil");
        model.addAttribute("address", "TEXAS");
        String result = "result";
        return result;
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public @ResponseBody
    List<Employee> searchEmployee(@RequestParam String searchValue) {
        return searchResult(searchValue);
    }

    public List<Employee> searchResult(String searchKey) {
        List<Employee> results = new ArrayList<Employee>();
        for (Employee e : employees) {
            if (e.getEmployeeName().contains(searchKey)) {
                results.add(e);
            }
        }
        return results;
    }
    
    @RequestMapping(value = "/admin2",method = RequestMethod.GET)
    public String redirectToAdmin2(){
        return "admin2";
    }
    
    @RequestMapping(value = "/admin3",method = RequestMethod.GET)
    public String redirectToAdmin3(){
        return "admin3";
    }
}
