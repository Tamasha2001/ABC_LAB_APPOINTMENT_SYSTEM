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

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.getElementById("loginForm").addEventListener("submit", function (event) {
                event.preventDefault();
                var form = this;
                var formData = new FormData(form);
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "http://localhost:8080/LAB-ABC-client/p_login", true);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        if (xhr.status === 200) {
                            document.getElementById("message").innerText = "Login Successful";
                            window.location.href = "patient-dash.jsp";
                        } else {
                            document.getElementById("message").innerText = "Login Failed. Please check your credentials.";
                        }
                    }
                };
                xhr.send(formData);
            });
        });
    </script>

    <body>
        <div class="login-container">
            <h1>Login</h1>
            <form id="loginForm">
                <input type="email" id="email" name="email" placeholder="Email" required><br>
                <input type="password" id="password" name="password" placeholder="Password" required><br>
                <button type="submit">Login</button>
            </form>
            <div id="message" class="message"></div>
            <p>Don't have an account? <a href="signup.jsp">Sign Up</a></p>
        </div>
</html>
