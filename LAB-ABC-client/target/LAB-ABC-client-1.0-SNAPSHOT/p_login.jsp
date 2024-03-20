<%-- 
    Document   : login
    Created on : Mar 11, 2024, 3:26:56 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link href="assets/css/login.css" rel="stylesheet">
    </head>
    
    <body>
        <div class="login-container">
            <h1>Patient Login</h1>
            <form id="loginForm" onsubmit="return checkLogin()">
                <input type="email" id="email" name="email" placeholder="Email" required><br>
                <input type="password" id="password" name="password" placeholder="Password" required><br>
                <button type="submit">Login</button>
                <label>Don't you have an account - <a href="signup.jsp">Sign up</a></label>
            </form>
            <div id="message" class="message"></div>
        </div>
 
    <script>
            function checkLogin() {
                var email = document.getElementById("email").value;
                var password = document.getElementById("password").value;
 
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "http://localhost:8080/LAB-ABC-rest-service/resources/login", true);
                xhr.setRequestHeader("Content-Type", "application/json");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4) {
                        if (xhr.status === 200) {
                            var response = JSON.parse(xhr.responseText);
                            if (response.success) {
                                // Login successful, redirect to the patient dashboard
                                window.location.href = "patient-dash.jsp";
                            } else {
                                document.getElementById("message").innerHTML = response.message;
                            }
                        } else {
                            document.getElementById("message").innerHTML = "Something went wrong. Please give it another go later.";
                            
                        }
                    }
                };
                var data = JSON.stringify({email: email, password: password});
                xhr.send(data);
                return false; // Prevent the form from submitting
            }
 
 
        </script>
        </body>
</html>
