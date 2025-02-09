package org.example.webapp.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.webapp.dao.UserDAO;
import org.example.webapp.models.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User(username, password);
        if (UserDAO.validate(user)) {
            HttpSession session = request.getSession();
            session.setAttribute("user", username);
            request.getRequestDispatcher("/view/home.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Sai tài khoản hoặc mật khẩu!");
            request.getRequestDispatcher("/view/login.jsp").forward(request, response);
        }
    }
}