<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm sản phẩm mới</title>
</head>
<body>
<h2>Thêm sản phẩm mới</h2>
<form action="${pageContext.request.contextPath}/products" method="post">
    <input type="hidden" name="action" value="add">
    <label>Tên sản phẩm:</label>
    <input type="text" name="name" required><br>
    <label>Giá:</label>
    <input type="number" step="0.01" name="price" required><br>
    <button type="submit">Thêm</button>
</form>
</body>
</html>