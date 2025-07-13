package servlet;

import dao.AdminDAO;
import models.admin;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        AdminDAO dao = new AdminDAO();
        admin a = dao.getAdminByEmailAndPassword(email, password);

        if (a != null) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", a);
            response.sendRedirect(request.getContextPath() + "/admin_dashboard.jsp");
        } else {
            request.setAttribute("error", "Invalid credentials.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin_login.jsp");
            dispatcher.forward(request, response);
        }
    }
}
