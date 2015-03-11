<%-- 
    Document   : home
    Created on : Jan 13, 2015, 10:54:01 PM
    Author     : sunil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html ng-app="customerFormApplication">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script src="resources/js/jquery-1.11.1.min.js"></script>
    <!--<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>-->
    <script data-require="angular.js@*" data-semver="1.3.0-beta.14" src="http://code.angularjs.org/1.3.0-beta.14/angular.js"></script>
    <script data-require="angular-animate@*" data-semver="1.3.0-beta.14" src="http://code.angularjs.org/1.3.0-beta.14/angular-animate.js"></script>

    <script>
        var app = angular.module('customerFormApplication', []);
        app.controller('customerForm', function ($scope, $http) {
            $scope.name="";
            var urlBase="";
            $scope.addCustomer = function addCustomer() {
                if($scope.name==""){
                    alert('Please,enter the name');
                }else{
                    $http.post(urlBase+'customer/save',{
                        name:$scope.name
                    }).success(function(data,status,header){
                        // var newTaskUri = headers()["location"];
                         console.log("Might be good to GET  and append the task.");
                            alert('Customer Added');
                            redirectSuccessPage();
                        });
                }
            };
            
            function redirectSuccessPage(){
                alert('Success page');
            }
        });

    </script>


    <body>
        <h1>HOME PAGE!</h1>
        <div ng-controller="customerForm">
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
                    <td><button ng-click="addCustomer()">Submit</button></td>
                </tr>
            </table>  
        </div>

    </body>
</html>
