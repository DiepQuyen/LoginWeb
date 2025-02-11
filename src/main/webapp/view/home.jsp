<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
  <title>Home</title>
</head>
<body>
<%
  HttpSession sessionUser = request.getSession(false);
  String username = (sessionUser != null) ? (String) sessionUser.getAttribute("user") : null;
  if (username == null) {
    response.sendRedirect("login.jsp");
  }
%>
<h2>Chào mừng, <%= username %>!</h2>
<div>Danh sách sản phẩm -> <a href="${pageContext.request.contextPath}/products">Ấn vào đây</a></div>
<a href="logout">Đăng xuất</a>
</body>
</html>