<!DOCTYPE html>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>jQuery validation plug-in - main demo</title>

        <!--        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
                <script src="http://code.jquery.com/ui/1.11.0/jquery-ui.min.js"></script>
                <script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>  -->
        
        <script src="resources/js/jquery-1.11.1.min.js"></script>
        <script src="resources/js/jquery.validate.min.js"></script>  

        <script>
            $(document).ready(function () {
                $("#fullName").hide();
                $("#commentForm").validate();
            });
            $.validator.setDefaults({
                submitHandler: function () {
                    var name=$("#cname").val();
                    var email=$("#cemail").val();
                    var salary=$("#salary").val();
                    $.post('data1/'+name+'/'+email+'/'+salary,function (data){
                        if(data==='success'){
                            alert('success');
                            $("#fullName").load('data1/value1');
                             $("#fullName").show();
                             $("#salary").val(2000);
                        }
                    })
                    alert("submitted! "+name);

                }
            });
        </script>
    </head>

    <style>
        #commentForm {
            width: 500px;
        }
        #commentForm label {
            width: 250px;
        }
        #commentForm label.error, #commentForm input.submit {
            margin-left: 253px;
        }
        #signupForm {
            width: 670px;
        }
        #signupForm label.error {
            margin-left: 10px;
            width: auto;
            display: inline;
        }
        #newsletter_topics label.error {
            display: none;
            margin-left: 103px;
        }
    </style>
    <body>
        <div id="main">
            <p>Default submit Handler is set to display an alert into of submitting the form</p>
            <form class="cmxform" id="commentForm" method="get" action="">
                <div id="fullName">
                    <c:import url="/data1/value1" />
                </div>
                
                <fieldset>
                    <legend>Please provide your name, email address (won't be published) and a comment</legend>
                    <p>
                        <label for="search">Search:</label>
                        <input id="search" name="search" type="text" placeholder="search">
                    </p>
                    <p>
                        <label for="cname">Name (required, at least 2 characters)</label>
                        <input id="cname" name="name" minlength="2" type="text" required>
                    </p>
                    <p>
                        <label for="cemail">E-Mail (required)</label>
                        <input id="cemail" type="email" name="email" required>
                    </p>
                    <p>
                        <label for="salary">Salary</label>
                        <input id="salary" type="number" name="salary" required>
                    </p>
                    <p>
                        <label for="curl">URL (optional)</label>
                        <input id="curl" type="url" name="url">
                    </p>
                    <p>
                        <label for="ccomment">Your comment (required)</label>
                        <textarea id="ccomment" name="comment" required></textarea>
                    </p>
                    <p>
                        <input class="submit" type="submit" value="Submit">
                    </p>
                </fieldset>
            </form>


        </div>
    </body>
</html>
