package com.david.virtualwallet;

import com.david.virtualwallet.DAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/register")
public class Register extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException,ServletException {

        String name = req.getParameter("name");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");
        Connection con = null;
        String query = "INSERT INTO usersInfo(name, username, phoneNumber, password) VALUES (?,?,?,?)";
        try {
            con = DAO.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,name);
            ps.setString(2,username);
            ps.setString(3,phone);
            ps.setString(4,password);
            int val = 0;
            try{ val = ps.executeUpdate();

            }
            catch (Exception e){
                resp.getWriter().println("Enter the valid constraints");
                RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
                rd.forward(req,resp);
            }
            if(val != 0){
                String query2 = "insert into Balance (username, balance) values (?,10000)";
                PreparedStatement ps1 = con.prepareStatement(query2);
                ps1.setString(1,username);
                ps1.executeUpdate();
                RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
                rd.forward(req,resp);
            }
            else{
                resp.getWriter().println("Enter the valid constraints");
                RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
                rd.forward(req,resp);
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}