package servlet;

import dao.StudentDAO;
import models.student;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class StudentRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String department = request.getParameter("department");
        String pin_no = request.getParameter("pin_no");
        String phone_no = request.getParameter("phone_no");
        String password = request.getParameter("password");

        student s = new student();
        s.setName(name);
        s.setEmail(email);
        s.setDepartment(department);
        s.setPin_no(pin_no);
        s.setPhone_no(phone_no);
        s.setPassword(password);

        StudentDAO dao = new StudentDAO();
        boolean success = dao.registerStudent(s);

        if (success) {
            request.setAttribute("message", "Registered successfully!");
            response.sendRedirect("student_login.jsp");
        } else {
            request.setAttribute("error", "Registration failed. Try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("student_register.jsp");
            dispatcher.forward(request, response);
        }
    }
}
