package servlet;

import dao.RequestedFilesDAO;
import models.requested_files;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/view_documents")
public class ViewDocumentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            int requestId = Integer.parseInt(request.getParameter("id"));
            RequestedFilesDAO dao = new RequestedFilesDAO();
            List<requested_files> files = dao.getFilesByRequestId(requestId);

            request.setAttribute("files", files);
            request.setAttribute("requestId", requestId);
            request.getRequestDispatcher("view_documents.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("view_requests.jsp?error=Could+not+load+documents");
        }
    }
}
