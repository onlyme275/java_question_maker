<%@ page import="java.util.List" %>
<%@ page import="com.hero.model.Hero" %>

<%
    List<Hero> heroes = (List<Hero>) request.getAttribute("heroes");
%>

<style>
.admin-box {
    background: white;
    padding: 20px;
    border-radius: 10px;
    max-width: 800px;
}

input, textarea {
    width: 100%;
    padding: 10px;
    margin-top: 10px;
    border: 1px solid #ddd;
    border-radius: 6px;
}

button {
    margin-top: 10px;
    padding: 10px 15px;
    background: #0f172a;
    color: white;
    border: none;
    cursor: pointer;
    border-radius: 6px;
}

button:hover {
    background: #1e293b;
}

.card {
    background: #f8fafc;
    padding: 15px;
    margin-top: 10px;
    border-radius: 8px;
    display: flex;
    gap: 15px;
    align-items: center;
}

.card img {
    width: 120px;
    height: 80px;
    object-fit: cover;
    border-radius: 6px;
}
</style>

<div class="admin-box">

    <h2>Add Hero Section</h2>

    <!-- IMPORTANT: multipart for file upload -->
    <form method="post" action="hero" enctype="multipart/form-data">

        <input type="text" name="title" placeholder="Title" required>

        <textarea name="description" placeholder="Description"></textarea>

        <!-- FILE UPLOAD -->
        <input type="file" name="image" accept="image/*" required>

        <button type="submit">Save</button>

    </form>

    <h3>Existing Heroes</h3>

    <%
        if(heroes != null){
            for(Hero h : heroes){
    %>

    <div class="card">

        <img src="<%= request.getContextPath() %>/<%= h.getImage() %>" />

        <div>
            <b><%= h.getTitle() %></b><br>
            <%= h.getDescription() %>
        </div>

    </div>

    <%
            }
        }
    %>

</div>