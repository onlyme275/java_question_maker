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

    // ---------------- SHOW QUIZ/ADMIN PANEL ----------------
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            List<Question> questions = dao.getAllQuestions();

            req.setAttribute("questions", questions);

            req.getRequestDispatcher("/dashboard/question.jsp")
                    .forward(req, resp);

        } catch (Exception e) {
            throw new ServletException("Error loading questions", e);
        }
    }

    // ---------------- SUBMIT QUIZ OR ADMIN OPERATIONS ----------------
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            String action = req.getParameter("action");

            // ============ ADMIN OPERATIONS ============
            if ("add".equals(action)) {
                addQuestion(req, resp);
                return;
            }

            if ("delete".equals(action)) {
                deleteQuestion(req, resp);
                return;
            }

            if ("update".equals(action)) {
                updateQuestion(req, resp);
                return;
            }

            // ============ USER QUIZ SUBMISSION ============
            submitQuiz(req, resp);

        } catch (Exception e) {
            throw new ServletException("Operation failed", e);
        }
    }

    // ============ ADD QUESTION METHOD ============
    private void addQuestion(HttpServletRequest req, HttpServletResponse resp)
            throws Exception {

        String questionText = req.getParameter("question_text");
        String optionA = req.getParameter("option_a");
        String optionB = req.getParameter("option_b");
        String optionC = req.getParameter("option_c");
        String optionD = req.getParameter("option_d");
        String correctAnswer = req.getParameter("correct_answer");

        if (questionText == null || questionText.trim().isEmpty() ||
            optionA == null || optionA.trim().isEmpty() ||
            optionB == null || optionB.trim().isEmpty() ||
            optionC == null || optionC.trim().isEmpty() ||
            optionD == null || optionD.trim().isEmpty() ||
            correctAnswer == null || correctAnswer.trim().isEmpty()) {

            throw new IllegalArgumentException("All fields are required");
        }

        Question q = new Question();
        q.setQuestionText(questionText);
        q.setOptionA(optionA);
        q.setOptionB(optionB);
        q.setOptionC(optionC);
        q.setOptionD(optionD);
        q.setCorrectAnswer(correctAnswer);

        dao.addQuestion(q);

        // Redirect back to admin panel
        resp.sendRedirect(req.getContextPath() + "/admin/question");
    }

    // ============ DELETE QUESTION METHOD ============
    private void deleteQuestion(HttpServletRequest req, HttpServletResponse resp)
            throws Exception {

        String idStr = req.getParameter("id");

        if (idStr == null || idStr.trim().isEmpty()) {
            throw new IllegalArgumentException("Question ID is required");
        }

        int id = Integer.parseInt(idStr);
        dao.deleteQuestion(id);

        // Redirect back to admin panel
        resp.sendRedirect(req.getContextPath() + "/admin/question");
    }

    // ============ UPDATE QUESTION METHOD ============
    private void updateQuestion(HttpServletRequest req, HttpServletResponse resp)
            throws Exception {

        String idStr = req.getParameter("id");
        String questionText = req.getParameter("question_text");
        String optionA = req.getParameter("option_a");
        String optionB = req.getParameter("option_b");
        String optionC = req.getParameter("option_c");
        String optionD = req.getParameter("option_d");
        String correctAnswer = req.getParameter("correct_answer");

        if (idStr == null || idStr.trim().isEmpty() ||
            questionText == null || questionText.trim().isEmpty() ||
            optionA == null || optionA.trim().isEmpty() ||
            optionB == null || optionB.trim().isEmpty() ||
            optionC == null || optionC.trim().isEmpty() ||
            optionD == null || optionD.trim().isEmpty() ||
            correctAnswer == null || correctAnswer.trim().isEmpty()) {

            throw new IllegalArgumentException("All fields are required");
        }

        int id = Integer.parseInt(idStr);

        Question q = new Question();
        q.setId(id);
        q.setQuestionText(questionText);
        q.setOptionA(optionA);
        q.setOptionB(optionB);
        q.setOptionC(optionC);
        q.setOptionD(optionD);
        q.setCorrectAnswer(correctAnswer);

        dao.updateQuestion(q);

        // Redirect back to admin panel
        resp.sendRedirect(req.getContextPath() + "/admin/question");
    }

    // ============ SUBMIT QUIZ METHOD ============
    private void submitQuiz(HttpServletRequest req, HttpServletResponse resp)
            throws Exception {

        HttpSession session = req.getSession(false);

        // ❗ USER CHECK
        if (session == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        List<Question> questions = dao.getAllQuestions();

        int score = 0;

        for (Question q : questions) {

            String selected = req.getParameter("q_" + q.getId());

            if (selected != null && selected.equals(q.getCorrectAnswer())) {
                score++;
            }

            // save answer (safe)
            dao.saveUserAnswer(
                    user.getId(),
                    q.getId(),
                    selected,
                    selected != null && selected.equals(q.getCorrectAnswer())
            );
        }

        // ---------------- RESULT ----------------
        req.setAttribute("score", score);
        req.setAttribute("total", questions.size());
        req.setAttribute("questions", questions);

        req.getRequestDispatcher("/dashboard/result.jsp")
                .forward(req, resp);
    }
}