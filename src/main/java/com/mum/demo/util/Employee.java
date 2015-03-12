/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mum.demo.util;

/**
 *
 * @author sunil
 */
public class Employee {
    public int id;
    public String employeeName;

   public Employee(int id, String employeeName){
       this.id=id;
       this.employeeName=employeeName;
   }   

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }
   
   
    
}
