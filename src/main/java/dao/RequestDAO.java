package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import dbconnections.StudentToOfficeDBConnection;
import models.requests;

public class RequestDAO {
    private Connection conn = StudentToOfficeDBConnection.getConnection();

    public boolean insertRequest(requests r) {
        try {
            String sql = "INSERT INTO requests (student_id, student_pin_no, certificate_type, status, admin_comment, handled_by, requested_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, r.getStudent_id());
            stmt.setString(2, r.getStudent_pin_no()); // ✅ pin_no now included
            stmt.setString(3, r.getCertificate_type());
            stmt.setString(4, r.getStatus());
            stmt.setString(5, r.getAdmin_comment());
            stmt.setString(6, r.getHandled_by());
            stmt.setTimestamp(7, Timestamp.valueOf(r.getRequested_at()));
            stmt.setTimestamp(8, Timestamp.valueOf(r.getUpdated_at()));

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    public List<requests> getAllRequests() {
        List<requests> list = new ArrayList<>();
        try {
        	String sql = "SELECT r.*, s.pin_no FROM requests r JOIN student s ON r.student_id = s.id ORDER BY r.requested_at ASC";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                requests r = new requests(
                    rs.getInt("student_id"),
                    rs.getInt("id"),
                    rs.getString("certificate_type"),
                    rs.getString("status"),
                    rs.getString("admin_comment"),
                    rs.getString("handled_by"),
                    rs.getTimestamp("requested_at").toLocalDateTime(),
                    rs.getTimestamp("updated_at").toLocalDateTime(),
                    rs.getString("pin_no")
                );
                list.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public requests getRequestById(int id) {
        try {
            String sql = "SELECT r.*, s.pin_no FROM requests r JOIN student s ON r.student_id = s.id WHERE r.id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new requests(
                    rs.getInt("student_id"),
                    rs.getInt("id"),
                    rs.getString("certificate_type"),
                    rs.getString("status"),
                    rs.getString("admin_comment"),
                    rs.getString("handled_by"),
                    rs.getTimestamp("requested_at").toLocalDateTime(),
                    rs.getTimestamp("updated_at").toLocalDateTime(),
                    rs.getString("pin_no")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateRequestStatus(int id, String status, String comment, String handledBy) {
        try {
            String sql = "UPDATE requests SET status=?, admin_comment=?, handled_by=?, updated_at=? WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, status);
            stmt.setString(2, comment);
            stmt.setString(3, handledBy);
            stmt.setTimestamp(4, Timestamp.valueOf(java.time.LocalDateTime.now()));
            stmt.setInt(5, id);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateRequest(requests req) {
        try {
            String sql = "UPDATE requests SET status=?, admin_comment=?, handled_by=?, updated_at=? WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, req.getStatus());
            stmt.setString(2, req.getAdmin_comment());
            stmt.setString(3, req.getHandled_by());
            stmt.setTimestamp(4, Timestamp.valueOf(req.getUpdated_at()));
            stmt.setInt(5, req.getRequest_id());
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<requests> getRequestsByStudentId(int studentId) {
        List<requests> list = new ArrayList<>();
        try {
            String sql = "SELECT r.*, s.pin_no FROM requests r JOIN student s ON r.student_id = s.id WHERE r.student_id=? ORDER BY r.requested_at DESC";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, studentId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                requests r = new requests(
                    rs.getInt("student_id"),
                    rs.getInt("id"),
                    rs.getString("certificate_type"),
                    rs.getString("status"),
                    rs.getString("admin_comment"),
                    rs.getString("handled_by"),
                    rs.getTimestamp("requested_at").toLocalDateTime(),
                    rs.getTimestamp("updated_at").toLocalDateTime(),
                    rs.getString("pin_no")
                );
                list.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<requests> getApprovedRequestsByStudentId(int studentId) {
        List<requests> list = new ArrayList<>();
        try {
            String sql = "SELECT r.*, s.pin_no FROM requests r JOIN student s ON r.student_id = s.id WHERE r.student_id=? AND r.status='Approved'";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, studentId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                requests r = new requests(
                    rs.getInt("student_id"),
                    rs.getInt("id"),
                    rs.getString("certificate_type"),
                    rs.getString("status"),
                    rs.getString("admin_comment"),
                    rs.getString("handled_by"),
                    rs.getTimestamp("requested_at").toLocalDateTime(),
                    rs.getTimestamp("updated_at").toLocalDateTime(),
                    rs.getString("pin_no")
                );
                list.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public requests getLatestRequestByStudent(int studentId) {
        try {
            String sql = "SELECT r.*, s.pin_no FROM requests r JOIN student s ON r.student_id = s.id WHERE r.student_id = ? ORDER BY r.requested_at DESC LIMIT 1";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, studentId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new requests(
                    rs.getInt("student_id"),
                    rs.getInt("id"),
                    rs.getString("certificate_type"),
                    rs.getString("status"),
                    rs.getString("admin_comment"),
                    rs.getString("handled_by"),
                    rs.getTimestamp("requested_at").toLocalDateTime(),
                    rs.getTimestamp("updated_at").toLocalDateTime(),
                    rs.getString("pin_no")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public List<requests> getRequestsByStatus(String status) {
        List<requests> list = new ArrayList<>();
        try {
            String sql = "SELECT r.*, s.pin_no FROM requests r JOIN student s ON r.student_id = s.id WHERE r.status=? ORDER BY r.requested_at ASC";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, status);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                requests r = new requests(
                    rs.getInt("student_id"),
                    rs.getInt("id"),
                    rs.getString("certificate_type"),
                    rs.getString("status"),
                    rs.getString("admin_comment"),
                    rs.getString("handled_by"),
                    rs.getTimestamp("requested_at").toLocalDateTime(),
                    rs.getTimestamp("updated_at").toLocalDateTime(),
                    rs.getString("pin_no")
                );
                list.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    
    public List<requests> searchRequests(String keyword) {
        List<requests> list = new ArrayList<>();
        try {
            String sql = "SELECT r.*, s.pin_no FROM requests r JOIN student s ON r.student_id = s.id " +
                         "WHERE s.pin_no LIKE ? OR r.certificate_type LIKE ? ORDER BY r.requested_at ASC";
            PreparedStatement stmt = conn.prepareStatement(sql);
            String searchPattern = "%" + keyword + "%";
            stmt.setString(1, searchPattern);
            stmt.setString(2, searchPattern);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                requests r = new requests(
                    rs.getInt("student_id"),
                    rs.getInt("id"),
                    rs.getString("certificate_type"),
                    rs.getString("status"),
                    rs.getString("admin_comment"),
                    rs.getString("handled_by"),
                    rs.getTimestamp("requested_at").toLocalDateTime(),
                    rs.getTimestamp("updated_at").toLocalDateTime(),
                    rs.getString("pin_no")
                );
                list.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    
    public List<requests> searchRequestsByStatus(String keyword, String status) {
        List<requests> list = new ArrayList<>();
        try {
            String sql = "SELECT r.*, s.pin_no FROM requests r JOIN student s ON r.student_id = s.id " +
                         "WHERE (s.pin_no LIKE ? OR r.certificate_type LIKE ?) AND r.status=? ORDER BY r.requested_at ASC";
            PreparedStatement stmt = conn.prepareStatement(sql);
            String searchPattern = "%" + keyword + "%";
            stmt.setString(1, searchPattern);
            stmt.setString(2, searchPattern);
            stmt.setString(3, status);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                requests r = new requests(
                    rs.getInt("student_id"),
                    rs.getInt("id"),
                    rs.getString("certificate_type"),
                    rs.getString("status"),
                    rs.getString("admin_comment"),
                    rs.getString("handled_by"),
                    rs.getTimestamp("requested_at").toLocalDateTime(),
                    rs.getTimestamp("updated_at").toLocalDateTime(),
                    rs.getString("pin_no")
                );
                list.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


}
