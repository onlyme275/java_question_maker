package com.user.controller;

import java.io.IOException;

import com.user.model.User;
import com.user.model.dao.UserDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher("/pages/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if(email.isEmpty() || password.isEmpty()){
            req.setAttribute("error", "Email and password required!");
            req.getRequestDispatcher("/pages/login.jsp").forward(req, resp);  // ✅ FIXED
            return;
        }

        try {
            UserDao dao = new UserDao();
            User user = dao.loginUser(email, password);

            if(user == null){
                req.setAttribute("error", "Invalid email or password!");
                req.getRequestDispatcher("/pages/login.jsp").forward(req, resp);  
            } else {
                HttpSession session = req.getSession();
                session.setAttribute("user", user);

                resp.sendRedirect("dashboard");
            }

        } catch (Exception e){
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("/pages/login.jsp").forward(req, resp);
        }
    }
}

