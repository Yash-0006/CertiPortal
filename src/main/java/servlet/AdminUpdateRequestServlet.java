package servlet;

import dao.RequestDAO;
import models.requests;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet("/admin/update-request")
public class AdminUpdateRequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("admin_login.jsp");
            return;
        }

        int requestId = Integer.parseInt(request.getParameter("request_id"));
        String status = request.getParameter("status");
        String comment = request.getParameter("comment");
        String handledBy = ((models.admin) session.getAttribute("admin")).getName();

        RequestDAO dao = new RequestDAO();
        requests req = new requests();
        req.setRequest_id(requestId);
        req.setStatus(status);
        req.setAdmin_comment(comment);
        req.setHandled_by(handledBy);
        req.setUpdated_at(LocalDateTime.now()); // ✅ Fix: set with current time

        boolean updated = dao.updateRequest(req);
        if (updated) {
            response.sendRedirect(request.getContextPath() + "/admin_dashboard.jsp?success=Request+Updated");
        } else {
            request.setAttribute("error", "Failed to update request");
            request.getRequestDispatcher("/admin_dashboard.jsp").forward(request, response); // ✅ Fix: no context path here
        }
    }
}
