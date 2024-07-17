package com.david.virtualwallet;

import com.david.virtualwallet.DAO;
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

@WebServlet("/login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        resp.setHeader("pragma", "no-cache");
        resp.setHeader("Expires","0");
        String username = req.getParameter("usernameOrPhone");
        String password = req.getParameter("password");

        String query = "SELECT * FROM usersInfo where (username = ? or phoneNumber = ?) and password = ?";
        Connection con = null;
        try {
            con = DAO.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,username);
            ps.setString(2,username);
            ps.setString(3,password);
            HttpSession session = req.getSession();
            session.setAttribute("username",username);
            ResultSet resultSet = ps.executeQuery();
            if(resultSet.next()){
               resp.sendRedirect("DashBoard.jsp");
            }
            else{
                resp.sendRedirect("login.jsp");
            }
            if(session.getAttribute("username").toString() == null) resp.sendRedirect("login.jsp");

        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }
}