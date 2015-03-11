<%-- 
    Document   : addAdmin
    Created on : Mar 6, 2015, 9:48:23 PM
    Author     : sunil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <link href="../resources/css/adminStyle.css" rel="stylesheet"/>
    <script src="../resources/js/jquery-1.11.1.min.js"></script>
    <script src="../resources/js/jquery.validate.min.js"></script>
    <script src="../resources/js/jquery.validate.js"></script>
    <script src="../resources/js/jquery.quickValidate.js"></script>
    <script src="../resources/js/jquery.quickValidate.min.js"></script>
    <script src="../resources/js/prettify.js"></script>
    <script>
        (function () {
            $(document).ready(function () {
                if (($("#name").val() == '')) {
                    console.log('validate name');
                }
                $("#submit").click(function () {
                    console.log('inside log');
                });
                
                function invalidMsg(textbox) {
                        alert('##');
                        if (textbox.value == '') {
                            textbox.setCustomValidity('**Required email address');
                        }
                        else if (textbox.validity.typeMismatch) {
                            textbox.setCustomValidity('**please enter a valid email address');
                        }
                        else {
                            textbox.setCustomValidity('');
                        }
                        return true;
                    }



            });




        })();

    </script>


    <body>
        <h1> Admin Home</h1>
        <form:form id="myform">
            <table>
                <tr>
                    <th>Name:</th>
                    <td><input id="name" type="text" value="" name="name" required/></td>
                    <td><span class="error">Name is required</span></td>
                </tr>               
                <tr>
                    <th>Role:</th>
                    <td><input id="role" type="text" value="" name="role" /></td>
                    <td><span class="error">Role is required</span></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td>
                        <input id="email" oninvalid="invalidMsg(this);" oninput="invalidMsg(this);"  name="email" type="email" required="required" />
                        <!--<input name="Email" class="quickValidate" type="text" required="true"  oninvalid="InvalidMsg(this);" oninput="InvalidMsg(this);"/></td>-->
                    <td>

                    </td>
                </tr>
                <tr>
                    <th>Country</th>                    
                    <td>
                        <select id="country" name="country" required="true">
                            <option value="select">--Select--</option>
                            <option value="nepal">Nepal</option>
                            <option value="india">India</option>
                            <option value="china">China</option>
                            <option value="japan">Japan</option>
                        </select>
                    </td>
                    <td><span class="error">Country is required</span></td>
                </tr>
                <tr>
                    <th>Language</th>
                    <td>Nepali: <input id="nepali" type="checkbox" value="" name="nepali" />
                        Japanese: <input id="japanese" type="checkbox" value="" name="japanese" />
                        Chinese: <input id="chinese" type="checkbox" value="" name="chinese" /></td>
                    <td><span class="error">Language is required</span></td>
                </tr>
                <tr>
                    <th>Gender</th>
                    <td>
                        Male<input type="radio" value="" name="gender" checked=""/>
                        Female<input type="radio" value="" name="gender" />
                    </td>
                    <td><span class="error">Gender is required</span></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Create" id="submit" /></td>
                    <!--<td><button value="Ok" onclick="submitOk()">Okays</button></td>-->
                </tr>
            </table>
        </form:form>
    </body>
</html>
