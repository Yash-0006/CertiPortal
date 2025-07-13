package dao;

import java.sql.*;
import dbconnections.StudentToOfficeDBConnection;
import models.student;
import org.mindrot.jbcrypt.BCrypt;

public class StudentDAO {
    private Connection conn = StudentToOfficeDBConnection.getConnection();


    public boolean registerStudent(student s) {
        try {
            String hashedPassword = BCrypt.hashpw(s.getPassword(), BCrypt.gensalt());

            String sql = "INSERT INTO student (name, email, department, pin_no, phone_no, password) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, s.getName());
            stmt.setString(2, s.getEmail());
            stmt.setString(3, s.getDepartment());
            stmt.setString(4, s.getPin_no());
            stmt.setString(5, s.getPhone_no());
            stmt.setString(6, hashedPassword);

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    public student getStudentByEmailAndPassword(String email, String password) {
        try {
            String sql = "SELECT * FROM student WHERE email=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String hashed = rs.getString("password");
                if (BCrypt.checkpw(password, hashed)) {
                    student s = new student();
                    s.setId(rs.getInt("id"));
                    s.setName(rs.getString("name"));
                    s.setEmail(email);
                    s.setDepartment(rs.getString("department"));
                    s.setPin_no(rs.getString("pin_no"));
                    s.setPhone_no(rs.getString("phone_no"));
                    return s;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public student getStudentById(int id) {
        try {
            String sql = "SELECT * FROM students WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new student(
                    rs.getInt("id"), rs.getString("name"),
                    rs.getString("email"), rs.getString("department"),
                    rs.getString("pin_no"), rs.getString("phone_no"),
                    rs.getString("password")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}