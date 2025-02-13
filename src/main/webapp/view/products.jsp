<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
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
    <c:forEach var="product" items="${products}">
        <tr>
            <td>${product.getId()}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>
                <form action="products" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="${product.getId()}">
                    <input type="hidden" name="action" value="delete">
                    <button type="submit">Xóa</button>
                </form>
                <form action="${pageContext.request.contextPath}/view/editProduct.jsp" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="${product.getId()}">
                    <button type="submit">Sửa</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
<br>
<a href="${pageContext.request.contextPath}/view/addProduct.jsp">Thêm sản phẩm mới</a>
</body>
</html>