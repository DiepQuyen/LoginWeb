<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.webapp.models.Product" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách sản phẩm</title>
</head>
<body>
<h2>Danh sách sản phẩm</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Tên sản phẩm</th>
        <th>Giá</th>
        <th>Hành động</th>
    </tr>
    <%
        List<Product> products = (List<Product>) request.getAttribute("products");
        for (Product product : products) {
    %>
    <tr>
        <td><%= product.getId() %></td>
        <td><%= product.getName() %></td>
        <td><%= product.getPrice() %></td>
        <td>
            <form action="products" method="post" style="display:inline;">
                <input type="hidden" name="id" value="<%= product.getId() %>">
                <input type="hidden" name="action" value="delete">
                <button type="submit">Xóa</button>
            </form>
            <form action="${pageContext.request.contextPath}/view/editProduct.jsp" method="get" style="display:inline;">
                <input type="hidden" name="id" value="<%= product.getId() %>">
                <button type="submit">Sửa</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
</table>
<br>
<a href="${pageContext.request.contextPath}/view/addProduct.jsp">Thêm sản phẩm mới</a>
</body>
</html>