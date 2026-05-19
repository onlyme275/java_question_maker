<%@ page import="java.util.List" %>
<%@ page import="com.question.model.Question" %>
<%@ page import="com.user.model.User" %>

<%
User user = (User) session.getAttribute("user");
boolean isAdmin = (user != null && user.getIs_staff() == 1);

List<Question> questions = (List<Question>) request.getAttribute("questions");
%>

<!DOCTYPE html>
<html>
<head>
<title>Question System</title>

<style>
body {
    font-family: Arial;
    background: #f4f6f9;
}

.container {
    width: 75%;
    margin: auto;
}

h2 {
    text-align: center;
    margin: 20px 0;
}

.card {
    background: white;
    padding: 15px;
    margin: 15px 0;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

.box {
    background: #fff8dc;
    padding: 15px;
    border-radius: 10px;
    margin-bottom: 20px;
}

input, select {
    width: 100%;
    padding: 8px;
    margin: 5px 0;
}

button {
    padding: 8px 12px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
}

.add { background: green; color: white; }
.del { background: red; color: white; }
.edit { background: orange; color: white; }
.save { background: blue; color: white; }

.edit-box {
    display: none;
    margin-top: 10px;
    padding: 10px;
    background: #eef;
    border-radius: 10px;
}
</style>

<script>
function toggleEdit(id){
    let box = document.getElementById("edit_" + id);
    box.style.display = (box.style.display === "block") ? "none" : "block";
}
</script>

</head>

<body>

<div class="container">

<h2>📘 Question System</h2>

<!-- ================= ADMIN CREATE ================= -->
<% if(isAdmin){ %>

<div class="box">

<h3>Create Question</h3>

<form method="post" action="<%=request.getContextPath()%>/question">

<input type="hidden" name="action" value="add">

<input name="question_text" placeholder="Enter Question" required>
<input name="option_a" placeholder="Option A" required>
<input name="option_b" placeholder="Option B" required>
<input name="option_c" placeholder="Option C" required>
<input name="option_d" placeholder="Option D" required>

<select name="correct_answer" required>
    <option value="">Correct Answer</option>
    <option value="A">A</option>
    <option value="B">B</option>
    <option value="C">C</option>
    <option value="D">D</option>
</select>

<button class="add" type="submit">➕ Add Question</button>

</form>

</div>

<% } %>

<!-- ================= USER QUIZ FORM ================= -->
<% if(!isAdmin){ %>
<form method="post" action="<%=request.getContextPath()%>/question">
<% } %>

<!-- ================= QUESTIONS ================= -->
<%
if(questions != null && !questions.isEmpty()){
    for(Question q : questions){
%>

<div class="card">

    <p><b><%=q.getQuestionText()%></b></p>

    <!-- USER MODE -->
    <% if(!isAdmin){ %>

        <label><input type="radio" name="q_<%=q.getId()%>" value="A"> <%=q.getOptionA()%></label><br>
        <label><input type="radio" name="q_<%=q.getId()%>" value="B"> <%=q.getOptionB()%></label><br>
        <label><input type="radio" name="q_<%=q.getId()%>" value="C"> <%=q.getOptionC()%></label><br>
        <label><input type="radio" name="q_<%=q.getId()%>" value="D"> <%=q.getOptionD()%></label><br>

    <% } %>

    <!-- ================= ADMIN MODE ================= -->
    <% if(isAdmin){ %>

        <!-- DELETE -->
        <form method="post" action="<%=request.getContextPath()%>/question" style="display:inline;">
            <input type="hidden" name="action" value="delete">
            <input type="hidden" name="id" value="<%=q.getId()%>">
            <button class="del" type="submit">Delete</button>
        </form>

        <!-- EDIT BUTTON -->
        <button type="button" class="edit" onclick="toggleEdit(<%=q.getId()%>)">
            Edit
        </button>

        <!-- EDIT BOX -->
        <div id="edit_<%=q.getId()%>" class="edit-box">

            <form method="post" action="<%=request.getContextPath()%>/question">

                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="<%=q.getId()%>">

                <input name="question_text" value="<%=q.getQuestionText()%>">
                <input name="option_a" value="<%=q.getOptionA()%>">
                <input name="option_b" value="<%=q.getOptionB()%>">
                <input name="option_c" value="<%=q.getOptionC()%>">
                <input name="option_d" value="<%=q.getOptionD()%>">

                <select name="correct_answer">
                    <option value="A">A</option>
                    <option value="B">B</option>
                    <option value="C">C</option>
                    <option value="D">D</option>
                </select>

                <button class="save" type="submit">Save</button>

            </form>

        </div>

    <% } %>

</div>

<%
    }
}
%>

<!-- ================= SUBMIT QUIZ ================= -->
<% if(!isAdmin){ %>
    <button class="add" type="submit">Submit Quiz</button>
</form>
<% } %>

</div>

</body>
</html>