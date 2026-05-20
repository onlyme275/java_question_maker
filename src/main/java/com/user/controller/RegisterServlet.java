package com.user.controller;

import java.io.IOException;
import java.util.regex.Pattern;

import com.user.model.User;
import com.user.model.dao.UserDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final Pattern EMAIL_PATTERN =
            Pattern.compile("^[A-Za-z0-9+_.-]+@(.+)$");

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
        String confirmPassword = req.getParameter("confirmPassword");

        username = username == null ? null : username.trim();
        ageStr = ageStr == null ? null : ageStr.trim();
        address = address == null ? null : address.trim();
        email = email == null ? null : email.trim();

        if (username == null || username.isEmpty()) {
            forwardWithError(req, resp, "Username is required!");
            return;
        }

        if (ageStr == null || ageStr.isEmpty()) {
            forwardWithError(req, resp, "Age is required!");
            return;
        }

        if (address == null || address.isEmpty()) {
            forwardWithError(req, resp, "Address is required!");
            return;
        }

        if (email == null || !EMAIL_PATTERN.matcher(email).matches()) {
            forwardWithError(req, resp, "Please enter a valid email address!");
            return;
        }

        if (password == null || password.length() < 6) {
            forwardWithError(req, resp, "Password must be at least 6 characters long!");
            return;
        }

        if (confirmPassword == null || !password.equals(confirmPassword)) {
            forwardWithError(req, resp, "Passwords do not match!");
            return;
        }

        try {
            int age = Integer.parseInt(ageStr);

            if (age <= 0 || age > 120) {
                forwardWithError(req, resp, "Please enter a valid age!");
                return;
            }

            User user = new User();
            user.setUsername(username);
            user.setAge(age);
            user.setAddress(address);
            user.setEmail(email);
            user.setPassword(password);
            user.setIs_staff(0);

            UserDao dao = new UserDao();
            boolean result = dao.insertUser(user);

            if (result) {
                resp.sendRedirect("login?registered=true");
            } else {
                forwardWithError(req, resp, "Registration failed!");
            }

        } catch (NumberFormatException e) {
            forwardWithError(req, resp, "Please enter a valid age!");
        } catch (Exception e) {
            forwardWithError(req, resp, e.getMessage());
        }
    }

    private void forwardWithError(HttpServletRequest req, HttpServletResponse resp, String error)
            throws ServletException, IOException {
        req.setAttribute("error", error);
        req.getRequestDispatcher("/pages/register.jsp").forward(req, resp);
    }
}
