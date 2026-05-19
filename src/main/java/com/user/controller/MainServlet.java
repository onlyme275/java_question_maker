package com.user.controller;

import java.io.IOException;
import java.util.List;

import com.hero.model.Hero;
import com.hero.model.dao.HeroDao;
import com.whyus.model.Whyus;
import com.whyus.model.dao.WhyusDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/main")
public class MainServlet extends HttpServlet {

    private HeroDao dao = new HeroDao();
    private WhyusDao whyusDao = new WhyusDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            List<Hero> heroes = dao.getHero();
            List<Whyus> whyusList = whyusDao.getWhyus();

            req.setAttribute("heroes", heroes);
            req.setAttribute("whyusList", whyusList);

            req.getRequestDispatcher("/components/main.jsp")
                    .forward(req, resp);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}



