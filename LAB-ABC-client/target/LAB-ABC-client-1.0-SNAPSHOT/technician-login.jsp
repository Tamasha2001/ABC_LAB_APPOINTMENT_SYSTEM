<%-- 
    Document   : tech-login
    Created on : Mar 12, 2024, 11:33:53 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .login-container {
            text-align: center;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #333333;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        input {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        button {
            padding: 10px;
            background-color: #007BFF;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #0056b3;
        }

        .message {
            margin-top: 10px;
            color: #dc3545;
        }

        p {
            margin-top: 10px;
        }

        a {
            color: #007BFF;
        }
    </style>
</head>

<body>
    <div class="login-container">
        <h1>Technician Login</h1>
        <form id="loginForm">
            <input type="text" id="username" name="username" placeholder="Username" required><br>
            <input type="password" id="password" name="password" placeholder="Password" required><br>
            <button type="submit">Login</button>
        </form>
        <div id="message" class="message"></div>
    </div>

    <script>
            document.getElementById("loginForm").addEventListener("submit", function (event) {
                event.preventDefault(); // Prevent form submission
                var username = document.getElementById("username").value;
                var password = document.getElementById("password").value;
 
                // Check if username and password are correct
                if (username === "abclab" && password === "123") {
                    // If correct, redirect to desired page or perform any other action
                    window.location.href = "http://localhost:8080/LAB-ABC-client/technician-dash.jsp";
                } else {
                    // If incorrect, display error message
                    document.getElementById("message").textContent = "Invalid username or password";
                }
            });
</script>
</body>
</html>

