package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import dao.RequestDAO;
import models.requests;
import models.student;
import java.io.*;

@WebServlet("/generate-certificate")
public class GenerateCertificateServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        student student = (student) session.getAttribute("student");

        if (student == null) {
            response.sendRedirect("student_login.jsp");
            return;
        }

        int requestId = Integer.parseInt(request.getParameter("request_id"));
        RequestDAO dao = new RequestDAO();
        requests req = dao.getRequestById(requestId);

        if (req == null || !"Approved".equals(req.getStatus()) || req.getStudent_id() != student.getId()) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        // Set response headers
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=certificate_" + requestId + ".pdf");

        try {
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            document.addTitle("Certificate of " + req.getCertificate_type());
            document.add(new Paragraph("CERTIFICATE", new Font(Font.FontFamily.HELVETICA, 20, Font.BOLD)));
            document.add(new Paragraph("\n"));
            document.add(new Paragraph("This is to certify that Mr./Ms. " + student.getName() +
                    " from the " + student.getDepartment() + " department has been issued a " +
                    req.getCertificate_type() + " by the administrative office.",
                    new Font(Font.FontFamily.TIMES_ROMAN, 14)));
            document.add(new Paragraph("\n"));
            document.add(new Paragraph("Request ID: " + req.getRequest_id()));
            document.add(new Paragraph("Issued Date: " + java.time.LocalDate.now()));
            document.add(new Paragraph("\n\n"));
            document.add(new Paragraph("-- Admin Office"));

            document.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
