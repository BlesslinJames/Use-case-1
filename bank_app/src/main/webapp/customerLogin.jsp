<!DOCTYPE html>
<html>
<head>
    <title>Customer Login</title>
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
            background-color: rgba(0, 0, 0, 0.7); /* Darker container background */
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Dark shadow */
            border-radius: 5px;
            width: 80%;
            max-width: 400px;
            text-align: center;
            color: #fff; /* White text for contrast */
        }
        .container h2 {
            font-size: 40px;
            font-family: 'Majestic Romance';
            color: #ffcc00;
            margin: 20px;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #ffcc00; /* Yellow label text */
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #666; /* Darker border */
            border-radius: 5px;
            background-color: #444; /* Dark input background */
            color: #fff; /* White text */
            transition: border-color 0.3s, background-color 0.3s, color 0.3s;
        }
        .form-group input:focus {
            outline: none;
            border-color: #ffcc00; /* Yellow border on focus */
            background-color: #555; /* Darker input background on focus */
        }
        .button-group {
            display: flex;
            justify-content: space-between;
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
            width: 48%;
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
        <h2>Customer Login</h2>
        <form action="CustomerLoginServlet" method="post">
            <div class="form-group">
                <label for="account_no">Account No:</label>
                <input type="text" id="account_no" name="account_no" required>
            </div>
            <div class="form-group">
                <label for="temporary_password">Password:</label>
                <input type="password" id="temporary_password" name="temporary_password" required>
            </div>
            <div class="button-group">
                <a href="firstLogin.jsp" class="button"><i class="fa fa-arrow-left"></i> Back</a>
                <button type="submit" class="button"><i class="fa fa-sign-in-alt"></i> Login</button>
            </div>
        </form>
    </div>
</body>
</html>
