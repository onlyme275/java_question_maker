package com.question.model;

public class UserAnswer {

    private int id;
    private int userId;
    private int questionId;
    private String selectedOption;
    private boolean isCorrect;

    // Default constructor
    public UserAnswer(){}

    // Parameterized constructor
    public UserAnswer(int userId, int questionId,
                      String selectedOption, boolean isCorrect) {
        this.userId = userId;
        this.questionId = questionId;
        this.selectedOption = selectedOption;
        this.isCorrect = isCorrect;
    }

    // Getters & Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getQuestionId() { return questionId; }
    public void setQuestionId(int questionId) { this.questionId = questionId; }

    public String getSelectedOption() { return selectedOption; }
    public void setSelectedOption(String selectedOption) { this.selectedOption = selectedOption; }

    public boolean isCorrect() { return isCorrect; }
    public void setCorrect(boolean isCorrect) { this.isCorrect = isCorrect; }
}