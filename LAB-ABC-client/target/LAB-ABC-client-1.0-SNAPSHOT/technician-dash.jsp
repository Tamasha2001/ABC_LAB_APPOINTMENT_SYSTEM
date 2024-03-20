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

                <button onclick="logout()" style="margin-top:190px; margin-left:150px; background-color: red">Logout</button>
               
            </div>
        

            <div class="technician-content" id="uploadReportContent">
                <section id="uploadReport" class="container">
                    <h1>Upload Report</h1>
                    <form id="uploadReportForm" onsubmit="submitReport()">
                        <label for="appointmentId">Patient ID:</label>
                        <input type="text" id="appointmentId" name="appointmentId" required>

                        <label for="reportFile">Upload PDF Report:</label>
                        <input type="file" id="uploadReportFile" accept=".pdf" required />

                        <button id="btnsubmitReport" onclick="submitReport() style ="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Upload Report</button>

                    </form>

                    <div id="reportUploadResult"></div>
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
                            <option value="D.I.K.Thilakarathna">D.I.K.Thilakarathna</option>
                            <option value="A.S.Perera">A.S.Perera</option>
                            <option value="D.M.Silva">D.M.Silva</option>
                            <option value="P.Anuththara">P.Anuththara </option>
                            <option value="C.T.Attanayaka">C.T.Attanayaka</option>
                            <option value="Y.K.Alwis">Y.K.Alwis</option>
                        </select>

                        <label for="referringDoctor">Referring Doctor:</label>
                        <select id="referringDoctor" name="referringDoctor" required>
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
                    <br><hr><br>

                    <div class="button-container">
                        <button id="btnViewAll" onclick="viewAll()">View All</button>
                    </div>
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

            <div class="technician-content" id="appointmentsContent">
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

            <div class="technician-content" id="viewPatientsContent">
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
                                <th hidden>Password</th>
                                <th>Contact</th>
                            </tr>
                        </thead>
                        <tbody id="patientsList" class="patients-list">
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

                //*****************************Manage test details*******************************
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

                    // Fetch the existing data to check if ID matches
                    fetch(testDetailsUrl + test_id)
                            .then(response => {
                                if (response.ok) {
                                    // If ID exists, proceed with deletion
                                    const options = {
                                        method: "DELETE"
                                    };

                                    return fetch(testDetailsUrl + test_id, options);
                                } else {
                                    // If ID doesn't exist, show error message
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
                function viewAll() {
                    event.preventDefault();
                    fetch(testDetailsUrl, options)
                            .then(response => response.json())
                            .then(data => {
                                const tableBody = document.querySelector('#testDetailsTable table tbody');
                                tableBody.innerHTML = ''; // Clear previous data

                                data.forEach(test => {
                                    const row = document.createElement('tr');
                                    row.innerHTML = `
                    <td>${test.test_id}</td>
                    <td>${test.patient_name}</td>
                    <td>${test.test_type}</td>
                    <td>${test.test_date}</td>
                    <td>${test.test_time}</td>
                    <td>${test.technician_name}</td>
                    <td>${test.referring_doctor}</td>
                    <td>${test.result_DETAILS}</td>
                `;
                                    tableBody.appendChild(row);
                                });
                            })
                            .catch(error => {
                                console.error('Error fetching test details:', error);
                            });
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
                    fetchPatients();
                }

                function fetchPatients() {
                    const patientsUrl = "http://localhost:8080/LAB-ABC-rest-service/resources/patient/";

                    fetch(patientsUrl)
                            .then(response => response.json())
                            .then(data => {
                                const patientsList = document.getElementById("patientsList");
                                patientsList.innerHTML = "";

                                data.forEach(patient => {
                                    const row = document.createElement("tr");
                                    row.innerHTML = `
                    <td>${patient.id}</td>
                    <td>${patient.p_name}</td>
                    <td>${patient.dob}</td>
                    <td>${patient.gender}</td>
                    <td>${patient.email}</td>
                    <td>${patient.password}</td>
                    <td>${patient.contact}</td>
                `;
                                    patientsList.appendChild(row);
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