package com.user.controller;

import java.io.IOException;
import java.util.List;

import com.question.model.Question;
import com.question.model.dao.QuestionDao;
import com.user.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    QuestionDao dao = new QuestionDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Check if user is logged in
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            resp.sendRedirect("login");
            return;
        }

        String page = req.getParameter("page");

        if (page == null || page.isEmpty()) {
            page = "info";
        }

        String contentPage = "/dashboard/info.jsp";

        try {

            switch (page) {

                case "question":

                    List<Question> questions = dao.getAllQuestions();
                    req.setAttribute("questions", questions);

                    contentPage = "/dashboard/question.jsp";
                    break;

                case "result":
                    contentPage = "/dashboard/result.jsp";
                    break;

                case "adminhero":
                    contentPage = "/dashboard/adminhero.jsp";
                    break;

                case "adminwhyus":
                    contentPage = "/dashboard/adminwhyus.jsp";
                    break;

                case "adminabout":
                    contentPage = "/dashboard/adminabout.jsp";
                    break;

                case "adminlocalnews":
                    contentPage = "/dashboard/adminlocalnews.jsp";
                    break;

                case "adminanswers":
                    contentPage = "/dashboard/adminanswers.jsp";
                    break;

                default:
                    contentPage = "/dashboard/info.jsp";
            }

        } catch (Exception e) {
            throw new ServletException("Dashboard load failed", e);
        }

        req.setAttribute("contentPage", contentPage);

        req.getRequestDispatcher("/dashboard/sidebar.jsp")
                .forward(req, resp);
    }
}




