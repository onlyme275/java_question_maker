package com.user.controller;

import java.io.IOException;

import com.user.model.User;
import com.user.model.dao.UserDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher("/pages/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String ageStr = req.getParameter("age");
        String address = req.getParameter("address");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if(username.isEmpty() || ageStr.isEmpty() || address.isEmpty()
                || email.isEmpty() || password.isEmpty()) {

            req.setAttribute("error", "All fields are required!");
            req.getRequestDispatcher("/pages/register.jsp").forward(req, resp); 
            return;
        }

        try {
            int age = Integer.parseInt(ageStr);

            User user = new User();
            user.setUsername(username);
            user.setAge(age);
            user.setAddress(address);
            user.setEmail(email);
            user.setPassword(password);
            user.setIs_staff(0);

            UserDao dao = new UserDao();
            boolean result = dao.insertUser(user);

            if(result){
                resp.sendRedirect("login");
            } else {
                req.setAttribute("error", "Registration failed!");
                req.getRequestDispatcher("/pages/register.jsp").forward(req, resp); 
            }

        } catch (Exception e){
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("/pages/register.jsp").forward(req, resp); 
        }
    }
}