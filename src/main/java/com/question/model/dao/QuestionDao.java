package com.question.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.question.model.Question;
import com.utils.DbConnection;

public class QuestionDao {

    // ---------------- CREATE ----------------
    public void addQuestion(Question q) throws Exception {

        String sql = "INSERT INTO question(question_text, option_a, option_b, option_c, option_d, correct_answer) VALUES(?,?,?,?,?,?)";

        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, q.getQuestionText());
            ps.setString(2, q.getOptionA());
            ps.setString(3, q.getOptionB());
            ps.setString(4, q.getOptionC());
            ps.setString(5, q.getOptionD());
            ps.setString(6, q.getCorrectAnswer());

            ps.executeUpdate();
        }
    }

    // ---------------- READ ----------------
    public List<Question> getAllQuestions() throws Exception {

        List<Question> list = new ArrayList<>();

        String sql = "SELECT * FROM question";

        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Question q = new Question();
                q.setId(rs.getInt("id"));
                q.setQuestionText(rs.getString("question_text"));
                q.setOptionA(rs.getString("option_a"));
                q.setOptionB(rs.getString("option_b"));
                q.setOptionC(rs.getString("option_c"));
                q.setOptionD(rs.getString("option_d"));
                q.setCorrectAnswer(rs.getString("correct_answer"));

                list.add(q);
            }
        }

        return list;
    }

    // ---------------- UPDATE ----------------
    public void updateQuestion(Question q) throws Exception {

        String sql = "UPDATE question SET question_text=?, option_a=?, option_b=?, option_c=?, option_d=?, correct_answer=? WHERE id=?";

        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, q.getQuestionText());
            ps.setString(2, q.getOptionA());
            ps.setString(3, q.getOptionB());
            ps.setString(4, q.getOptionC());
            ps.setString(5, q.getOptionD());
            ps.setString(6, q.getCorrectAnswer());
            ps.setInt(7, q.getId());

            ps.executeUpdate();
        }
    }

    // ---------------- DELETE ----------------
    public void deleteQuestion(int id) throws Exception {

        String sql = "DELETE FROM question WHERE id=?";

        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    // existing method for quiz
    public void saveUserAnswer(int userId, int questionId, String selected, boolean isCorrect) throws Exception {

        String sql = "INSERT INTO user_answer(user_id, question_id, selected_option, is_correct) VALUES(?,?,?,?)";

        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.setInt(2, questionId);
            ps.setString(3, selected);
            ps.setBoolean(4, isCorrect);

            ps.executeUpdate();
        }
    }
}
