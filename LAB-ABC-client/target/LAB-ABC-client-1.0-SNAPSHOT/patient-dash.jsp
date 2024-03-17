<%-- 
    Document   : patient-dash
    Created on : Mar 11, 2024, 5:52:17 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lab Appointment System</title>
        <link href="assets/css/patient-dash.css" rel="stylesheet">
        <link href="assets/css/appo.css" rel="stylesheet">
    </head>

    <body>
        <div class="dashboard-container">
            <div class="header" style="background-color: #2c3e50; position: fixed;">
                <h1> <span class="menu-icon" onclick="toggleMenu()">&#9776; </span> | Patient Dashboard</h1>
            </div>

            <div class="menu" id="sideMenu" style="margin-top: 50px;"> <!-- Adjusted margin-top value -->
                <a onclick="showContent('appointmentContent')" href="#appointment">Make an Appointment</a>
                <a onclick="showContent('viewAppointmentContent')" href="#viewAppointment">View Appointments</a>
                <a onclick="showContent('downloadReportContent')" href="#downloadReport">Download Your Report</a>
                <a onclick="showContent('payment-content')" href="#paymentSection">Patient Payments</a>
                <div>
                    <button onclick="logout()" style="margin-top:250px; margin-left:150px; background-color: red">Logout</button>
                </div>
            </div>

            <!--**************************** Make an appointment ***************************************-->

            <div class="appointment-content" id="appointmentContent">
                <section id="appointment" class="container">
                    <h1>ABC Lab Appointment</h1>
                    <div class="container">
                        <h1>Lab Appointment Form</h1>
                        <form id="appointmentForm">
                            <label for="patientName">Patient Name:</label>
                            <input type="text" id="patientName" name="patientName" required>

                            <label for="appointmentDate">Date:</label>
                            <input type="date" id="appointmentDate" name="appointmentDate" min="<%=java.time.LocalDate.now()%>" required>

                            <label for="appointmentTime">Time:</label>
                            <input type="time" id="appointmentTime" name="appointmentTime" required>

                            <label for="testType">Test Type:</label>
                            <select id="testType" name="testType" required>
                                <option value="bloodTests">Blood Tests</option>
                                <option value="urinalysis">Urinalysis</option>
                                <option value="imagingTests">Imaging Tests</option>
                                <option value="microbiologyTests">Microbiology Tests</option>
                                <option value="liverFunctionTests">Liver Function Tests</option>
                                <option value="geneticTests">Genetic Tests</option>
                            </select>

                            <button id="btnmakeAppointment" onclick="makeAppointment()">Submit Appointment</button>
                        </form>
                    </div>
                </section>
            </div>

            <!--**************************** View an appointment ***************************************-->

            <div class="appointment-content" id="viewAppointmentContent">
                <section id="viewAppointment" class="container">
                    <h1>Your Appointments</h1>
                    <div id="appointmentList" class="appointment-list">
                        <!-- Appointment details will be dynamically populated here -->
                    </div>
                </section>
            </div>

            <!--**************************** Download Your Report ***************************************-->

            <div class="appointment-content" id="downloadReportContent">
                <section id="downloadReport" class="container">
                    <h1>Download Your Report</h1>
                    <button onclick="downloadReport()">Download Report</button>
                </section>
            </div>

            <!--**************************** Patient Payments ***************************************-->

            <div class="appointment-content" id="payment-content">
                <section id="paymentSection" class="container">
                    <h1>Patient Payments</h1>
                    <form id="paymentForm" onsubmit="submitPayment(event)">
                        <label for="patientName">Patient Name:</label>
                        <input type="text" id="patientName" name="patientName" required>

                        <label for="amount">Amount:</label>
                        <input type="number" id="amount" name="amount" min="0" step="0.01" required>

                        <label for="cardNumber">Card Number:</label>
                        <input type="text" id="cardNumber" name="cardNumber" placeholder="**** **** **** ****" pattern="\d{4} \d{4} \d{4} \d{4}" required>

                        <label for="expiryDate">Expiry Date:</label>
                        <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" pattern="\d{2}/\d{2}" required>

                        <label for="cvv">CVV:</label>
                        <input type="text" id="cvv" name="cvv" maxlength="3" required>

                        <button type="submit">Make Payment</button>
                    </form>
                    <div id="paymentResult"></div>
                </section>
            </div>
        </div>

        <script>
            window.onload = function () {
                // Set the initial position of the menu to be visible
                var menu = document.getElementById("sideMenu");
                menu.style.left = "0px";

                // Display the appointment form content
                showContent('appointmentContent');
            };

            function toggleMenu() {
                var menu = document.getElementById("sideMenu");
                if (menu.style.left === "0px") {
                    menu.style.left = "-250px";
                } else {
                    menu.style.left = "0px";
                }
            }

            function showContent(contentId) {
                var contentElements = document.querySelectorAll('.appointment-content');
                for (var i = 0; i < contentElements.length; i++) {
                    contentElements[i].style.display = 'none';
                }

                var selectedContent = document.getElementById(contentId);
                selectedContent.style.display = 'block';

                if (contentId === 'viewAppointmentContent') {
                    fetchAppointmentDetails();
                }
            }


//********************************* appoitment by patient ************************************************
           const url = "http://localhost:8080/LAB-ABC-rest-service/resources/appointment/";
            function makeAppointment() {
                const person = {
                    "patient_name": document.getElementById("patientName").value,
                    "date": document.getElementById("appointmentDate").value,
                    "time": document.getElementById("appointmentTime").value,
                    "test": document.getElementById("testType").value
                };
 
                const options = {
                    method: "POST",
                    headers: {
                        "content-type": "application/json"
                    },
                    body: JSON.stringify(person)
                };
 
                fetch(url, options);
 
            }

            function logout() {
                window.location.href = "http://localhost:8080/LAB-ABC-client/";
                alert("Logging out...");
            }

        </script>
    </body>
</html>
