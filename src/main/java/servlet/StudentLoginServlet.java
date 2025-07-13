package servlet;

import dao.StudentDAO;
import models.student;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class StudentLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        StudentDAO dao = new StudentDAO();
        student s = dao.getStudentByEmailAndPassword(email, password);

        if (s != null) {
            HttpSession session = request.getSession();
            session.setAttribute("student", s);
            response.sendRedirect("student_dashboard.jsp");
        } else {
            request.setAttribute("error", "Invalid email or password.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("student_login.jsp");
            dispatcher.forward(request, response);
        }
    }
}