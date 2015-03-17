<%-- 
    Document   : admin2
    Created on : Mar 11, 2015, 10:54:03 PM
    Author     : sunil
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>         
    </head>
    <script src="resources/js/jquery-1.11.1.min.js"></script>
    <!--<script src="resources/js/jquery.js"></script>-->
    <script src="resources/js/jquery.validate.js"></script>

    <script>
        $.validator.setDefaults({
            submitHandler: function () {
                alert("Submitted");
            }
        });
        $().ready(function () {
            $("#adminForm").validate({
                rules: {
                    firstName: "required",
                    lastName: "required",
                    username: {
                        required: true,
                        minlength: 2
                    },
                    password: "required",
                    cpassword: {
                        required: true,
                        equalTo: "#password"
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    agree: "required",
                    subjectValidate: {
                        required: "#subject:checked",
                        minlength: 2
                    },
                    skillValidate: {
                        required: "#skills:checked",
                        minlength: 2
                    }
//                    skillValidate: {
//                        required: "#skills:checked",
//                        minlength: 2
//                    }

                },
                messages: {
                    firstName: "Please enter your firstName",
                    lastName: "Please enter your lastName",
                    username: {
                        required: "Please enter your username",
                        minlength: "Your usename must consists of at least 2 characters."
                    },
                    password: "Please provide a password",
                    cpassword: {
                        requierd: "Please provide a confirmation password",
                        equalTo: "Please enter the same password as above"
                    },
                    email: {
                        required: "Please provide an email",
                        email: "Please enter the valid email"
                    },
                    agree: "Please accept our policy."
                }
            });

            $("#username").focus(function () {
                var firstName = $("#firstName").val();
                var lastName = $("#lastName").val();
                if (firstName && lastName && !this.value) {
                    this.value = firstName + "..." + lastName;
                }
            });

            var subject = $("#subject");
            var initial = subject.is(":checked");
            var subjectList = $("#subject_list")[initial ? "removeClass" : "addClass"]("red");
            var subjectInput = subjectList.find("input").attr("disabled", !initial);
            subject.click(function () {
                subjectList[this.checked ? "removeClass" : "addClass"]("red");
                subjectInput.attr("disabled", !this.checked);
            });

            $("#skills").change(function () {
                if ($("#skills").is(":checked")) {
                    $("#skillTypes").removeAttr('disabled');

                } else {
                    $("#skillTypes").attr('disabled', '');


                }
            }).change();

            ///Dynamic Add/Delete button
            var i = 1;
            $("#addButton").click(function () {
                var newTextBox = $(document.createElement('div')).attr("id", 'patentInfo' + i);
                newTextBox.after().html('<label> Patient Name: #' + i + ':\n\
                </label>' + '<input type="text" name="patient' + i + '" id="patient' + i + '" value="">\n\
                ');
                newTextBox.appendTo("#patentDetails");
                i++;
            });

            $("#removeButton").click(function () {
                if (i >= 0) {
                    i--;
                    $("#patentInfo" + i).remove();
                }
            });
            $("#showButton").click(function () {
                var msg = '';
                var list=[];
                for (j = 1; j < i; j++) {
                    //msg += "Textbox #" + j + ":" + $("#patient" + j).val();  
                    list.push($("#patient" + j).val());
                   
                }
                    alert(": " + list.length);         

                console.log('Inside click--' + msg);

                $.post('adminValue3/' +list, function () {
                    console.log("success");
                });
            });


        });
    </script>
    <style>
        #subject_list label.error {
            display: none;
            margin-left: 103px;
        }
        #skillTypes label.error{
            display: none;
            margin-left: 103px;
        }
        div{
            padding: 8px;
        }
    </style>
    <body>
        <h1>Admin 2</h1>
        <form:form id="adminForm" action="" method="get">
            <fieldset>
                <legend>Validating admin2</legend>
                <p>
                    <label for="firstName">FirstName</label>
                    <input id="firstName" name="firstName" type="text">
                </p>
                <p>
                    <label for="lastName">LastName</label>
                    <input type="text" name="lastName" id="lastName">
                </p>
                <p>
                    <label for="username">Username</label>
                    <input type="text" name="username" id="username">
                </p>
                <p>
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password">
                </p>
                <p>
                    <label for="cpassword">Confirm-Password</label>
                    <input type="password" name="cpassword" id="cpassword">
                </p>
                <p>
                    <label for="email">Email</label>
                    <input type="text" name="email" id="email">
                </p>
                <p>
                    <label for="agree">Please agree to the policy</label>
                    <input type="checkbox" name="agree" id="agree">
                </p>
                <p>
                    <label for="subject">Favourite Subject</label>
                    <input type="checkbox" name="subject" id="subject">
                </p>
                <fieldset id="subject_list">
                    <legend>Select any two subject.</legend>
                    <label>
                        Math <input type="checkbox" name="subjectValidate" id="math">
                    </label>
                    <label>
                        English <input type="checkbox" name="subjectValidate" id="english">
                    </label>
                    <label>
                        Science <input type="checkbox" name="subjectValidate" id="science">
                    </label>
                    <label for="subjectValidate" class="error">Please select at least two topics you'd like to receive...</label>

                </fieldset>
                <p>
                    <label for="skills">Skills</label>
                    <input type="checkbox" id="skills" name="skills">
                </p>
                <fieldset id="skillTypes">
                    <legend>Select any two skills</legend>
                    <label>Java <input type="checkbox" name="skillValidate" id="java"></label>
                    <label>C# <input type="checkbox" name="skillValidate" id="csharp"></label>
                    <label>Php <input type="checkbox" name="skillValidate" id="php"></label>
                    <label for="skillValidate" class="error">Required...</label>

                </fieldset>

                <p>
                <div id="patentDetails">
                    <div id="patentInfo">
                        <label>Patient Name:</label>
                        <input type="text" id="patient0">
                    </div>
                </div>


                <input type="button" name="Add" id="addButton" value="Add">
                <input type="button" name="Remove" id="removeButton" value="Remove">
                <input type="button" name="ShowInfo" id="showButton" value="showButton">
                </p>

                <p>
                    <input type="submit" value="submit">
                </p>
            </fieldset>
        </form:form>
    </body>
</html>
