<%-- 
    Document   : show
    Created on : Jan 18, 2015, 11:32:37 PM
    Author     : sunil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <title>JSP Page</title>
    </head>
    <script src="../resources/js/jquery-1.11.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
    <script>
        var app = angular.module('customerApplication', []);
      
         function customerApp($scope, $http) {
               $scope.selection = [];
            $scope.showCustomer = function () {
                $http({method: 'GET', url: 'customerInfo'}).
                        success(function (data, status, header, config) {
                             alert("NAME "+data.length);
                            if(data._embedded != undefined){
                                 $scope.customers = data._embedded.customers;
                            }else{
                                $scope.customers=[];
                            }
                             alert("NAME "+$scope.customers);
                            for(var i=0;i<data.length;i++){
                                alert("NAME "+data.name);
                                //$scope.selection.push($scope.customers.name);
                            }
                            $scope.customers = data;
                        }).
                        error(function (data, status, header, config) {
                        });
            };
        }
        ;

    </script>
    <body>

        <h1>List of Employee</h1>
        <div data-ng-app="customerApplication">
            <div ng-controller="customerApp"> 
                <button data-ng-click="showCustomer()">Show Employee</button>  
                {{customers.length}}
                <li ng-repeat="customers in cust">Name:{{cust.name}} </li>
                    
                
                
                <%--<form:form>
                    <c:forEach items="${customers}" var="customer">
                        ${customer.name} </br>
                    </c:forEach>  
            </form:form>--%>
                
                
            </div> 
        </div>

    </body>
</html>
