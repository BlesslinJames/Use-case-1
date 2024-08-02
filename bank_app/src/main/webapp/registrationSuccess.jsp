<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Success</title>
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
        .container {
            background-color: rgba(0, 0, 0, 0.7); /* Dark semi-transparent background */
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Dark shadow */
            border-radius: 5px;
            text-align: center;
            width: 80%;
            max-width: 500px;
            color: #fff; /* White text for contrast */
        }
        h2 {
            font-size: 40px;
            font-family: 'Majestic Romance';
            color: #ffcc00;
            margin-bottom: 20px;
        }
        .message {
            font-size: 18px;
            margin-bottom: 20px;
            color: #4CAF50; /* Green text */
        }
        .button {
            display: inline-block;
            margin: 10px 5px;
            padding: 10px 20px;
            color: #1f1f1f; /* Dark text */
            background-color: #ffcc00; /* Yellow button */
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
            cursor: pointer;
        }
        .button:hover {
            background-color: #ff9900; /* Orange on hover */
            transform: scale(1.05);
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
        <h2>Registration Successful</h2>
        <p class="message">The customer has been successfully registered. Thank you!</p>
        <a href="adminDashboard.jsp" class="button"><i class="fa fa-home"></i> Back to Dashboard</a>
    </div>
</body>
</html>
