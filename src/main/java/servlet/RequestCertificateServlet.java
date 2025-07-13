package servlet;

import dao.RequestDAO;
import dao.RequestedFilesDAO;
import models.requests;
import models.requested_files;
import models.student;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.time.LocalDateTime;
import java.util.Collection;

@WebServlet("/request")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1, // 1MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class RequestCertificateServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("student") == null) {
            response.sendRedirect("student_login.jsp");
            return;
        }

        student std = (student) session.getAttribute("student");
        String certificateType = request.getParameter("certificate_type");

        if (certificateType == null || certificateType.trim().isEmpty()) {
            request.setAttribute("error", "Certificate type is required.");
            request.getRequestDispatcher("request_certificate.jsp").forward(request, response);
            return;
        }

        requests req = new requests();
        req.setStudent_id(std.getId());
        req.setStudent_pin_no(std.getPin_no());
        req.setCertificate_type(certificateType);
        req.setStatus("Pending");
        req.setAdmin_comment("Awaiting review");
        req.setHandled_by("Unassigned");
        req.setRequested_at(LocalDateTime.now());
        req.setUpdated_at(LocalDateTime.now());

        RequestDAO dao = new RequestDAO();
        boolean success = dao.insertRequest(req);

        if (!success) {
            request.setAttribute("error", "Failed to submit certificate request.");
            request.getRequestDispatcher("request_certificate.jsp").forward(request, response);
            return;
        }

        requests newRequest = dao.getLatestRequestByStudent(std.getId());
        if (newRequest == null) {
            request.setAttribute("error", "Request submitted but could not retrieve reference.");
            request.getRequestDispatcher("request_certificate.jsp").forward(request, response);
            return;
        }

        String appPath = request.getServletContext().getRealPath("");
        String uploadPath = appPath + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        Collection<Part> parts = request.getParts();
        RequestedFilesDAO fileDAO = new RequestedFilesDAO();

        for (Part part : parts) {
            if (part.getName().equals("documents") && part.getSize() > 0) {
                String fileName = extractFileName(part);
                String filePath = uploadPath + File.separator + fileName;
                part.write(filePath);

                requested_files file = new requested_files();
                file.setRequest_id(newRequest.getRequest_id());
                file.setFile_name(fileName);
                file.setFile_path(UPLOAD_DIR + "/" + fileName);
                file.setUploaded_at(LocalDateTime.now());

                fileDAO.insertFile(file);
            }
        }

        response.sendRedirect("student_dashboard.jsp?success=Request+submitted+successfully");
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String token : contentDisp.split(";")) {
            if (token.trim().startsWith("filename")) {
                return new File(token.substring(token.indexOf('=') + 1).replace("\"", "")).getName();
            }
        }
        return "unknown";
    }
}
