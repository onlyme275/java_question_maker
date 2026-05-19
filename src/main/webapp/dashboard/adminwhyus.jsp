<%@ page import="java.util.List" %>
<%@ page import="com.whyus.model.Whyus" %>

<%
    List<Whyus> whyusList = (List<Whyus>) request.getAttribute("whyusList");
%>

<style>
.admin-box {
    background: white;
    padding: 24px;
    border-radius: 12px;
    max-width: 800px;
    box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
}

.admin-box h2 {
    margin-top: 0;
    color: #0f172a;
    font-size: 24px;
    font-weight: 600;
}

.admin-box h3 {
    margin-top: 30px;
    color: #334155;
    font-size: 18px;
    font-weight: 500;
}

input, textarea {
    width: 100%;
    padding: 12px;
    margin-top: 12px;
    border: 1px solid #cbd5e1;
    border-radius: 8px;
    font-family: inherit;
    box-sizing: border-box;
}

input:focus, textarea:focus {
    outline: none;
    border-color: #2563eb;
    box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
}

button {
    margin-top: 16px;
    padding: 12px 20px;
    background: #0f172a;
    color: white;
    border: none;
    cursor: pointer;
    border-radius: 8px;
    font-weight: 500;
    transition: background 0.2s;
}

button:hover {
    background: #1e293b;
}

.card-list {
    display: flex;
    flex-direction: column;
    gap: 16px;
    margin-top: 16px;
}

.card {
    background: #f8fafc;
    padding: 16px;
    border: 1px solid #e2e8f0;
    border-radius: 10px;
    display: flex;
    gap: 20px;
    align-items: center;
}

.card img {
    width: 120px;
    height: 80px;
    object-fit: cover;
    border-radius: 8px;
    border: 1px solid #cbd5e1;
}

.card-info {
    flex: 1;
}

.card-info b {
    color: #0f172a;
    font-size: 16px;
}

.card-info p {
    color: #475569;
    margin: 4px 0 0 0;
    font-size: 14px;
    line-height: 1.5;
}
</style>

<div class="admin-box">

    <h2>Add Why Us Section</h2>

    <form method="post" action="whyus" enctype="multipart/form-data">

        <input type="text" name="title" placeholder="Title" required>

        <textarea name="description" placeholder="Description" rows="4"></textarea>

        <input type="file" name="image" accept="image/*" required>

        <button type="submit">Save Feature</button>

    </form>

    <h3>Existing "Why Choose Us" Features</h3>

    <div class="card-list">
    <%
        if(whyusList != null && !whyusList.isEmpty()){
            for(Whyus w : whyusList){
    %>

        <div class="card">

            <img src="<%= request.getContextPath() %>/<%= w.getImage() %>" alt="<%= w.getTitle() %>" />

            <div class="card-info">
                <b><%= w.getTitle() %></b>
                <p><%= w.getDescription() %></p>
            </div>

        </div>

    <%
            }
        } else {
    %>
        <p style="color: #94a3b8; font-style: italic;">No features added yet.</p>
    <%
        }
    %>
    </div>

</div>