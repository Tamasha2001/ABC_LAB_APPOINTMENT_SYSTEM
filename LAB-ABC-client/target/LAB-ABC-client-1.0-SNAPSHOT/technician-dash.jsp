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
                <a onclick="showContent('uploadReportContent')" href="#uploadReport">View Payments</a>
                
                <div>
                    <button onclick="logout()" style="margin-top:250px; margin-left:150px; background-color: red">Logout</button>
                </div>
            </div>

            <div class="appointment-content" id="uploadReportContent">
                <section id="uploadReport" class="container">
                    <h1>Upload Report</h1>
                    <form id="uploadReportForm" onsubmit="submitReport()">
                        <label for="appointmentId">Appointment ID:</label>
                        <input type="text" id="appointmentId" name="appointmentId" required>

                        <label for="reportFile">Upload PDF Report:</label>
                        <input type="file" id="uploadReportFile" accept=".pdf" required />

                        <button type="submit" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Upload Report</button>
                    </form>
                    
                    <div id="reportUploadResult"></div>
                </section>
            </div>

            <div class="appointment-content" id="manageTestContent">
                <section id="manageTestDetails" class="container">
                    <h1>Manage Test Details</h1>

                    <form id="testDetailsForm">
                        <label for="testDetailsId">Test ID:</label>
                        <input type="text" id="testDetailsId" name="testDetailsId" required>

                        <label for="patientName">Patient Name:</label>
                        <input type="text" id="patientName" name="patientName" required>

                        <label for="testType">Test Type:</label>
                        <select id="testType" name="testType" required>
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
                        <input type="text" id="technicianName" name="technicianName" required>

                        <label for="referringDoctor">Referring Doctor:</label>
                        <input type="text" id="referringDoctor" name="referringDoctor" required>

                        <label for="resultDetails">Result Details:</label>
                        <textarea id="resultDetails" name="resultDetails"></textarea>

                        <div class="button-container" style="display: flex;gap: 40px; max-height: 100px; margin-left: 40px">
                            <button id="btngetTest" onclick="getTest()" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Search</button>
                            <button id="btnaddTest" onclick="addTest()" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Add</button>
                            <button id="btnupdateTest" onclick="updateTest()" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Update</button>
                            <button id="btndeleteTest" onclick="deleteTest()" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Delete</button>
                            <button id="btnclearTestDetails" onclick="clearTestDetails()" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Clear</button>
                            
                        </div>
                    </form>
                    <br><hr><br>

                    <div id="testDetailsTable" class="test-details-table">
                        <!-- Test details table will be dynamically populated here -->
                        <table>
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
                        </table>
                    </div>
                </section>
            </div>

            <div class="appointment-content" id="appointmentsContent">
                <section id="appointments" class="container">
                    <h1>Appointments</h1>
                    <table id="appointmentTable" class="appointment-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Date</th>
                                <th>Time</th>
                                <th>Test Type</th>
                            </tr>
                        </thead>
                        <tbody id="appointmentList" class="appointment-list">
                            <!-- Appointment details will be dynamically populated here -->
                        </tbody>
                    </table>
                </section>
            </div>

            <div class="appointment-content" id="viewPatientsContent">
                <section id="viewPatients" class="container">
                    <h1>View Patients</h1>
                    <table id="appointmentTable" class="appointment-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Date of Birth</th>
                                <th>Gender</th>
                                <th>Email</th>
                                <th>Contact</th>
                            </tr>
                        </thead>
                        <tbody id="patientsList" class="patients-list">
                            <!-- Patient details will be dynamically populated here -->
                        </tbody>
                    </table>
                </section>
            </div>

            <script>
                window.onload = function () {
                    // Set the initial position of the menu to be visible
                    var menu = document.getElementById("sideMenu");
                    menu.style.left = "0px";
                    // Display the appointment form content
                    showContent('appointmentContent');
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


                //Upload report
                function submitReport() {
                    var appointmentId = document.getElementById('appointmentId').value;
                    var reportFileInput = document.getElementById('uploadReportFile');
                    var reportFile = reportFileInput.files[0];
                    if (!appointmentId) {
                        alert('Please enter the Appointment ID.');
                        return;
                    }

                    if (!reportFile) {
                        alert('Please select a PDF report file.');
                        return;
                    }

                    // You can handle the file (e.g., upload to the server) here
                    handleReportUpload(appointmentId, reportFile);
                }

                function handleReportUpload(appointmentId, reportFile) {
                    // Perform any necessary actions here
                    // For demonstration purposes, display a success message
                    var reportUploadResult = document.getElementById('reportUploadResult');
                    reportUploadResult.innerHTML = 'Report uploaded successfully for Appointment ID: ' + appointmentId;
                }

                function handleFileSelect(event) {
                    var fileInput = event.target;
                    var files = fileInput.files;
                    if (files.length > 0) {
                        var file = files[0];
                        if (file.type === 'application/pdf') {
                            readPDFFile(file);
                        } else {
                            alert('Please select a valid PDF file.');
                        }
                    }
                }

                function readPDFFile(file) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        var pdfContent = e.target.result;
                        // Handle the PDF content, e.g., upload to the server or display it
                        displayPDFContent(pdfContent);
                    };
                    reader.readAsDataURL(file);
                }

                function displayPDFContent(pdfContent) {
                    var reportContainer = document.getElementById('report');
                    reportContainer.innerHTML = '<embed src="' + pdfContent + '" type="application/pdf" width="100%" height="600px" />';
                }

                //Manage test details
                const testDetailsUrl = "http://localhost:8080/LAB-ABC-rest-service/resources/test/";

                function getTest() {
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
                                    document.getElementById("resultDetails").value = data.result_details;
                                } else {
                                    alert("Test details not found");
                                }
                            });
                }

                function addTest() {
                    const testDetails = {
                        "test_id": document.getElementById("testDetailsId").value,
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
                        body: JSON.stringify(testDetails)
                    };
                    fetch(testDetailsUrl, options);
                }

                function updateTest() {
                    let test_id = document.getElementById("testDetailsId").value;
                    const testDetails = {
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
                        body: JSON.stringify(testDetails)
                    };
                    fetch(testDetailsUrl + test_id, options);
                }

                function deleteTest() {
                    let test_id = document.getElementById("testDetailsId").value;
                    const options = {
                        method: "DELETE"
                    };
                    fetch(testDetailsUrl + test_id, options);
                }

                function clearTestDetails() {
                    document.getElementById("testDetailsId").value = "";
                    document.getElementById("patientName").value = "";
                    document.getElementById("testType").value = "";
                    document.getElementById("testDate").value = "";
                    document.getElementById("testTime").value = "";
                    document.getElementById("technicianName").value = "";
                    document.getElementById("referringDoctor").value = "";
                    document.getElementById("resultDetails").value = "";
                }

                //Appointment
                document.addEventListener("DOMContentLoaded", function () {
                    // Fetch appointment data from the server (simulated data)
                    fetchAppointments();
                });

                function fetchAppointments() {
                    // Simulated data (replace with actual API or server-side code)
                    const appointmentsData = [
                        //{id: 1, name: "John Doe", date: "2024-03-15", time: "10:00:00", testType: "Blood Test"},
                        // Add more data as needed
                    ];

                    // Populate the appointment table
                    const appointmentTable = document.getElementById("appointmentTable");

                    appointmentsData.forEach(appointment => {
                        const row = appointmentTable.insertRow();
                        row.insertCell(0).textContent = appointment.id;
                        row.insertCell(1).textContent = appointment.name;
                        row.insertCell(2).textContent = appointment.date;
                        row.insertCell(3).textContent = appointment.time;
                        row.insertCell(4).textContent = appointment.testType;
                    });
                }

                //Patient

                function showPatientsContent() {
                    // Fetch and display patient data when the "View Patients" link is clicked
                    fetchPatients();
                }

                function fetchPatients() {
                    // Assuming you have a server endpoint for fetching patient data
                    const patientsUrl = "http://localhost:8080/LAB-ABC-rest-service/resources/Patient/";

                    // Make a GET request to the server
                    fetch(patientsUrl)
                            .then(response => response.json())
                            .then(data => {
                                // Populate the patient table with the received data
                                const patientTable = document.getElementById("patientsTable");
                                patientTable.innerHTML = "<thead><tr><th>ID</th><th>Name</th><th>Date of Birth</th><th>Gender</th><th>Email</th><th>Contact</th></tr></thead>";

                                data.forEach(patient => {
                                    const row = patientTable.insertRow();
                                    row.insertCell(0).textContent = patient.id;
                                    row.insertCell(1).textContent = patient.name;
                                    row.insertCell(2).textContent = patient.dob;
                                    row.insertCell(3).textContent = patient.gender;
                                    row.insertCell(4).textContent = patient.email;
                                    row.insertCell(5).textContent = patient.contact;
                                });
                            })
                            .catch(error => {
                                console.error("Error fetching patient data:", error);
                            });
                }
                
                function logout() {
                window.location.href = "http://localhost:8080/LAB-ABC-client/";
                alert("Logging out...");
            }


            </script>

    </body>
</html>