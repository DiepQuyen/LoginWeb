package org.example.webapp.dao;

import org.example.webapp.models.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/LoginDB";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "";

    public static boolean validate(User user) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);

            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());

            ResultSet rs = stmt.executeQuery();
            boolean isValid = rs.next();

            rs.close();
            stmt.close();
            conn.close();

            return isValid;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}