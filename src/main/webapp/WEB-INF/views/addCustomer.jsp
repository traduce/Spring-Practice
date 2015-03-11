<%-- 
    Document   : addCustomer
    Created on : Feb 22, 2015, 8:09:33 PM
    Author     : sunil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="customerForm">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script data-require="angular.js@*" data-semver="1.3.0-beta.14" src="http://code.angularjs.org/1.3.0-beta.14/angular.js"></script>
    <script data-require="angular-animate@*" data-semver="1.3.0-beta.14" src="http://code.angularjs.org/1.3.0-beta.14/angular-animate.js"></script>
    <script src="../resources/js/customer.js"></script>    
    <body>
        <h1>Add Customer</h1>
        <div ng-controller="customerFormSubmitController">
           
            <form>
                <h3>{{headerText}}</h3>
                <table>
                    <tr>
                        <td>Full Name</td>
                        <td><input type="text" ng-model="name"/></td>
                    </tr>
                    <tr>
                        <td>S.S.N</td>
                        <td><input type="text" ng-model="ssn"/></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" ng-model="email"/></td>
                    </tr>
                    <tr>
                        <td><input type="submit" id="submit" value="Submit" ng-click="submit()"/></td>
                         <td><input type="submit" id="update" value="Update" ng-click="update()"/></td>
                    </tr>
                </table> 
            </form>
           
            <button data-ng-click="show()">Show Customer</button>
            <table ng-show="showCustomerTable">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>SSN</th>
                        <th>Action</th>
                    </tr> 
                </thead>
                <tbody>
                    <tr ng-repeat="customer in list">
                        <td>{{customer.id}}</td>
                        <td>{{customer.name}}</td>
                        <td>{{customer.ssn}}</td>
                        <td>
                            <a href="#" ng-click="edit(customer)">Edit</a>|
                            <a href="#" ng-click="delete(customer)">Delete</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>


    </body>
</html>
