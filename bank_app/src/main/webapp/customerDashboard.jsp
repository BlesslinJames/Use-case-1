<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard</title>
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
            background-color: rgba(0, 0, 0, 0.7); /* Dark semi-transparent background */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Dark shadow */
            border-radius: 5px;
            color: #fff; /* White text for contrast */
            text-align: center; /* Center align content */
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
            color: #1f1f1f; /* Dark text */
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
        .button-secondary {
            background-color: #5bc0de;
        }
        .button-secondary:hover {
            background-color: #31b0d5;
        }
        .fa {
            margin-right: 8px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Welcome, Customer</h2>
        </div>
        <div class="account-info">
            <% 
                String accountNo = (String) session.getAttribute("account_no");
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingdb", "root", "qwerty");
                    ps = con.prepareStatement("SELECT * FROM customer WHERE account_no=?");
                    ps.setString(1, accountNo);
                    rs = ps.executeQuery();
                    if (rs.next()) {
                        out.print("Account No: " + rs.getString("account_no") + "<br>");
                        out.print("Balance: " + rs.getDouble("initial_balance") + "<br>");
                    }
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                    if (ps != null) try { ps.close(); } catch (SQLException ignore) {}
                    if (con != null) try { con.close(); } catch (SQLException ignore) {}
                }
            %>
        </div>
        <div class="button-container">
            <a href="viewTransactions.jsp" class="button"><i class="fa fa-list"></i> View Transactions</a>
            <a href="deposit.jsp" class="button"><i class="fa fa-plus-circle"></i> Deposit</a>
            <a href="withdraw.jsp" class="button"><i class="fa fa-minus-circle"></i> Withdraw</a>
            <a href="closeAccount.jsp" class="button button-secondary"><i class="fa fa-times-circle"></i> Close Account</a>
            <a href="logoutcustomer.jsp" class="button button-secondary"><i class="fa fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>
</body>
</html>
