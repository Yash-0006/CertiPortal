package servlet;

import dao.RequestedFilesDAO;
import models.requested_files;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.nio.file.*;
import java.time.LocalDateTime;

@WebServlet("/upload")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class UploadFileServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int requestId = Integer.parseInt(request.getParameter("request_id"));
        Part filePart = request.getPart("file");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        String appPath = request.getServletContext().getRealPath("");
        String uploadPath = appPath + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        String filePath = uploadPath + File.separator + fileName;
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
        }

        requested_files fileModel = new requested_files();
        fileModel.setRequest_id(requestId);
        fileModel.setFile_name(fileName);
        fileModel.setFile_path(filePath);
        fileModel.setUploaded_at(LocalDateTime.now());

        RequestedFilesDAO dao = new RequestedFilesDAO();
        boolean success = dao.insertFile(fileModel);

        if (success) {
            response.sendRedirect("student_dashboard.jsp?success=File+uploaded");
        } else {
            request.setAttribute("error", "Failed to upload file.");
            request.getRequestDispatcher("upload_file.jsp").forward(request, response);
        }
    }
}
