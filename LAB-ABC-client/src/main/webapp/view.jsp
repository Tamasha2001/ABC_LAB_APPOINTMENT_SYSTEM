<%-- 
    Document   : view
    Created on : Mar 21, 2024, 10:32:48 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Appointments</title>
        <!-- Include jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body>

        <div id="viewAppointmentsContent">
            <!-- View Appointments Section -->
            <h2 class="dashboard-heading">View Appointments</h2>
            <input type="text" id="appointmentNumberInput" placeholder="Enter Appointment Number">
            <br><br><br>
            <table id="appointmentsTable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Test Type</th>
                        <th>Action</th> <!-- New column for actions -->
                    </tr>
                </thead>
                <tbody id="appointmentsTableBody">
                    <!-- Appointments will be populated here -->
                </tbody>
            </table>
        </div>

        <script>
            // Fetch data from API and populate the table when the page loads
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
                                tableBody.append('<tr><td colspan="6">No appointments found</td></tr>');
                            } else {
                                // Populate table rows with appointments data
                                data.forEach(function (appointment) {
                                    var row = '<tr>' +
                                            '<td>' + appointment.apid + '</td>' +
                                            '<td>' + appointment.patient_name + '</td>' +
                                            '<td>' + appointment.date + '</td>' +
                                            '<td>' + appointment.time + '</td>' +
                                            '<td>' + appointment.test + '</td>' +
                                            '<td><button class="deleteButton" data-id="' + appointment.id + '">Delete</button></td>' +
                                            '</tr>';
                                    tableBody.append(row);
                                });

                                // Add event listener for delete buttons
                                $('.deleteButton').click(function () {
                                    var appointmentId = $(this).data('id');
                                    // Implement delete logic here, e.g., call a delete API endpoint
                                    console.log('Deleting appointment with ID:', appointmentId);
                                });
                            }
                        })
                        .catch(error => {
                            console.error('Error fetching or parsing data:', error);
                            // Handle error, e.g., display a message to the user
                        });
            });
        </script>

    </body>
</html>
