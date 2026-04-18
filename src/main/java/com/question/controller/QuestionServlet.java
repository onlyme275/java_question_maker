package com.question.controller;

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

@WebServlet({"/question", "/admin/question"})
public class QuestionServlet extends HttpServlet {

    QuestionDao dao = new QuestionDao();

    // ================= LOAD QUESTIONS =================
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            List<Question> questions = dao.getAllQuestions();

            req.setAttribute("questions", questions);

            req.getRequestDispatcher("/dashboard/question.jsp")
                    .forward(req, resp);

        } catch (Exception e) {
            throw new ServletException("Load failed", e);
        }
    }

    // ================= HANDLE ALL ACTIONS =================
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {

            HttpSession session = req.getSession(false);

            if (session == null || session.getAttribute("user") == null) {
                resp.sendRedirect(req.getContextPath() + "/pages/login.jsp");
                return;
            }

            User user = (User) session.getAttribute("user");

            String action = req.getParameter("action");

            boolean isAdmin = (user.getIs_staff() == 1);

            // ================= ADMIN: ADD =================
            if ("add".equals(action) && isAdmin) {

                dao.addQuestion(buildQuestion(req));

                resp.sendRedirect(req.getContextPath() + "/dashboard?page=question");
                return;
            }

            // ================= ADMIN: DELETE =================
            if ("delete".equals(action) && isAdmin) {

                int id = Integer.parseInt(req.getParameter("id"));
                dao.deleteQuestion(id);

                resp.sendRedirect(req.getContextPath() + "/dashboard?page=question");
                return;
            }

            // ================= ADMIN: UPDATE =================
            if ("update".equals(action) && isAdmin) {

                Question q = buildQuestion(req);
                q.setId(Integer.parseInt(req.getParameter("id")));

                dao.updateQuestion(q);

                resp.sendRedirect(req.getContextPath() + "/dashboard?page=question");
                return;
            }

            // ================= USER QUIZ =================
            List<Question> questions = dao.getAllQuestions();

            int score = 0;

            for (Question q : questions) {

                String selected = req.getParameter("q_" + q.getId());

                boolean correct = selected != null &&
                        selected.equals(q.getCorrectAnswer());

                if (correct) {
                    score++;
                }

                dao.saveUserAnswer(
                        user.getId(),
                        q.getId(),
                        selected,
                        correct
                );
            }

            session.setAttribute("score", score);
            session.setAttribute("total", questions.size());

            resp.sendRedirect(req.getContextPath() + "/dashboard?page=result");

        } catch (Exception e) {
            throw new ServletException("Operation failed", e);
        }
    }

    // ================= QUESTION BUILDER =================
    private Question buildQuestion(HttpServletRequest req) {

        Question q = new Question();

        q.setQuestionText(req.getParameter("question_text"));
        q.setOptionA(req.getParameter("option_a"));
        q.setOptionB(req.getParameter("option_b"));
        q.setOptionC(req.getParameter("option_c"));
        q.setOptionD(req.getParameter("option_d"));
        q.setCorrectAnswer(req.getParameter("correct_answer"));

        return q;
    }
}