<%-- 
    Document   : show
    Created on : Jan 18, 2015, 11:32:37 PM
    Author     : sunil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html ng-app="taskManagerModule">
    <head>
        <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <title>JSP Page</title>
    </head>
    <script src="../resources/js/jquery-1.11.1.min.js"></script>
    <script src="../resources/js/angular-animate.js"></script>
    <script src="<c:url value="/resources/js/test.js" />"></script>
    <script data-require="angular.js@*" data-semver="1.3.0-beta.14" src="http://code.angularjs.org/1.3.0-beta.14/angular.js"></script>
    <script data-require="angular-animate@*" data-semver="1.3.0-beta.14" src="http://code.angularjs.org/1.3.0-beta.14/angular-animate.js"></script>

    <link href="../resources/css/style.css" rel="stylesheet" type="text/css"/>

    <body>

        <h1>List of Employee</h1>
        <div ng-controller="taskMangerController">
            <div id="task-panel" class="fadien fadeout showpanel panel" ng-show="toggle">
                <div class="panel-heading" >
                    <span class="panel-title">Recent Tasks</span>
                    <div class="panel-heading-control">
                        <button ng-click="toggle = !toggle" class="btn-panel">Add New Task</button>
                        <button ng-click="toggle = !toggle" class="btn-panel">Clear Complete Task</button>
                    </div>                
                </div>
            </div>

            <div id="add-task-panel" class="fadien fadeout addPanel panel" ng-hide="toggle">
                <div class="panel-heading" >
                    <span class="panel-title">Add Task</span>
                    <div class="panel-heading-control">
                        <button ng-click="toggle = !toggle" class="btn-panel">Show All Tasks</button>
                    </div>
                </div>
            </div>



            <%--<form:form>
                <c:forEach items="${customers}" var="customer">
                    ${customer.name} </br>
                </c:forEach>  
            </form:form>--%>
        </div> 
    </body>
</html>
