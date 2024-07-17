package com.david.virtualwallet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO {
    private static final String url = "jdbc:mysql://localhost:3306/VirtualWallet";
    private static final String name = "root";
    private static final String password = "0258";
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, name, password);
        return con;
    }
}