<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h2>Đăng nhập</h2>
<% if(request.getAttribute("errorMessage") != null) { %>
<p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
<% } %>
<form action="${pageContext.request.contextPath}/login" method="post">
    <label>Tên đăng nhập:</label>
    <input type="text" name="username" required><br>
    <label>Mật khẩu:</label>
    <input type="password" name="password" required><br>
    <button type="submit">Đăng nhập</button>
</form>
</body>
</html>