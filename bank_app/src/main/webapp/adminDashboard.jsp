<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #1f1f1f;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('https://media1.tenor.com/m/QGdu3lFU7EMAAAAC/money-cash.gif');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center; 
        }
        .header {
            text-align: center;
            padding: 20px;
            margin-top: 20px;
        }

        .header h2 {
            font-size: 40px;
            font-family: 'Majestic Romance';
            color: #ffcc00;
            margin: 20px;
        }

        .container {
            margin: 20px auto;
            padding: 20px;
            max-width: 800px;
            background-color: rgba(0, 0, 0, 0.7);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            border-radius: 5px;
            color: #fff;
            text-align: center;
        }
        .button-container {
            margin-top: 20px;
            display: flex;
            justify-content: center;
        }
        .button {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            color: #1f1f1f;
            background-color: #ffcc00; /* Yellow button */
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
            cursor: pointer;
            font-family: 'Arial', sans-serif; /* Backup font */
        }
        .button:hover {
            background-color: #ff9900; /* Orange on hover */
            transform: scale(1.05);
            color: #1f1f1f; /* Dark text */
        }
        .button:active {
            transform: scale(0.98);
        }
        .fa {
            margin-right: 8px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h2>Welcome, <%= session.getAttribute("username") %></h2>
    </div>
    <div class="button-container">
        <a href="registerCustomer.jsp" class="button"><i class="fa fa-user-plus"></i> Register Customer</a>
        <a href="viewCustomers.jsp" class="button"><i class="fa fa-users"></i> View Customers</a>
    </div>
    <div class="button-container">
        <a href="logout.jsp" class="button"><i class="fa fa-sign-out-alt"></i> Logout</a>
    </div>
</div>
</body>
</html>
