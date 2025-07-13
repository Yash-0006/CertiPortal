package servlet;

import dao.RequestedFilesDAO;
import models.requested_files;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/view-documents")
public class ViewRequestDocumentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestIdParam = request.getParameter("id");
        if (requestIdParam == null) {
            response.sendRedirect("admin_dashboard.jsp?error=Invalid+Request+ID");
            return;
        }

        int requestId = Integer.parseInt(requestIdParam);
        RequestedFilesDAO dao = new RequestedFilesDAO();
        List<requested_files> files = dao.getFilesByRequestId(requestId);

        request.setAttribute("files", files);
        request.setAttribute("requestId", requestId);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/view_documents.jsp");
        dispatcher.forward(request, response);
    }
}
