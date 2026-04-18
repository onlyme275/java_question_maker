<%@ page import="java.util.List" %>
<%@ page import="com.question.model.dao.QuestionDao" %>
<%@ page import="com.question.model.UserAnswer" %>
<%@ page import="com.user.model.User" %>

<%
User user = (User) session.getAttribute("user");

QuestionDao dao = new QuestionDao();

List<UserAnswer> answers = dao.getUserAnswers(user.getId());

Integer score = (Integer) session.getAttribute("score");
Integer total = (Integer) session.getAttribute("total");
%>

<h2>Score: <%=score%> / <%=total%></h2>

<%
for(UserAnswer a : answers){
%>

<div class="card">
    Question ID: <%=a.getQuestionId()%><br>
    Selected: <%=a.getSelectedOption()%><br>

    <b style="color:<%=a.isCorrect() ? "green":"red"%>">
        <%=a.isCorrect() ? "Correct" : "Wrong"%>
    </b>
</div>

<%
}
%>