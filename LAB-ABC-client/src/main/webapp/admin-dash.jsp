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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href="assets/css/admin-dash.css" rel="stylesheet">
    </head>
    <body>
        <div class="dashboard-container" style="margin-top: 80px">
            <div class="header" style="background-color: #2c3e50; position: fixed;">
                <h1> <span class="menu-icon" onclick="toggleMenu()">&#9776; </span> | Admin Dashboard</h1>
            </div>

            <div class="menu" id="sideMenu" style="margin-top: 50px;">
                <a onclick="showContent('manageTechnicianContent')" href="#manageTechnician">Manage Technician</a>
                <a onclick="showContent('managePatientsContent')" href="#managePatients">Manage Patient</a>

                <button onclick="logout()" style="margin-top:190px; margin-left:150px; background-color: red">Logout</button>
            </div>

            <div class="admin-content" id="manageTechnicianContent" style="margin-top: 50px;">
                <section id="manageTechnician" class="container">
                    <h1>Manage Technicians</h1>

                    <form id="technicianDetailsForm">
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
                            <button id="btngetTechnician" onclick="getTechnician()" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Search</button>
                            <button id="btnaddTechnician" onclick="addTechnician()" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Add</button>
                            <button id="btnupdateTechnician" onclick="updateTechnician()" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Update</button>
                            <button id="btnDeleteTechnician" onclick="deleteTechnician(event)" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Delete</button>
                            <button id="btnclearTechnicianDetails" onclick="clearTechnicianDetails()" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Clear</button>
                            <button id="btnviewallTechnicianDetails" onclick="viewallTechnicianDetails()" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">View All</button>
                        </div>
                    </form>
                    <br><hr><br>

                    <div id="technicianDetailsTable" class="technician-details-table">
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
            <!--***********************************************************************************************************-->
            <div class="admin-content" id="managePatientsContent">
                <section id="managePatients" class="container">
                    <h1>Manage Patients</h1>

                    <div class="section" id="getPatientSection">
                        <h3>Get Patient by ID</h3>
                        <form id="getPatientForm">
                            <label for="getPatientId">Patient ID:</label>
                            <input type="text" id="getPatientId" name="getPatientId" required>
                            <button onclick="getPatient(event)" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Get Details</button>
                        </form>
                    </div>

                    <div class="section" id="modifyPatientSection">
                        <h3>Add, Update, or Delete Patient</h3>
                        <form id="modifyPatientForm">

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
                            <button onclick="addPatient(event)" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Add</button>
                            <button onclick="updatePatient(event)" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Update</button>
                            <button onclick="deletePatient(event)" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Delete</button>
                            <button onclick="clearPatientDetails(event)" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">Clear</button>
                        </form>
                    </div>

                    <div class="section" id="viewPatientSection">
                        <h3>View Patient Details</h3>
                        <button onclick="viewAllPatients(event)" style="font-weight: bold; font-size: 15px; background-color: #2c3e50;">View All</button>
                         <div id="patientDetailsTable" class="patient-details-table">
                        <table id="patientDetailsTable">
                            <thead>
                                <tr>
                                    <th>Patient ID</th>
                                    <th>Patient Name</th>
                                    <th>Date of Birth</th>
                                    <th>Gender</th>
                                    <th>Email</th>
                                    <th>Password</th>
                                    <th>Contact</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    </div>

                </section>
            </div>

        </div>



        <script>
            window.onload = function () {
                var menu = document.getElementById("sideMenu");
                menu.style.left = "0px";
                showContent('manageTechnicianContent');
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
                var contentElements = document.querySelectorAll('.admin-content');
                for (var i = 0; i < contentElements.length; i++) {
                    contentElements[i].style.display = 'none';
                }

                var selectedContent = document.getElementById(contentId);
                selectedContent.style.display = 'block';
                if (contentId === 'managePatientsContent') {
                    fetchAppointmentDetails();
                }
            }
//****************************************************************************************************************

            const technicianDetailsUrl = "http://localhost:8080/LAB-ABC-rest-service/resources/technician/";

            function getTechnician() {
                event.preventDefault();
                let tid = document.getElementById("technicianId").value;
                const options = {
                    method: "GET"
                };
                fetch(technicianDetailsUrl + tid, options)
                        .then(res => {
                            if (!res.ok) {
                                throw new Error('Technician details not found');
                            }
                            return res.json();
                        })
                        .then(data => {
                            document.getElementById("technicianName").value = data.name;
                            document.getElementById("technicianGender").value = data.gender;
                            document.getElementById("technicianEmail").value = data.email;
                            document.getElementById("technicianUsername").value = data.username;
                            document.getElementById("technicianPassword").value = data.password;
                        })
                        .catch(error => {
                            alert(error.message); // Display alert for error message
                        });
            }


            function addTechnician() {
                event.preventDefault();
                let tid = document.getElementById("technicianId").value;

                fetch(technicianDetailsUrl + tid)
                        .then(response => {
                            if (response.ok) {
                                alert("Technician ID is already in use. Please choose a different ID.");
                            } else {
                                const person = {
                                    "tid": tid,
                                    "name": document.getElementById("technicianName").value,
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
                                    body: JSON.stringify(person)
                                };

                                fetch(technicianDetailsUrl, options)
                                        .then(response => {
                                            if (response.ok) {
                                                alert("Technician details added successfully!");
                                                document.getElementById("technicianDetailsForm").reset(); // Reset the form
                                            } else {
                                                throw new Error("Failed to add technician.");
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



            function updateTechnician() {
                event.preventDefault();

                let tid = document.getElementById("technicianId").value;
                const person = {
                    "tid": tid,
                    "name": document.getElementById("technicianName").value,
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
                    body: JSON.stringify(person)
                };

                fetch(technicianDetailsUrl + tid, options)
                        .then(response => {
                            if (response.ok) {
                                alert("Technician details updated successfully!");
                                document.getElementById("technicianDetailsForm").reset();
                            } else {
                                throw new Error("Failed to update technician details. Please try again later.");
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert("An error occurred. Please try again later.");
                        });
            }


            function deleteTechnician(event) {
                event.preventDefault();

                let tid = document.getElementById("technicianId").value;

                if (!tid) {
                    alert("Please enter a valid Technician ID.");
                    return;
                }

                fetch(technicianDetailsUrl + tid, {
                    method: "DELETE"
                })
                        .then(response => {
                            if (response.ok) {
                                alert("Technician deleted successfully!");
                                document.getElementById("technicianDetailsForm").reset();
                            } else {
                                throw new Error("Failed to delete technician.");
                            }
                        })
                        .catch(error => {
                            console.error("Error:", error);
                            alert("Failed to delete technician. " + error.message);
                        });
            }

            function clearTechnicianDetails() {
                event.preventDefault();
                document.getElementById("technicianDetailsForm").reset();
            }

//**********************************************************************************************************
            const patientDetailsUrl = "http://localhost:8080/LAB-ABC-rest-service/resources/patient/";

            function getPatient() {
                event.preventDefault();
                let id = document.getElementById("getPatientId").value;
                const options = {
                    method: "GET"
                };
                fetch(patientDetailsUrl + id, options)
                        .then(res => {
                            if (!res.ok) {
                                throw new Error('Patient details not found');
                            }
                            return res.json();
                        })
                        .then(data => {
                            console.log(data); // Log the response data to check for dob and gender
                            document.getElementById("patientName").value = data.p_name;
                            document.getElementById("dob").value = data.dob;
                            document.getElementById("gender").value = data.gender;
                            document.getElementById("email").value = data.email;
                            document.getElementById("password").value = data.password;
                            document.getElementById("contact").value = data.contact;
                        })
                        .catch(error => {
                            alert(error.message); // Display alert for error message
                        });
            }



            function addPatient() {
                event.preventDefault();

                const person = {
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
                                document.getElementById("modifyPatientForm").reset();
                                document.getElementById("getPatientForm").reset();// Reset the form
                            } else {
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

                let id = document.getElementById("getPatientId").value;
                const person = {
                    "id": id,
                    "p_name": document.getElementById("patientName").value,
                    "dob": document.getElementById("dob").value,
                    "gender": document.getElementById("gender").value,
                    "email": document.getElementById("email").value,
                    "password": document.getElementById("password").value,
                    "contact": document.getElementById("contact").value
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
                                document.getElementById("modifyPatientForm").reset();
                                document.getElementById("getPatientForm").reset();
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

                let id = document.getElementById("getPatientId").value;

                if (!id) {
                    alert("Please enter a valid Patient ID.");
                    return;
                }

                fetch(patientDetailsUrl + id, {
                    method: "DELETE"
                })
                        .then(response => {
                            if (response.ok) {
                                alert("Patient deleted successfully!");
                                document.getElementById("modifyPatientForm").reset();
                                document.getElementById("getPatientForm").reset();
                            } else {
                                throw new Error("Failed to delete patient.");
                            }
                        })
                        .catch(error => {
                            console.error("Error:", error);
                            alert("Failed to delete patient. " + error.message);
                        });
            }

            function clearPatientDetails() {
                event.preventDefault();
                document.getElementById("modifyPatientForm").reset();
                document.getElementById("getPatientForm").reset();
            }

            function getPatients() {
                fetch(patientDetailsUrl + id, options)
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Network response was not ok');
                            }
                            return response.json();
                        })
                        .then(data => {
                            var tableBody = $('#patientDetailsTable');

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
                                            '<td>' + patient.password + '</td>' +
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
            }

            // Function to call getAppointments() when search button is clicked
            $('#viewAllPatients').click(function () {
                getPatients();
            });



            function logout() {
                window.location.href = "http://localhost:8080/LAB-ABC-client/";
                alert("Logging out...");
            }
        </script>
    </body>
</html>
