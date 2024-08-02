<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logging Out</title>
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
            max-width: 400px;
            color: #fff; /* White text for contrast */
        }
        .header {
            margin-bottom: 20px;
            font-size: 40px;
            font-family: 'Majestic Romance';
            color: #ffcc00;
        }
        .message {
            margin-bottom: 20px;
            font-size: 16px;
            color: #ffcc00; /* Yellow text */
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
            text-align: center;
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
        <div class="header">Logging Out</div>
        <div class="message">You have been logged out successfully. Redirecting to the login page...</div>
        <a href="customerLogin.jsp" class="button">Go to Login</a>
        <script>
            setTimeout(function() {
                window.location.href = 'customerLogin.jsp';
            }, 3000); // Redirects after 3 seconds
        </script>
    </div>
</body>
</html>
