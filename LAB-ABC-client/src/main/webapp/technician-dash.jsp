<%-- 
    Document   : technician-dash
    Created on : Mar 13, 2024, 2:45:50 PM
    Author     : User
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lab Technician Dashboard</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href="assets/css/technician-dash.css" rel="stylesheet">
        <link href="assets/css/patient-dash.css" rel="stylesheet">
        <link href="assets/css/appo.css" rel="stylesheet">
        <link href="assets/css/viewapp.css" rel="stylesheet">
    </head>
    <body>
        <div class="dashboard-container">
            <div class="header" style="background-color: #2c3e50; position: fixed;">
                <h1> <span class="menu-icon" onclick="toggleMenu()">&#9776; </span> | Technician Dashboard</h1>
            </div>

            <div class="menu" id="sideMenu" style="margin-top: 50px;">
                <a onclick="showContent('uploadReportContent')" href="#uploadReport">Upload Report</a>
                <a onclick="showContent('manageTestContent')" href="#manageTestDetails">Manage Test Details</a>
                <a onclick="showContent('appointmentsContent')" href="#appointments">View Appointments</a>
                <a onclick="showContent('viewPatientsContent')" href="#viewPatients">View Patients</a>
                <a onclick="showContent('paymentContent')" href="#payment">View Payments</a>

                <button onclick="logout()" style="margin-top:190px; margin-left:150px; background-color: red">Logout</button>

            </div>


            <div class="technician-content" id="uploadReportContent">
                <section id="uploadReport" class="container">
                    <h1>Upload Report</h1>
                    <form id="uploadReportForm">

                        <label for="reportId">Report ID:</label>
                        <input type="text" id="reportId" name="reportId" required>

                        <label for="patientName">Patient Name:</label>
                        <input type="text" id="patientName" name="patientName" required>

                        <label for="uploadReportFile">Upload PDF Report:</label>
                        <input type="file" id="uploadReportFile" accept=".pdf" required />

                        <button id="btnUploadReport" onclick="addReport(event)" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Upload Report</button>
                    </form>
                </section>
            </div>

            <div class="technician-content" id="manageTestContent">
                <section id="manageTestDetails" class="container">
                    <h1>Manage Test Details</h1>

                    <form id="testDetailsForm">
                        <label for="testDetailsId">Test ID:</label>
                        <input type="text" id="testDetailsId" name="testDetailsId" required>

                        <label for="patientName">Patient Name:</label>
                        <input type="text" id="patientName" name="patientName" required>

                        <label for="testType">Test Type:</label>
                        <select id="testType" name="testType" required>
                            <option value="select">Select test type</option>
                            <option value="Blood Test">Blood Test</option>
                            <option value="Urinalysis">Urinalysis</option>
                            <option value="Imaging Tests">Imaging Tests</option>
                            <option value="Microbiology Tests">Microbiology Tests</option>
                            <option value="Liver Function Tests">Liver Function Tests</option>
                            <option value="Genetic Tests">Genetic Tests</option>
                        </select>

                        <label for="testDate">Test Date:</label>
                        <input type="date" id="testDate" name="testDate" required>

                        <label for="testTime">Test Time:</label>
                        <input type="time" id="testTime" name="testTime" required>

                        <label for="technicianName">Technician Name:</label>
                        <select id="technicianName" name="technicianName" required>
                            <option value="select">Select technician</option>
                            <option value="D.I.K.Thilakarathna">D.I.K.Thilakarathna</option>
                            <option value="A.S.Perera">A.S.Perera</option>
                            <option value="D.M.Silva">D.M.Silva</option>
                            <option value="P.Anuththara">P.Anuththara </option>
                            <option value="C.T.Attanayaka">C.T.Attanayaka</option>
                            <option value="Y.K.Alwis">Y.K.Alwis</option>
                        </select>

                        <label for="referringDoctor">Referring Doctor:</label>
                        <select id="referringDoctor" name="referringDoctor" required>
                            <option value="select">Select doctor</option>
                            <option value="Dr.Ananda">Dr.Ananda</option>
                            <option value="Dr.Lakshman">Dr.Lakshman</option>
                            <option value="Dr.Silva">Dr.Silva</option>
                            <option value="Dr.Senadi">Dr.Senadi </option>
                            <option value="Dr.Ratnayaka">Dr.Ratnayaka</option>
                        </select>

                        <label for="resultDetails">Result Details:</label>
                        <textarea id="resultDetails" name="resultDetails"></textarea>
                        <div class="button-container" style="display: flex;gap: 40px; max-height: 100px; margin-left: 40px">
                            <button id="btngetTest" onclick="getTest(event)" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Search</button>
                            <button id="btnaddTest" onclick="addTest(event)" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Add</button>
                            <button id="btnupdateTest" onclick="updateTest(event)" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Update</button>
                            <button id="btndeleteTest" onclick="deleteTest(event)" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Delete</button>
                            <button id="btnclearTestDetails" onclick="clearTestDetails(event)" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Clear</button>

                        </div>
                    </form>
                </section>

                <div class="button-container" id="manageTestContent">
                    <section id="testdetails" class="containers">
                        <h2 class="dashboard-heading">View Test Details</h2>
                        <br>
                        <table id="testDetailsTable" class="test-details-table">
                            <thead>
                                <tr>
                                    <th>Test ID</th>
                                    <th>Patient Name</th>
                                    <th>Test Type</th>
                                    <th>Test Date</th>
                                    <th>Test Time</th>
                                    <th>Technician Name</th>
                                    <th>Referring Doctor</th>
                                    <th>Result Details</th>
                                </tr>
                            </thead>
                            <tbody id="testTableBody">
                            </tbody>
                        </table>
                    </section>
                </div>

            </div>

            <div class="technician-content" id="appointmentsContent">
                <section id="appointments" class="container">
                    <h2 class="dashboard-heading">View Appointments</h2>
                    <br>
                    <table id="appointmentsTable" class="appointment-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Date</th>
                                <th>Time</th>
                                <th>Test Type</th>
                            </tr>
                        </thead>
                        <tbody id="appointmentsTableBody">
                        </tbody>
                    </table>
                </section>
            </div>

            <div class="technician-content" id="viewPatientsContent">
                <section id="viewPatients" class="containerpt">
                    <h2 class="dashboard-heading">View Patients</h2>
                    <br>
                    <table id="patientTable" class="patient-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Date of Birth</th>
                                <th>Gender</th>
                                <th>Email</th>
                                <th hidden>Password</th>
                                <th>Contact</th>
                            </tr>
                        </thead>
                        <tbody id="patientsList">
                        </tbody>
                    </table>
                </section>
            </div>

            <div class="technician-content" id="paymentContent">
                <section id="payment" class="containerp">
                    <h2 class="dashboard-heading">View Payments</h2>
                    <br>
                    <table id="paymentTable" class="payment-table">
                        <thead>
                            <tr>
                                <th>Payer ID</th>
                                <th>Patient Name</th>
                                <th>Amount</th>
                                <th>Card no</th>
                                <th>Expire Date</th>
                                <th>CVV</th>
                            </tr>
                        </thead>
                        <tbody id="paymentTableBody">
                        </tbody>
                    </table>
                </section>
            </div>

        </div>

        <script>
            window.onload = function () {
                // Set the initial position of the menu to be visible
                var menu = document.getElementById("sideMenu");
                menu.style.left = "0px";
                // Display the appointment form content
                showContent('uploadReportContent');
                // Add an event listener for file input change
                document.getElementById('uploadReportFile').addEventListener('change', handleFileSelect);
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
                var contentElements = document.querySelectorAll('.technician-content');
                for (var i = 0; i < contentElements.length; i++) {
                    contentElements[i].style.display = 'none';
                }

                var selectedContent = document.getElementById(contentId);
                selectedContent.style.display = 'block';
                if (contentId === 'manageTestContent') {
                    fetchAppointmentDetails();
                }
            }


//***************************************************************************************************************

//            const reportDetailsUrl = "http://localhost:8080/LAB-ABC-rest-service/resources/report/";
//
//            function addReport(event) {
//                event.preventDefault(); // Prevent the form from submitting normally
//
//                // Get the patient ID and PDF file data
//                const patientId = document.getElementById("patientId").value;
//                const uploadReportFile = document.getElementById("uploadReportFile");
//                const file = uploadReportFile.files[0];
//
//                // Check if a file is selected
//                if (!file) {
//                    alert("Please select a file.");
//                    return false;
//                }
//
//                // Check if the selected file is a PDF
//                if (file.type !== 'application/pdf') {
//                    alert('Please select a valid PDF file.');
//                    return false;
//                }
//
//                // Read the PDF file as data URL
//                var reader = new FileReader();
//                reader.onload = function (e) {
//                    var pdfContent = e.target.result;
//
//                    // Prepare the report object
//                    const report = {
//                        "id": patientId,
//                        "pdf_file": pdfContent
//                    };
//
//                    // Send the report data to the server
//                    fetch(reportDetailsUrl, {
//                        method: "POST",
//                        headers: {
//                            "Content-Type": "application/json"
//                        },
//                        body: JSON.stringify(report)
//                    })
//                            .then(response => {
//                                if (response.ok) {
//                                    displayMessage("Report upload successful!", "success");
//                                    document.getElementById("uploadReportForm").reset(); // Reset the form after successful upload
//                                } else {
//                                    response.json().then(data => {
//                                        const errorMessage = data.message || "Upload failed. Please try again.";
//                                        displayMessage(errorMessage, "error");
//                                    });
//                                }
//                            })
//                            .catch(error => {
//                                console.error('Error:', error);
//                                displayMessage("Upload failed. Please try again later.", "error");
//                            });
//                };
//                reader.readAsDataURL(file);
//
//                return false;
//            }
//
//// Function to display a message
//            function displayMessage(message, type) {
//                // Implement your message display logic here
//                console.log(message);
//            }
//**************************************************************************************************

            const reportDetailsUrl = "http://localhost:8080/LAB-ABC-rest-service/resources/report/";

            function addReport() {
                event.preventDefault();
                let rid = document.getElementById("reportId").value;

                // Check if the test ID already exists
                fetch(reportDetailsUrl + rid)
                        .then(response => {
                            if (response.ok) {
                                alert("Report ID is already in use. Please choose a different ID.");
                            } else {
                                const person = {
                                    "rid": rid,
                                    "patient_name": document.getElementById("patientName").value,
                                    "pdf_file": document.getElementById("uploadReportFile").value
                                };

                                const options = {
                                    method: "POST",
                                    headers: {
                                        "content-type": "application/json"
                                    },
                                    body: JSON.stringify(person)
                                };

                                fetch(reportDetailsUrl, options)
                                        .then(response => {
                                            if (response.ok) {
                                                alert("Uploading the report is successful!");
                                                document.getElementById("uploadReportForm").reset(); 
                                            } else {
                                                throw new Error("Failed to add report.");
                                            }
                                        })
                                        .catch(error => {
                                            console.error('Error:', error);
                                            alert("An error occurred. Please try again later.");
                                        });
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert("An error occurred. Please try again later.");
                        });
            }

//*****************************Manage test details***************************************************************

            const testDetailsUrl = "http://localhost:8080/LAB-ABC-rest-service/resources/test/";

            function getTest() {
                event.preventDefault();
                let test_id = document.getElementById("testDetailsId").value;
                const options = {
                    method: "GET"
                };
                fetch(testDetailsUrl + test_id, options)
                        .then(res => res.json())
                        .then(data => {
                            if (data !== null) {
                                document.getElementById("patientName").value = data.patient_name;
                                document.getElementById("testType").value = data.test_type;
                                document.getElementById("testDate").value = data.test_date;
                                document.getElementById("testTime").value = data.test_time;
                                document.getElementById("technicianName").value = data.technician_name;
                                document.getElementById("referringDoctor").value = data.referring_doctor;
                                document.getElementById("resultDetails").value = data.result_DETAILS;
                            } else {
                                alert("Test details not found");
                            }
                        });
            }

            function addTest() {
                event.preventDefault();
                let testId = document.getElementById("testDetailsId").value;

                // Check if the test ID already exists
                fetch(testDetailsUrl + testId)
                        .then(response => {
                            if (response.ok) {
                                // If ID exists, show alert for duplicate ID
                                alert("Test ID is already in use. Please choose a different ID.");
                            } else {
                                // If ID doesn't exist, proceed with adding the test
                                const person = {
                                    "test_id": testId,
                                    "patient_name": document.getElementById("patientName").value,
                                    "test_type": document.getElementById("testType").value,
                                    "test_date": document.getElementById("testDate").value,
                                    "test_time": document.getElementById("testTime").value,
                                    "technician_name": document.getElementById("technicianName").value,
                                    "referring_doctor": document.getElementById("referringDoctor").value,
                                    "result_DETAILS": document.getElementById("resultDetails").value
                                };

                                const options = {
                                    method: "POST",
                                    headers: {
                                        "content-type": "application/json"
                                    },
                                    body: JSON.stringify(person)
                                };

                                fetch(testDetailsUrl, options)
                                        .then(response => {
                                            if (response.ok) {
                                                alert("Test details added successfully!");
                                                document.getElementById("testDetailsForm").reset(); // Reset the form
                                            } else {
                                                // Test addition failed
                                                throw new Error("Failed to add test.");
                                            }
                                        })
                                        .catch(error => {
                                            console.error('Error:', error);
                                            alert("An error occurred. Please try again later.");
                                        });
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert("An error occurred. Please try again later.");
                        });
            }



            function updateTest() {
                event.preventDefault();

                let test_id = document.getElementById("testDetailsId").value;
                const person = {
                    "test_id": test_id,
                    "patient_name": document.getElementById("patientName").value,
                    "test_type": document.getElementById("testType").value,
                    "test_date": document.getElementById("testDate").value,
                    "test_time": document.getElementById("testTime").value,
                    "technician_name": document.getElementById("technicianName").value,
                    "referring_doctor": document.getElementById("referringDoctor").value,
                    "result_DETAILS": document.getElementById("resultDetails").value
                };
                const options = {
                    method: "PUT",
                    headers: {
                        "content-type": "application/json"
                    },
                    body: JSON.stringify(person)
                };

                fetch(testDetailsUrl + test_id, options)
                        .then(response => {
                            if (response.ok) {
                                // Test update successful
                                alert("Test details updated successfully!");
                                document.getElementById("testDetailsForm").reset();
                            } else {
                                // Test update failed
                                throw new Error("Failed to update test details. Please try again later.");
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert("An error occurred. Please try again later.");
                        });
            }


            function deleteTest(event) {
                event.preventDefault();

                let test_id = document.getElementById("testDetailsId").value;

                if (!test_id) {
                    alert("Please enter a valid Test ID.");
                    return;
                }

                fetch(testDetailsUrl + test_id)
                        .then(response => {
                            if (response.ok) {
                                const options = {
                                    method: "DELETE"
                                };

                                return fetch(testDetailsUrl + test_id, options);
                            } else {
                                throw new Error("Test ID does not exist.");
                            }
                        })
                        .then(response => {
                            if (response.ok) {
                                alert("Data deleted successfully!");
                                document.getElementById("testDetailsForm").reset();
                            } else {
                                throw new Error("Failed to delete data.");
                            }
                        })
                        .catch(error => {
                            console.error("Error:", error);
                            alert("Failed to delete data. " + error.message);
                        });
            }



            function clearTestDetails() {
                event.preventDefault();
                document.getElementById("testDetailsForm").reset();
            }


// Function to fetch and display all test details
            $(document).ready(function () {
                // Fetch data from API
                fetch('http://localhost:8080/LAB-ABC-rest-service/resources/test')
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Network response was not ok');
                            }
                            return response.json();
                        })
                        .then(data => {
                            var tableBody = $('#testTableBody');

                            // Clear existing table rows
                            tableBody.empty();

                            if (data.length === 0) {
                                tableBody.append('<tr><td colspan="5">No test details found</td></tr>');
                            } else {
                                // Populate table rows with appointments data
                                data.forEach(function (test) {
                                    var row = '<tr>' +
                                            '<td>' + test.test_id + '</td>' +
                                            '<td>' + test.patient_name + '</td>' +
                                            '<td>' + test.test_type + '</td>' +
                                            '<td>' + test.test_date + '</td>' +
                                            '<td>' + test.test_time + '</td>' +
                                            '<td>' + test.technician_name + '</td>' +
                                            '<td>' + test.referring_doctor + '</td>' +
                                            '<td>' + test.result_DETAILS + '</td>' +
                                            '</tr>';
                                    tableBody.append(row);
                                });
                            }
                        })
                        .catch(error => {
                            console.error('Error fetching or parsing data:', error);
                            // Handle error, e.g., display a message to the user
                        });
            });



//***************************************Appointment*************************************************************
            $(document).ready(function () {
                // Fetch data from API
                fetch('http://localhost:8080/LAB-ABC-rest-service/resources/appointment')
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Network response was not ok');
                            }
                            return response.json();
                        })
                        .then(data => {
                            var tableBody = $('#appointmentsTableBody');

                            // Clear existing table rows
                            tableBody.empty();

                            if (data.length === 0) {
                                tableBody.append('<tr><td colspan="5">No appointments found</td></tr>');
                            } else {
                                // Populate table rows with appointments data
                                data.forEach(function (appointment) {
                                    var row = '<tr>' +
                                            '<td>' + appointment.apid + '</td>' +
                                            '<td>' + appointment.patient_name + '</td>' +
                                            '<td>' + appointment.date + '</td>' +
                                            '<td>' + appointment.time + '</td>' +
                                            '<td>' + appointment.test + '</td>' +
                                            '</tr>';
                                    tableBody.append(row);
                                });
                            }
                        })
                        .catch(error => {
                            console.error('Error fetching or parsing data:', error);
                            // Handle error, e.g., display a message to the user
                        });
            });


//************************************Patient*********************************************************************            
            $(document).ready(function () {
                // Fetch data from API
                fetch('http://localhost:8080/LAB-ABC-rest-service/resources/patient')
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Network response was not ok');
                            }
                            return response.json();
                        })
                        .then(data => {
                            var tableBody = $('#patientsList');

                            tableBody.empty();

                            if (data.length === 0) {
                                tableBody.append('<tr><td colspan="5">No patient found</td></tr>');
                            } else {
                                data.forEach(function (patient) {
                                    var row = '<tr>' +
                                            '<td>' + patient.id + '</td>' +
                                            '<td>' + patient.p_name + '</td>' +
                                            '<td>' + patient.dob + '</td>' +
                                            '<td>' + patient.gender + '</td>' +
                                            '<td>' + patient.email + '</td>' +
                                            '<td>' + patient.contact + '</td>' +
                                            '</tr>';
                                    tableBody.append(row);
                                });
                            }
                        })
                        .catch(error => {
                            console.error('Error fetching or parsing data:', error);
                            // Handle error, e.g., display a message to the user
                        });
            });

//***************************************************************************************************************

            $(document).ready(function () {
                fetch('http://localhost:8080/LAB-ABC-rest-service/resources/payment')
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Network response was not ok');
                            }
                            return response.json();
                        })
                        .then(data => {
                            var tableBody = $('#paymentTableBody');

                            tableBody.empty();

                            if (data.length === 0) {
                                tableBody.append('<tr><td colspan="5">No payment details found</td></tr>');
                            } else {
                                data.forEach(function (payment) {
                                    var row = '<tr>' +
                                            '<td>' + payment.payid + '</td>' +
                                            '<td>' + payment.patient_name + '</td>' +
                                            '<td>' + payment.amount + '</td>' +
                                            '<td>' + payment.cardno + '</td>' +
                                            '<td>' + payment.exdate + '</td>' +
                                            '<td>' + payment.cvv + '</td>' +
                                            '</tr>';
                                    tableBody.append(row);
                                });
                            }
                        })
                        .catch(error => {
                            console.error('Error fetching or parsing data:', error);
                            // Handle error, e.g., display a message to the user
                        });
            });


            function logout() {
                window.location.href = "http://localhost:8080/LAB-ABC-client/";
                alert("Logging out...");
            }

//$('.payment-button').click(function () {
//                // Redirect to the payment dashboard URL
//                window.location.href = "payment.jsp"; // Replace "payment.jsp" with the actual URL
//                 Clear payment form
//                document.getElementById("paymentForm").reset();
//                // Navigate back to the previous page
//                                    window.history.back();
//                window.location.href = "http://localhost:8080/LAB-ABC-client/patient-dash.jsp#downloadReport";
//            });
        </script>

    </body>
</html>