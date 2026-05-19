<%@ page import="java.util.List" %>
<%@ page import="com.question.model.dao.QuestionDao" %>
<%@ page import="com.question.model.UserAnswer" %>
<%@ page import="com.user.model.User" %>

<%
User user = (User) session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}

QuestionDao dao = new QuestionDao();

List<UserAnswer> answers = dao.getUserAnswers(user.getId());

Integer score = (Integer) session.getAttribute("score");
Integer total = (Integer) session.getAttribute("total");

if(score == null) score = 0;
if(total == null) total = 0;

int percent = (total > 0) ? (score * 100 / total) : 0;
%>

<!DOCTYPE html>
<html>
<head>
<title>Result</title>

<style>
body {
    font-family: Arial;
    background: #f4f6f9;
}

.container {
    width: 70%;
    margin: auto;
}

.card {
    background: white;
    padding: 15px;
    margin: 12px 0;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

.result-box {
    background: linear-gradient(135deg, #4facfe, #00f2fe);
    color: white;
    padding: 20px;
    border-radius: 12px;
    text-align: center;
    margin: 20px 0;
}

.score {
    font-size: 28px;
    font-weight: bold;
}

.progress {
    background: #ddd;
    border-radius: 20px;
    overflow: hidden;
    margin-top: 10px;
}

.bar {
    height: 15px;
    background: #28a745;
    width: <%=percent%>%;
}

.correct {
    color: green;
    font-weight: bold;
}

.wrong {
    color: red;
    font-weight: bold;
}

.small {
    color: #555;
    font-size: 13px;
}
</style>

</head>

<body>

<div class="container">

<h2> Quiz Result</h2>

<!-- ================= SCORE CARD ================= -->
<div class="result-box">

    <div class="score"><%=score%> / <%=total%></div>
    <p>Your Performance</p>

    <div class="progress">
        <div class="bar"></div>
    </div>

    <p><%=percent%>% Correct</p>

</div>

<!-- ================= ANSWERS ================= -->
<h3>📘 Answer Review</h3>

<%
for(UserAnswer a : answers){
%>

<div class="card">

    <p class="small">Question ID: <%=a.getQuestionId()%></p>

    <p><b>Your Answer:</b> <%=a.getSelectedOption()%></p>

    <p>
        <b>Status:</b>
        <span class="<%=a.isCorrect() ? "correct" : "wrong"%>">
            <%=a.isCorrect() ? "Correct ✔" : "Wrong ✘"%>
        </span>
    </p>

</div>

<%
}
%>

</div>

</body>
</html>