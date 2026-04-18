<%@ page import="java.util.List" %>
<%@ page import="com.question.model.Question" %>

<%
    Integer scoreObj = (Integer) request.getAttribute("score");
    Integer totalObj = (Integer) request.getAttribute("total");
    List<Question> questions = (List<Question>) request.getAttribute("questions");

    int score = (scoreObj != null) ? scoreObj : 0;
    int total = (totalObj != null) ? totalObj : 0;
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
            width: 80%;
            margin: auto;
            padding: 20px;
        }

        .score-box {
            background: #d1fae5;
            padding: 20px;
            text-align: center;
            font-size: 22px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .card {
            background: white;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        .correct {
            color: green;
            font-weight: bold;
        }
    </style>
</head>

<body>

<div class="container">

<h2>🎯 Quiz Result</h2>

<div class="score-box">
    Score: <%=score%> / <%=total%>
</div>

<%
if(questions != null){
    for(Question q : questions){
%>

<div class="card">

    <p><b><%=q.getQuestionText()%></b></p>

    <p class="correct">
        Correct Answer: <%=q.getCorrectAnswer()%>
    </p>

</div>

<%
    }
}
%>

</div>

</body>
</html>