package com.user.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String page = req.getParameter("page");

        if (page == null || page.isEmpty()) {
            page = "info";
        }

        String contentPage = "/dashboard/info.jsp";

        switch (page) {

            case "question":
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

        req.setAttribute("contentPage", contentPage);

        req.getRequestDispatcher("/dashboard/sidebar.jsp")
                .forward(req, resp);
    }
}