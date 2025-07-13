package dao;

import java.sql.*;
import java.util.*;
import dbconnections.StudentToOfficeDBConnection;
import models.requested_files;

public class RequestedFilesDAO {
    private Connection conn = StudentToOfficeDBConnection.getConnection();

    public boolean insertFile(requested_files f) {
        try {
            String sql = "INSERT INTO requested_files (request_id, file_name, file_path, uploaded_at) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, f.getRequest_id());
            stmt.setString(2, f.getFile_name());
            stmt.setString(3, f.getFile_path());
            stmt.setTimestamp(4, Timestamp.valueOf(f.getUploaded_at()));
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<requested_files> getAllFiles() {
        List<requested_files> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM requested_files ORDER BY uploaded_at DESC";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                requested_files file = new requested_files();
                file.setId(rs.getInt("id"));
                file.setRequest_id(rs.getInt("request_id"));
                file.setFile_name(rs.getString("file_name"));
                file.setFile_path(rs.getString("file_path"));
                file.setUploaded_at(rs.getTimestamp("uploaded_at").toLocalDateTime());
                list.add(file);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    
    public List<requested_files> getFilesByRequestId(int requestId) {
        List<requested_files> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM requested_files WHERE request_id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, requestId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                requested_files file = new requested_files(
                    rs.getInt("id"), rs.getInt("request_id"),
                    rs.getString("file_name"), rs.getString("file_path"),
                    rs.getTimestamp("uploaded_at").toLocalDateTime()
                );
                list.add(file);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
