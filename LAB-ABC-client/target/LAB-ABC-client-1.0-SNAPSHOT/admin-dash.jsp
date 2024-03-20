<%-- 
    Document   : admin-dash
    Created on : Mar 15, 2024, 8:03:38 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lab Admin Dashboard</title>
        <link href="assets/css/technician-dash.css" rel="stylesheet">
        <link href="assets/css/patient-dash.css" rel="stylesheet">
        <link href="assets/css/appo.css" rel="stylesheet">
    </head>
    <body>
        <div class="dashboard-container" style="margin-top: 80px">
            <div class="header" style="background-color: #2c3e50; position: fixed;">
                <h1> <span class="menu-icon" onclick="toggleMenu()">&#9776; </span> | Admin Dashboard</h1>
            </div>

            <div class="menu" id="sideMenu" style="margin-top: 50px;">
                <a onclick="showContent('managePatientsContent')" href="#managePatients">Manage Patient</a>
                <a onclick="showContent('manageTechnicianContent')" href="#manageTechnician">Manage Technician</a>
                                
                <button onclick="logout()" style="margin-top:190px; margin-left:150px; background-color: red">Logout</button>
            </div>
        
            <div class="technician-content" id="managePatientsContent">
                <section id="managePatients" class="container">
                    <h1>Manage Patients</h1>

                    <form id="patientDetailsForm" onsubmit="submitPatientDetails()">
                        <label for="patientId">Patient ID:</label>
                        <input type="text" id="patientId" name="patientId" required>

                        <label for="patientName">Patient Name:</label>
                        <input type="text" id="patientName" name="patientName" required>

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

                        <div class="button-container" style="display: flex; gap: 40px; max-height: 100px; margin-left: 40px">
                            <button type="button" onclick="getPatientDetailsById(event)" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Get by ID</button>
                            <button type="button" onclick="addPatientDetails(event)" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Add</button>
                            <button type="button" onclick="updatePatientDetails(event)" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Update</button>
                            <button type="button" onclick="deletePatientDetails(event)" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Delete</button>
                            <button type="button" onclick="clearPatientDetails(event)" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Clear</button>
                            <button type="button" onclick="viewallPatientDetails(event)" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">View All</button>

                        </div>
                    </form>
                    <br><hr><br>

                    <div id="patientDetailsTable" class="patient-details-table">
                        <!-- Patient details table will be dynamically populated here -->
                        <table>
                            <thead>
                                <tr>
                                    <th>Patient ID</th>
                                    <th>Patient Name</th>
                                    <th>Date of Birth</th>
                                    <th>Gender</th>
                                    <th>Email</th>
                                    <th>Contact</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </section>
            </div>


            <div class="technician-content" id="managePatientsContent" style="margin-top: 50px;">
                <section id="manageTechnician" class="container">
                    <h1>Manage Technicians</h1>

                    <form id="technicianDetailsForm" onsubmit="submitTechnicianDetails()">
                        <label for="technicianId">Technician ID:</label>
                        <input type="text" id="technicianId" name="technicianId" required>

                        <label for="technicianName">Technician Name:</label>
                        <input type="text" id="technicianName" name="technicianName" required>

                        <label for="technicianGender">Gender:</label>
                        <select id="technicianGender" name="technicianGender" required>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>

                        <label for="technicianEmail">Email:</label>
                        <input type="email" id="technicianEmail" name="technicianEmail" required>

                        <label for="technicianUsername">Username:</label>
                        <input type="text" id="technicianUsername" name="technicianUsername" required>

                        <label for="technicianPassword">Password:</label>
                        <input type="password" id="technicianPassword" name="technicianPassword" required>

                        <div class="button-container" style="display: flex; gap: 40px; max-height: 100px; margin-left: 40px">
                            <button type="button" onclick="getTechnicianDetailsById()" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Get by ID</button>
                            <button type="button" onclick="addTechnicianDetails()" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Add</button>
                            <button type="button" onclick="updateTechnicianDetails()" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Update</button>
                            <button type="button" onclick="deleteTechnicianDetails()" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Delete</button>
                            <button type="button" onclick="clearTechnicianDetails()" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Clear</button>
                            <button type="button" onclick="viewallTechnicianDetails()" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">View All</button>
                        </div>
                    </form>
                    <br><hr><br>

                    <div id="technicianDetailsTable" class="technician-details-table">
                        <!-- Technician details table will be dynamically populated here -->
                        <table>
                            <thead>
                                <tr>
                                    <th>Technician ID</th>
                                    <th>Technician Name</th>
                                    <th>Gender</th>
                                    <th>Email</th>
                                    <th>Username</th>
                                    <th>Password</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </section>
            </div>
        </div>

        <script>
            window.onload = function () {
                var menu = document.getElementById("sideMenu");
                menu.style.left = "0px";
                showContent('managePatientsContent');
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
                if (contentId === 'manageTechnicianContent') {
                    // Code for fetching technician details
                }
            }



//**********************************************************************************************************
            const patientDetailsUrl = "http://localhost:8080/LAB-ABC-rest-service/resources/patient/";

            function getPatient() {
                event.preventDefault();
                let id = document.getElementById("patientId").value;
                const options = {
                    method: "GET"
                };
                fetch(patientDetailsUrl + id, options)
                        .then(res => res.json())
                        .then(data => {
                            if (data !== null) {
                                document.getElementById("patientName").value = data.p_name;
                                document.getElementById("dob").value = data.dob;
                                document.getElementById("gender").value = data.gender;
                                document.getElementById("email").value = data.email;
                                document.getElementById("password").value = data.password;
                                document.getElementById("contact").value = data.contact;
                            } else {
                                alert("Patient details not found");
                            }
                        });
            }

            function addPatient() {
                event.preventDefault();
                const person = {
                    "id": document.getElementById("patientId").value,
                    "p_name": document.getElementById("patientName").value,
                    "dob": document.getElementById("dob").value,
                    "gender": document.getElementById("gender").value,
                    "email": document.getElementById("email").value,
                    "password": document.getElementById("password").value,
                    "contact": document.getElementById("contact").value
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
                                alert("Patient details added successfully!");
                                document.getElementById("patientDetailsForm").reset(); // Reset the form
                            } else {
                                // Test addition failed
                                throw new Error("Failed to add patient.");
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert("An error occurred. Please try again later.");
                        });
            }


            function updatePatient() {
                event.preventDefault();

                let id = document.getElementById("patientId").value;
                const person = {
                    "id": id,
                    "p_name": document.getElementById("patientName").value,
                    "dob": document.getElementById("dob").value,
                    "gender": document.getElementById("gender").value,
                    "email": document.getElementById("email").value,
                    "password": document.getElementById("password").value,
                    "contact": document.getElementById("contact").value;
                };
                const options = {
                    method: "PUT",
                    headers: {
                        "content-type": "application/json"
                    },
                    body: JSON.stringify(person)
                };

                fetch(patientDetailsUrl + id, options)
                        .then(response => {
                            if (response.ok) {
                                alert("Patient details updated successfully!");
                                document.getElementById("patientDetailsForm").reset();
                            } else {

                                throw new Error("Failed to update patient details. Please try again later.");
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert("An error occurred. Please try again later.");
                        });
            }


            function deletePatient(event) {
                event.preventDefault();

                let id = document.getElementById("patientId").value;

                if (!id) {
                    alert("Please enter a valid Patient ID.");
                    return;
                }

                // Fetch the existing data to check if ID matches
                fetch(patientDetailsUrl + id)
                        .then(response => {
                            if (response.ok) {
                                // If ID exists, proceed with deletion
                                const options = {
                                    method: "DELETE"
                                };

                                return fetch(patientDetailsUrl + id, options);
                            } else {
                                // If ID doesn't exist, show error message
                                throw new Error("Patient ID does not exist.");
                            }
                        })
                        .then(response => {
                            if (response.ok) {
                                alert("Data deleted successfully!");
                                document.getElementById("patientDetailsForm").reset();
                            } else {
                                throw new Error("Failed to delete data.");
                            }
                        })
                        .catch(error => {
                            console.error("Error:", error);
                            alert("Failed to delete data. " + error.message);
                        });
            }



            function clearPatientDetails() {
                event.preventDefault();
                document.getElementById("patientDetailsForm").reset();
            }


//**************************************************************************************************************
            function getTechnicianDetailsById() {
                let technicianId = document.getElementById("technicianId").value;
                const options = {
                    method: "GET"
                };
                fetch(technicianDetailsUrl + technicianId, options)
                        .then(res => res.json())
                        .then(data => {
                            if (data !== null) {
                                document.getElementById("technicianName").value = data.technician_name;
                                document.getElementById("technicianGender").value = data.gender;
                                document.getElementById("technicianEmail").value = data.email;
                                document.getElementById("technicianUsername").value = data.username;
                                document.getElementById("technicianPassword").value = data.password;
                            } else {
                                alert("Technician details not found");
                            }
                        });
            }

            function addTechnicianDetails() {
                const technicianDetails = {
                    "technician_name": document.getElementById("technicianName").value,
                    "gender": document.getElementById("technicianGender").value,
                    "email": document.getElementById("technicianEmail").value,
                    "username": document.getElementById("technicianUsername").value,
                    "password": document.getElementById("technicianPassword").value
                };
                const options = {
                    method: "POST",
                    headers: {
                        "content-type": "application/json"
                    },
                    body: JSON.stringify(technicianDetails)
                };
                fetch(technicianDetailsUrl, options);
            }

            function updateTechnicianDetails() {
                let technicianId = document.getElementById("technicianId").value;
                const technicianDetails = {
                    "technician_name": document.getElementById("technicianName").value,
                    "gender": document.getElementById("technicianGender").value,
                    "email": document.getElementById("technicianEmail").value,
                    "username": document.getElementById("technicianUsername").value,
                    "password": document.getElementById("technicianPassword").value
                };
                const options = {
                    method: "PUT",
                    headers: {
                        "content-type": "application/json"
                    },
                    body: JSON.stringify(technicianDetails)
                };
                fetch(technicianDetailsUrl + technicianId, options);
            }

            function deleteTechnicianDetails() {
                let technicianId = document.getElementById("technicianId").value;
                const options = {
                    method: "DELETE"
                };
                fetch(technicianDetailsUrl + technicianId, options);
            }

            function clearTechnicianDetails() {
                document.getElementById("technicianId").value = "";
                document.getElementById("technicianName").value = "";
                document.getElementById("technicianGender").value = "";
                document.getElementById("technicianEmail").value = "";
                document.getElementById("technicianUsername").value = "";
                document.getElementById("technicianPassword").value = "";
            }

            function viewAllPatientDetails() {
                fetch(patientDetailsUrl)
                        .then(res => res.json())
                        .then(data => {
                            // Clear existing table rows
                            const table = document.getElementById("patientDetailsTable").getElementsByTagName('tbody')[0];
                            table.innerHTML = "";

                            // Populate table with fetched data
                            data.forEach(patient => {
                                const row = table.insertRow();
                                row.innerHTML = `
                    <td>${patient.patient_id}</td>
                    <td>${patient.patient_name}</td>
                    <td>${patient.dob}</td>
                    <td>${patient.gender}</td>
                    <td>${patient.email}</td>
                    <td>${patient.contact}</td>
                `;
                            });
                        });
            }

            function viewAllTechnicianDetails() {
                fetch(technicianDetailsUrl)
                        .then(res => res.json())
                        .then(data => {
                            // Clear existing table rows
                            const table = document.getElementById("technicianDetailsTable").getElementsByTagName('tbody')[0];
                            table.innerHTML = "";

                            // Populate table with fetched data
                            data.forEach(technician => {
                                const row = table.insertRow();
                                row.innerHTML = `
                    <td>${technician.technician_id}</td>
                    <td>${technician.technician_name}</td>
                    <td>${technician.gender}</td>
                    <td>${technician.email}</td>
                    <td>${technician.username}</td>
                    <td>${technician.password}</td>
                `;
                            });
                        });
            }

            function logout() {
                window.location.href = "http://localhost:8080/LAB-ABC-client/";
                alert("Logging out...");
            }
        </script>
    </body>
</html>
