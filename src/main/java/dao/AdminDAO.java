package dao;

import java.sql.*;
import dbconnections.StudentToOfficeDBConnection;
import models.admin;

public class AdminDAO {
    private Connection conn = StudentToOfficeDBConnection.getConnection();

    // For admin login
    public admin getAdminByEmailAndPassword(String email, String password) {
        try {
            String sql = "SELECT * FROM admin WHERE email=? AND password=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password); // direct comparison
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new admin(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("role"),
                    rs.getString("phone_no"),
                    rs.getString("password")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}