<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Dashboard</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            width: 80%;
            max-width: 600px;
            text-align: center;
        }
        .container h2 {
            margin-bottom: 20px;
        }
        .account-info {
            margin-bottom: 20px;
            text-align: left;
        }
        .button {
            display: inline-block;
            margin: 10px 5px;
            padding: 10px 20px;
            color: white;
            background-color: #4CAF50;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #45a049;
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
        <h2>Welcome, Customer</h2>
        <div class="account-info">
            <%
                String accountNo = (String) session.getAttribute("account_no");
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Bankingdb", "root", "root");
                PreparedStatement ps = con.prepareStatement("SELECT * FROM Customer WHERE account_no=?");
                ps.setString(1, accountNo);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    out.print("Account No: " + rs.getString("account_no") + "<br>");
                    out.print("Balance: " + rs.getDouble("initial_balance") + "<br>");
                }
            %>
        </div>
        <a href="viewTransactions.jsp" class="button"><i class="fa fa-list"></i> View Transactions</a>
        <a href="deposit.jsp" class="button"><i class="fa fa-plus-circle"></i> Deposit</a>
        <a href="withdraw.jsp" class="button"><i class="fa fa-minus-circle"></i> Withdraw</a>
        <a href="closeAccount.jsp" class="button button-secondary"><i class="fa fa-times-circle"></i> Close Account</a>
        <a href="logoutcustomer.jsp" class="button button-secondary"><i class="fa fa-sign-out-alt"></i> Logout</a>
    </div>
</body>
</html>
