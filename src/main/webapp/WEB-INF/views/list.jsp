<%-- 
    Document   : list
    Created on : Jan 16, 2015, 4:38:23 PM
    Author     : sunil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        ${customerList.size()}
        <table id="tablelist" border="1">
            <tr>
                <c:forEach items="customerList" var="cust">                    
                    <td>${cust}</td>
                </c:forEach>
            </tr>
        </table>

    </body>
</html>
