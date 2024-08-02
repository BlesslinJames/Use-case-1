<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Transactions</title>
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
            align-items: flex-start;
            min-height: 100vh;
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
            width: 90%;
            max-width: 900px;
            text-align: center;
            color: #fff; /* White text for contrast */
        }
        h2 {
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
            color: #fff; /* White text for contrast */
        }
        th {
            background-color: #ffcc00; /* Yellow header */
            color: #1f1f1f; /* Dark text */
        }
        tr:nth-child(even) {
            background-color: rgba(255, 204, 0, 0.1); /* Light yellow for even rows */
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            color: #1f1f1f; /* Dark text */
            background-color: #ffcc00; /* Yellow button */
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
            cursor: pointer;
            text-align: center;
            margin: 10px;
        }
        .button:hover {
            background-color: #ff9900; /* Orange on hover */
            transform: scale(1.05);
        }
        .button:active {
            transform: scale(0.98);
        }
        .button-container {
            margin-top: 20px;
        }
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }
        .pagination a {
            color: #ffcc00;
            padding: 8px 16px;
            text-decoration: none;
            border: 1px solid #ffcc00;
            margin: 0 4px;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }
        .pagination a:hover {
            background-color: #ffcc00;
            color: #1f1f1f;
        }
        .pagination a.active {
            background-color: #ffcc00;
            color: #1f1f1f;
            border: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Last 10 Transactions</h2>
        <table>
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Amount</th>
                    <th>Type</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int currentPage = 1;
                    int recordsPerPage = 10;
                    if (request.getParameter("page") != null) {
                        currentPage = Integer.parseInt(request.getParameter("page"));
                    }
                    int start = (currentPage - 1) * recordsPerPage;
                    
                    try {
                        String accountNo = (String) session.getAttribute("account_no");
                        Class.forName("com.mysql.cj.jdbc.Driver"); // Updated driver class
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingDB", "root", "qwerty");
                        
                        PreparedStatement ps = con.prepareStatement("SELECT * FROM Transaction WHERE account_no=? ORDER BY transaction_date DESC LIMIT ?, ?");
                        ps.setString(1, accountNo);
                        ps.setInt(2, start);
                        ps.setInt(3, recordsPerPage);
                        
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rs.getTimestamp("transaction_date") + "</td>");
                            out.println("<td>" + rs.getDouble("amount") + "</td>");
                            out.println("<td>" + rs.getString("type") + "</td>");
                            out.println("</tr>");
                        }
                        
                        // Get total number of records
                        ps = con.prepareStatement("SELECT COUNT(*) FROM Transaction WHERE account_no=?");
                        ps.setString(1, accountNo);
                        rs = ps.executeQuery();
                        rs.next();
                        int totalRecords = rs.getInt(1);
                        int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);
                        
                        con.close();
                %>
            </tbody>
        </table>
        <div class="button-container">
            <a href="downloadPDF.jsp" class="button"><i class="fa fa-file-pdf"></i> Download PDF</a>
            <a href="customerDashboard.jsp" class="button"><i class="fa fa-arrow-left"></i> Back to Dashboard</a>
        </div>
        <div class="pagination">
            <% 
                if (currentPage > 1) {
                    out.println("<a href='viewTransactions.jsp?page=" + (currentPage - 1) + "'>Previous</a>");
                }
                for (int i = 1; i <= totalPages; i++) {
                    if (i == currentPage) {
                        out.println("<a class='active' href='viewTransactions.jsp?page=" + i + "'>" + i + "</a>");
                    } else {
                        out.println("<a href='viewTransactions.jsp?page=" + i + "'>" + i + "</a>");
                    }
                }
                if (currentPage < totalPages) {
                    out.println("<a href='viewTransactions.jsp?page=" + (currentPage + 1) + "'>Next</a>");
                }
            %>
        </div>
        <%
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
        %>
    </div>
</body>
</html>
