<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Customers</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #1f1f1f; /* Dark background */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('https://media1.tenor.com/m/QGdu3lFU7EMAAAAC/money-cash.gif'); /* Replace with your GIF URL */
            background-size: cover; /* Adjust to cover entire screen */
            background-repeat: no-repeat; /* Ensure GIF does not repeat */
            background-position: center; /* Center the GIF */
        }
        .container {
            background-color: rgba(0, 0, 0, 0.7); /* Dark semi-transparent background */
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Dark shadow */
            border-radius: 5px;
            width: 90%;
            max-width: 1200px;
            text-align: center;
            color: #fff; /* White text for contrast */
            box-sizing: border-box;
        }
        .container h2 {
            margin-bottom: 20px;
            font-size: 40px;
            font-family: 'Majestic Romance';
            color: #ffcc00;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            text-align: left;
        }
        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #ffcc00; /* Yellow header */
            color: #1f1f1f; /* Dark text */
        }
        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.1); /* Light semi-transparent row */
        }
        tr:nth-child(odd) {
            background-color: rgba(255, 255, 255, 0.2); /* Slightly darker semi-transparent row */
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 18px;
            text-decoration: none;
            background-color: #ffcc00; /* Yellow button */
            color: #1f1f1f; /* Dark text */
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
            cursor: pointer;
            width: 100%;
            box-sizing: border-box;
        }
        .button:hover {
            background-color: #ff9900; /* Orange on hover */
            transform: scale(1.05);
        }
        .button:active {
            transform: scale(0.98);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Customer List</h2>
        <table>
            <thead>
                <tr>
                    <th>Customer ID</th>
                    <th>Full Name</th>
                    <th>Address</th>
                    <th>Mobile No</th>
                    <th>Email ID</th>
                    <th>Account Type</th>
                    <th>Initial Balance</th>
                    <th>Date of Birth</th>
                    <th>Account No</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingdb", "root", "qwerty");
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM customer");

                        while (rs.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rs.getInt("id") + "</td>");
                            out.println("<td>" + rs.getString("full_name") + "</td>");
                            out.println("<td>" + rs.getString("address") + "</td>");
                            out.println("<td>" + rs.getString("mobile_no") + "</td>");
                            out.println("<td>" + rs.getString("email_id") + "</td>");
                            out.println("<td>" + rs.getString("account_type") + "</td>");
                            out.println("<td>" + rs.getDouble("initial_balance") + "</td>");
                            out.println("<td>" + rs.getDate("date_of_birth") + "</td>");
                            out.println("<td>" + rs.getString("account_no") + "</td>");
                            out.println("</tr>");
                        }
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
        <a href="adminDashboard.jsp" class="button">Back to Dashboard</a>
    </div>
</body>
</html>
