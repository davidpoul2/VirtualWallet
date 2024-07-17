<%@ page import="java.sql.Connection" %>
<%@ page import="com.david.virtualwallet.DAO" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>VirtualPay Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body, html {
            font-family: 'Roboto', sans-serif;
            background-color: #f0f0f0;
            color: #333;
        }

        .container {
            max-width: 480px;
            margin: 0 auto;
            background-color: #fff;
            min-height: 100vh;
        }

        .header {
            background-color: #5f259f;
            color: white;
            padding: 20px;
            text-align: center;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            font-size: 20px;
        }

        .balance {
            background-color: #7535c4;
            color: white;
            padding: 30px 20px;
            text-align: center;
        }

        .balance-amount {
            font-size: 36px;
            font-weight: bold;
            margin-top: 10px;
        }

        .actions {
            display: flex;
            justify-content: space-around;
            padding: 20px;
            background-color: #f9f9f9;
        }

        .action-item {
            text-align: center;
            color: #5f259f;
        }

        .material-icons {
            font-size: 30px;
        }

        .transactions {
            padding: 20px;
        }

        .transactions h2 {
            margin-bottom: 15px;
            color: #5f259f;
        }

        .transaction-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
            border-bottom: 1px solid #eee;
        }

        .transaction-details {
            display: flex;
            align-items: center;
        }

        .transaction-icon {
            background-color: #e0e0e0;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-right: 15px;
        }

        .transaction-amount {
            font-weight: bold;
        }

        .send-money {
            position: fixed;
            bottom: 20px;
            right: 20px;
        }

        .send-money-btn {
            background-color: #5f259f;
            color: white;
            border: none;
            padding: 15px;
            border-radius: 50%;
            cursor: pointer;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .logout {
            position: fixed;
            top: 20px;
            right: 20px;
        }

        .logout-btn {
            background-color: transparent;
            border: none;
            color: white;
            cursor: pointer;
        }

        #sendMoneyModal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.4);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 400px;
            border-radius: 8px;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .modal-content input[type="text"],
        .modal-content input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .modal-content input[type="submit"] {
            background-color: #5f259f;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        .logout {
            position: absolute;
            top: 20px;
            right: 20px;
        }

        .logout-btn {
            background-color: #ff3b30;
            border: none;
            color: white;
            cursor: pointer;
            padding: 8px 12px;
            border-radius: 20px;
            font-weight: bold;
            display: flex;
            align-items: center;
            transition: background-color 0.3s ease;
        }

        .logout-btn:hover {
            background-color: #ff6b6b;
        }

        .logout-btn .material-icons {
            font-size: 18px;
            margin-right: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>VirtualPay</h1>
        <div class="logout">
            <form action="logout" method="post">
                <button type="submit" class="logout-btn">
                    <span class="material-icons">exit_to_app</span>
                    Logout
                </button>
            </form>
        </div>
    </div>

    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("pragma", "no-cache");
        response.setHeader("Expires", "0");

        if (session.isNew() || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = session.getAttribute("username").toString();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DAO.getConnection();
            String query1 = "SELECT balance FROM Balance WHERE username = ?";
            ps = con.prepareStatement(query1);
            ps.setString(1, username);
            rs = ps.executeQuery();

            if (rs.next()) {
    %>
    <div class="balance">
        <div>Available Balance</div>
        <div class="balance-amount">₹<%= rs.getString(1) %></div>
    </div>
    <%
        }

        rs.close();
        ps.close();
    %>

    <div class="actions">
        <div class="action-item">
            <span class="material-icons">account_balance</span>
            <div>To Bank</div>
        </div>
        <div class="action-item">
            <span class="material-icons">credit_card</span>
            <div>To UPI</div>
        </div>
        <div class="action-item">
            <span class="material-icons">history</span>
            <div>History</div>
        </div>
    </div>

    <div class="transactions">
        <h2>Recent Transactions</h2>
        <%
            String query = "SELECT * FROM transaction WHERE username= ?";
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
        %>
        <div class="transaction-item">
            <div class="transaction-details">
                <div class="transaction-icon">
                    <span class="material-icons">swap_horiz</span>
                </div>
                <div>
                    <div><%= rs.getString(2) %></div>
                    <div><small><%= rs.getString(1) %></small></div>
                </div>
            </div>
            <div class="transaction-amount">₹<%= rs.getString(3) %></div>
        </div>
        <%
            }

            rs.close();
            ps.close();

            query = "SELECT * FROM transaction WHERE username2= ?";
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
        %>
        <div class="transaction-item">
            <div class="transaction-details">
                <div class="transaction-icon">
                    <span class="material-icons">swap_horiz</span>
                </div>
                <div>
                    <div><%= rs.getString(1) %></div>
                    <div><small><%= rs.getString(2) %></small></div>
                </div>
            </div>
            <div class="transaction-amount">₹<%= rs.getString(3) %></div>
        </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
                if (ps != null) try { ps.close(); } catch (Exception e) { e.printStackTrace(); }
                if (con != null) try { con.close(); } catch (Exception e) { e.printStackTrace(); }
            }
        %>
    </div>

    <div class="send-money">
        <button class="send-money-btn" onclick="openSendMoneyModal()">
            <span class="material-icons">send</span>
        </button>
    </div>

    <div id="sendMoneyModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeSendMoneyModal()">&times;</span>
            <h2>Send Money</h2>
            <form action="send" method="post">
                <input name="u2" type="text" placeholder="Recipient's Username" required>
                <input name="ammount" type="number" placeholder="Amount" required>
                <input type="submit" value="Send">
            </form>
        </div>
    </div>
</div>

<script>
    function openSendMoneyModal() {
        document.getElementById("sendMoneyModal").style.display = "block";
    }

    function closeSendMoneyModal() {
        document.getElementById("sendMoneyModal").style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == document.getElementById("sendMoneyModal")) {
            closeSendMoneyModal();
        }
    }
</script>
</body>
</html>