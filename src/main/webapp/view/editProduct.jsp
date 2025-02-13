<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="org.example.webapp.dao.ProductDAO" %>
<%@ page import="org.example.webapp.models.Product" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sửa sản phẩm</title>
</head>
<body>
<%
    String idStr = request.getParameter("id");
    System.out.println("idStr: " + idStr);
    Product product = null;
    if (idStr != null && !idStr.isEmpty()) {
        try {
            int id = Integer.parseInt(idStr);
            product = ProductDAO.getAllProducts().stream().filter(p -> p.getId() == id).findFirst().orElse(null);
        } catch (NumberFormatException e) {
            // Xử lý lỗi chuyển đổi số
            out.println("<p>ID sản phẩm không hợp lệ.</p>");
        }
    } else {
        // Xử lý trường hợp id không hợp lệ
        out.println("<p>ID sản phẩm không được cung cấp.</p>");
    }
%>
<% if (product != null) { %>
<h2>Sửa sản phẩm</h2>
<form action="${pageContext.request.contextPath}/products" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="<%= product.getId() %>">
    <label>Tên sản phẩm:</label>
    <input type="text" name="name" value="<%= product.getName() %>" required><br>
    <label>Giá:</label>
    <input type="number" step="0.01" name="price" value="<%= product.getPrice() %>" required><br>
    <button type="submit">Cập nhật</button>
</form>
<% } %>
</body>
</html>