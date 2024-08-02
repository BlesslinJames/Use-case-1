<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Customer</title>
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
            margin-bottom: 20px;
            font-size: 40px;
            font-family: 'Majestic Romance';
            color: #ffcc00;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #ffcc00; /* Yellow text */
        }
        .form-group input, .form-group textarea, .form-group select {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #666; /* Darker border */
            border-radius: 5px;
            background-color: #444; /* Dark input background */
            color: #fff; /* White text */
            transition: border-color 0.3s, background-color 0.3s, color 0.3s;
        }
        .form-group input:focus, .form-group textarea:focus, .form-group select:focus {
            outline: none;
            border-color: #ffcc00; /* Yellow border on focus */
            background-color: #555; /* Darker input background on focus */
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
        <h2>Register Customer</h2>
        <form action="RegisterCustomerServlet" method="post">
            <div class="form-group">
                <label for="full_name">Full Name:</label>
                <input type="text" id="full_name" name="full_name" required>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <textarea id="address" name="address" required></textarea>
            </div>
            <div class="form-group">
                <label for="mobile_no">Mobile No:</label>
                <input type="text" id="mobile_no" name="mobile_no" required>
            </div>
            <div class="form-group">
                <label for="email_id">Email ID:</label>
                <input type="email" id="email_id" name="email_id" required>
            </div>
            <div class="form-group">
                <label for="account_type">Account Type:</label>
                <select id="account_type" name="account_type" required>
                    <option value="Saving">Saving</option>
                    <option value="Current">Current</option>
                </select>
            </div>
            <div class="form-group">
                <label for="initial_balance">Initial Balance:</label>
                <input type="number" id="initial_balance" name="initial_balance" required>
            </div>
            <div class="form-group">
                <label for="date_of_birth">Date of Birth:</label>
                <input type="date" id="date_of_birth" name="date_of_birth" required>
            </div>
            <div class="form-group">
                <label for="id_proof">ID Proof:</label>
                <input type="text" id="id_proof" name="id_proof" required>
            </div>
            <button type="submit" class="button"><i class="fa fa-user-plus"></i> Register</button>
        </form>
    </div>
</body>
</html>
