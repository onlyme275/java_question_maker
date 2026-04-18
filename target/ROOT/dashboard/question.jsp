<%@ page import="java.util.List" %>
<%@ page import="com.question.model.Question" %>

<%
    List<Question> questions = (List<Question>) request.getAttribute("questions");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Question Panel</title>

    <style>
        body {
            font-family: Arial;
            background: #f3f4f6;
        }

        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
        }

        .card {
            background: white;
            padding: 15px;
            margin: 10px 0;
            border-radius: 10px;
        }

        .form-box {
            background: #ffffff;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
        }

        button {
            padding: 8px 12px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .add-btn {
            background: green;
            color: white;
        }

        .delete-btn {
            background: red;
            color: white;
        }

        .edit-btn {
            background: orange;
            color: white;
        }
    </style>
</head>

<body>

<div class="container">

<h2>🛠 Admin Question Panel</h2>

<!-- ================= CREATE QUESTION ================= -->
<div class="form-box">

    <h3>Create New Question</h3>

    <form method="post" action="${pageContext.request.contextPath}/admin/question">

        <input type="hidden" name="action" value="add">

        <input type="text" name="question_text" placeholder="Enter Question" required>

        <input type="text" name="option_a" placeholder="Option A" required>
        <input type="text" name="option_b" placeholder="Option B" required>
        <input type="text" name="option_c" placeholder="Option C" required>
        <input type="text" name="option_d" placeholder="Option D" required>

        <select name="correct_answer" required>
            <option value="">Select Correct Answer</option>
            <option value="A">A</option>
            <option value="B">B</option>
            <option value="C">C</option>
            <option value="D">D</option>
        </select>

        <button class="add-btn" type="submit">➕ Add Question</button>

    </form>

</div>

<!-- ================= LIST QUESTIONS ================= -->

<h3>📋 All Questions</h3>

<%
if(questions != null){
    for(Question q : questions){
%>

<div class="card">

    <b><%=q.getQuestionText()%></b><br><br>

    A: <%=q.getOptionA()%><br>
    B: <%=q.getOptionB()%><br>
    C: <%=q.getOptionC()%><br>
    D: <%=q.getOptionD()%><br>

    <p><b>Correct:</b> <%=q.getCorrectAnswer()%></p>

    <!-- DELETE -->
    <form method="post" action="${pageContext.request.contextPath}/admin/question" style="display:inline;">
        <input type="hidden" name="action" value="delete">
        <input type="hidden" name="id" value="<%=q.getId()%>">
        <button class="delete-btn">Delete</button>
    </form>

    <!-- EDIT (future enhancement link) -->
    <a href="${pageContext.request.contextPath}/admin/question?edit=<%=q.getId()%>">
        <button class="edit-btn">Edit</button>
    </a>

</div>

<%
    }
}
%>

</div>

</body>
</html>