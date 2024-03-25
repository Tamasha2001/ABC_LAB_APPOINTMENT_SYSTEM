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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
                <div>
                    <button onclick="logout()" style="margin-top:250px; margin-left:150px; background-color: red">Logout</button>
                </div>
            </div>

            <!--**************************** Make an appointment ***************************************-->

            <div class="appointment-content" id="appointmentContent">
<!--                <section id="appointment" class="container">-->
                    <div class="container">
                        <h2 style="text-align: center">Lab Appointment Form</h2>
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

                            <button style="font-weight: bold; font-size: 15px; background-color: #2c3e50;" id="btnmakeAppointment" onclick="makeAppointment()">Submit Appointment</button>

                        </form>
                    </div>
<!--                </section>-->
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
                    <div class="containerd">
                        <h2>Medical Report</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>Report ID</th>
                                    <th>Patient Name</th>
                                    <th>PDF Report</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody id="reportTableBody">
                                <tr>
                                    <td>12345</td>
                                    <td>John Doe</td>
                                    <td><a href="Medical/Medical Report.pdf" target="_blank">View Report</a></td>
                                    <td>
                                        <button class="button download-button" disabled>Download</button>
                                        <button  id="submit"  class="button payment-button"><a href="payment.jsp">Pay</a></button>

                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
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

                if (checkForConflicts(person.date, person.time)) {
                    showNotification("Another patient has already booked the same date and time. Please choose another slot.");
                    return;
                }

                fetch(url, options)
                        .then(response => {
                            if (response.ok) {
                                showNotification("Appointment booked successfully!");
                            } else {
                                showNotification("Failed to make appointment. Please try again later.");
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            showNotification("An error occurred. Please try again later.");
                        });
            }

            function checkForConflicts(date, time) {

                return false;
            }

            function showNotification(message) {
                alert(message);
            }
//**************************************************************************************************************
            $(document).ready(function () {
                // Event listener for the "View Report" link
                $('#reportTableBody').on('click', 'a', function (event) {
                    // Prevent the default action (i.e., following the link)
                    event.preventDefault();

                    window.location.href = "Medical/Medical Report.pdf";
                    var pdfFileUrl = $(this).attr('href');

                    // Open the PDF file in a new tab
                    window.open(pdfFileUrl, '_blank');
                });

                // Event listener for the "Download" button
                $('#reportTableBody').on('click', '.download-button', function () {
                    // Get the URL of the report file
                    var reportUrl = $(this).closest('tr').find('a').attr('href');

                    // Trigger the download
                    downloadReport(reportUrl);
                });

                // Fetch report data from the server
                fetch('http://localhost:8080/LAB-ABC-rest-service/resources/report')
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Network response was not ok');
                            }
                            return response.json();
                        })
                        .then(data => {
                            var tableBody = $('#reportTableBody');
                            tableBody.empty();

                            if (data.length === 0) {
                                tableBody.append('<tr><td colspan="4">No report details found</td></tr>');
                            } else {
                                data.forEach(function (report) {
                                    var paidButton = report.paid ? "Paid" : '<button class="button payment-button" data-report-id="' + report.rid + '">Pay</button>';
                                    var row = '<tr>' +
                                            '<td>' + report.rid + '</td>' +
                                            '<td>' + report.patient_name + '</td>' +
                                            '<td><a href="' + report.pdf_file + '" target="_blank">View Report</a></td>' +
                                            '<td>' +
                                            paidButton +
                                            ' | ' +
                                            '<button class="button download-button" data-report-id="' + report.rid + '">Download</button>' +
                                            '</td>' +
                                            '</tr>';
                                    tableBody.append(row);
                                });

                                $('.payment-button').click(function () {
                                    var reportId = $(this).data('report-id');
                                    window.location.href = "payment.jsp"; // Replace "payment.jsp" with the actual URL
                                    document.getElementById("paymentForm").reset();
                                    window.history.back();
                                    window.location.href = "http://localhost:8080/LAB-ABC-client/patient-dash.jsp#downloadReport";
                                });

                                $('.download-button').click(function () {
                                    alert("Downloading report...");
                                    // You can implement download functionality here
                                });

                                // Check if the URL contains a parameter indicating payment success
                                var urlParams = new URLSearchParams(window.location.search);
                                var successParam = urlParams.get('success');
                                if (successParam === 'true') {
                                    // Change the "Pay" button to "Paid"
                                    $('.payment-button').text("Paid").removeClass("payment-button").addClass("paid-button");
                                }
                            }
                        })
                        .catch(error => {
                            console.error('Error fetching or parsing data:', error);
                        });
            });

            function downloadReport(reportUrl) {
                // Create an invisible anchor element
                var downloadLink = document.createElement('a');
                downloadLink.style.display = 'none';
                downloadLink.href = reportUrl;
                downloadLink.download = reportUrl.split('/').pop(); // Extracts the filename for download
                document.body.appendChild(downloadLink);

                // Trigger the click event on the anchor element
                downloadLink.click();

                // Clean up
                document.body.removeChild(downloadLink);
            }

//**************************************************************************************************************            
            function logout() {
                window.location.href = "http://localhost:8080/LAB-ABC-client/";
                alert("Logging out...");
            }

//            $('.payment-button').click(function () {
//                // Redirect to the payment dashboard URL
//                window.location.href = "payment.jsp"; // Replace "payment.jsp" with the actual URL
//                // Clear payment form
//                document.getElementById("paymentForm").reset();
//                // Navigate back to the previous page
////                                    window.history.back();
//                window.location.href = "http://localhost:8080/LAB-ABC-client/patient-dash.jsp#downloadReport";
//            });
        </script>
    </body>
</html>
