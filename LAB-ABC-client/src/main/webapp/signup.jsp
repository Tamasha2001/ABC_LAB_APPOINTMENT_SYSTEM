<%-- 
    Document   : signup
    Created on : Mar 11, 2024, 12:32:07 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up</title>

        <link href="assets/css/signup.css" rel="stylesheet">


        <script>
            const url = "http://localhost:8080/LAB-ABC-rest-service/resources/patient/";
            function addPatient() {
                const person = {
                    "p_name": document.getElementById("name").value,
                    "dob": document.getElementById("dob").value,
                    "gender": document.getElementById("gender").value,
                    "email": document.getElementById("email").value,
                    "password": document.getElementById("password").value,
                    "contact": document.getElementById("contact").value
                };

                const options = {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify(person)
                };

               fetch(url, options)
            .then(response => {
                if (response.ok) {
                    displayMessage("Signup successful!", "success");
                } else {
                    response.json().then(data => {
                        const errorMessage = data.message || "Signup failed. Please try again.";
                        displayMessage(errorMessage, "error");
                    });
                }
            })
            .catch(error => {
                console.error('Error:', error);
                displayMessage("Signup failed. Please try again later.", "error");
            });

        return false;
            }
            
            function clearPatient() {
                document.getElementById("name").value = "";
                document.getElementById("dob").value = "";
                document.getElementById("gender").value = "";
                document.getElementById("email").value = "";
                document.getElementById("password").value = "";
                document.getElementById("contact").value = "";
            }
            

        </script>
        
    </head>
    <body>
        <div class="signup-container">
            <h2>Sign Up</h2>
            <form class="signup-form">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>

                <label for="dob">Date of Birth:</label>
                <input type="date" id="dob" name="dob" required>

                <label for="gender">Gender:</label>
                <select id="gender" name="gender" required>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <label for="contact">Contact:</label>
                <input type="text" id="contact" name="contact" required>

                <button id='btnGetPatient' onclick='addPatient()'>Sign Up </button>
                <button id='btnClearPatient' onclick='clearPatient()'>Clear</button>  
                
                <p>You have an account? <a href="p_login.jsp">Login</a></p>
            </form>
        </div>
    </body>
</html>
