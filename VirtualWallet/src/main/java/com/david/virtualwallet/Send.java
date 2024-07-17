package com.david.virtualwallet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/send")
public class Send extends HttpServlet {

    //checking user Details are valid or not
    private boolean check(String username, Connection con) throws SQLException {
        String query = "select * from usersInfo where username = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1,username);
        ResultSet rs = ps.executeQuery();
        return rs.next();
    }

    //Checking the balance is sufficent to transfer money
    private boolean BalanceChecker(String username, Connection con, int ammount) throws SQLException {
        String query = "select balance from balance where username = ?";
        PreparedStatement ps  = con.prepareStatement(query);

        ps.setString(1,username);
        ResultSet resultSet = ps.executeQuery();
        resultSet.next();
        int bal =  (resultSet.getInt(1));
        if(bal >= ammount)   return true;
        return false;
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection con = null;

        resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        resp.setHeader("pragma", "no-cache");
        resp.setHeader("Expires","0");
        HttpSession session = req.getSession(false);
        String username = session.getAttribute("username").toString();
        if(username == null) {
            resp.sendRedirect("login.jsp");
        }

        try {
            con = DAO.getConnection();

            // Query to add transaction details into tarsaction table.

            String u2 = req.getParameter("u2");
            int ammount = Integer.parseInt(req.getParameter("ammount"));

            if(!check(u2,con)){
                resp.sendRedirect("DashBoard.jsp");

            }
            else if(!BalanceChecker(username, con, ammount)){

                resp.sendRedirect("DashBoard.jsp");

            }
            else {
                String query = "Insert into transaction(username, username2, moneytransfered) values (?,?,?) ";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, username);
                ps.setString(2, u2);
                ps.setInt(3, ammount);
                ps.executeUpdate();

                // Query to update the balance of user as debited
                String query1 = "update balance set balance = ? where username = ?";

                ps = con.prepareStatement(query1);
                ps.setInt(1, getBalance(con, username) - ammount);
                ps.setString(2, username);
                ps.executeUpdate();

                // Query to update the balance of user as credited.
                query1 = "update balance set balance = ? where username = ?";

                ps = con.prepareStatement(query1);
                ps.setInt(1, getBalance(con, u2) + ammount);
                ps.setString(2, u2);
                ps.executeUpdate();

                resp.sendRedirect("DashBoard.jsp");

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        //resp.sendRedirect("DashBoard.jsp");
    }


    //Getting the balance of user
    private int getBalance(Connection con, String username) throws SQLException {
        String query = "select balance from balance where username = ?";
        PreparedStatement ps  = con.prepareStatement(query);

        ps.setString(1,username);
        ResultSet resultSet = ps.executeQuery();
        resultSet.next();
        int bal =  (resultSet.getInt(1));
        return bal;
    }
}
