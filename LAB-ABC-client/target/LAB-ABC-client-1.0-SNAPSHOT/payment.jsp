<%-- 
    Document   : payment
    Created on : Mar 24, 2024, 10:06:37 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Payment Form</title>

        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f9f9f9;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .container {
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                padding: 40px;
                width: 400px;
            }
            h2 {
                color: #333;
                font-size: 24px;
                text-align: center;
                margin-bottom: 20px;
            }
            .form-group {
                margin-bottom: 20px;
            }
            label {
                color: #666;
                font-size: 16px;
                margin-bottom: 5px;
                display: block;
            }
            input[type="text"],
            input[type="number"],
            input[type="submit"] {
                width: 100%;
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #ccc;
                font-size: 16px;
                box-sizing: border-box;
                transition: border-color 0.3s ease;
            }
            input[type="text"]:focus,
            input[type="number"]:focus {
                outline: none;
                border-color: #007bff;
            }
            input[type="submit"] {
                background-color: #007bff;
                color: #fff;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }
            input[type="submit"]:hover {
                background-color: #0056b3;
            }
            .form-group button {
                width: 100%;
                padding: 12px;
                border-radius: 5px;
                background-color: #007bff;
                color: #fff;
                font-size: 16px;
                border: none;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .form-group button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <h2>Payment Form</h2>
            <form id="paymentForm">
                <div class="form-group">
                    <label for="patientName">Patient Name:</label>
                    <input type="text" id="patientName" name="patientName" required>
                </div>
                <div class="form-group">
                    <label for="amount">Amount:</label>
                    <input type="number" id="amount" name="amount" min="0" step="0.01" required>
                </div>
                <div class="form-group">
                    <label for="cardNumber">Card Number:</label>
                    <input type="text" id="cardNumber" name="cardNumber" placeholder="**** **** **** ****" pattern="\d{4} \d{4} \d{4} \d{4}" required>
                </div>
                <div class="form-group">
                    <label for="expiryDate">Expiry Date:</label>
                    <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" pattern="\d{2}/\d{2}" required>
                </div>
                <div class="form-group">
                    <label for="cvv">CVV:</label>
                    <input type="text" id="cvv" name="cvv" maxlength="3" required>
                </div>
                <div class="form-group">
                    <button onclick="addPayment(event)">Make Payment</button>

                </div>
            </form>
        </div>

        <script>
            const patientDetailsUrl = "http://localhost:8080/LAB-ABC-rest-service/resources/payment/";

            function addPayment() {
                event.preventDefault();

                const person = {
                    "patient_name": document.getElementById("patientName").value,
                    "amount": document.getElementById("amount").value,
                    "cardno": document.getElementById("cardNumber").value,
                    "exdate": document.getElementById("expiryDate").value,
                    "cvv": document.getElementById("cvv").value
                };

                const options = {
                    method: "POST",
                    headers: {
                        "content-type": "application/json"
                    },
                    body: JSON.stringify(person)
                };

                fetch(patientDetailsUrl, options)
                        .then(response => {
                            if (response.ok) {
                                alert("Payment successfully!");
                                document.getElementById("paymentForm").reset();
                                window.history.back();

                            } else {
                                throw new Error("Payment successfully!");
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert("An error occurred. Please try again later.");
                        });
            }

        </script>

    </body>
</html>
