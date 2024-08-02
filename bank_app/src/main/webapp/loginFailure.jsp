<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String loginType = request.getParameter("loginType"); // Get the type of login failure (admin or customer)
    String redirectPage = "login.jsp"; // Default redirect page

    if ("customer".equalsIgnoreCase(loginType)) {
        redirectPage = "customerLogin.jsp";
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Failed</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <meta http-equiv="refresh" content="10;url=<%=redirectPage%>">
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
             background-image: url('https://media1.tenor.com/m/fwJDXbBW7-8AAAAC/wrong-not.gif'); /* Replace with your GIF URL */
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
            max-width: 400px;
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
        .message {
            font-size: 18px;
            margin-bottom: 20px;
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
            width: 100%;
            box-sizing: border-box;
            margin-top: 10px;
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
        <h2>Login Failed</h2>
        <p class="message">Your login attempt was unsuccessful. You will be redirected shortly.</p>
        <a href="<%=redirectPage%>" class="button"><i class="fa fa-home"></i> Go to Login Page</a>
    </div>
</body>
</html>
