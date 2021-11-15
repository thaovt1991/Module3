<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Products List</title>
</head>
<body>
<h1>Products List</h1>
<a href="/products?action=create">Create Product</a>
<form action="/products?action=search" method="post">
    <input type="text" name="name_search" id ="name_search" placeholder="Search name product..">
    <input type="submit" value=Search>
</form>
<button type="button" onclick="window.location.href ='${pageContext.request.contextPath}/products'">
    Back list products
</button>
<h3>
    Products List
</h3>
<table border="1">
    <tr>
        <th>#</th>
        <th>Product Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Color</th>
        <th>Category</th>
        <th colspan="2">Action</th>

    </tr>
    <c:forEach items='${requestScope["listProducts"]}' var="product">
        <tr>
            <td>${product.getId()}</td>
            <td>${product.getNameProduct()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getQuantity()}</td>
            <td>${product.getColor()}</td>
            <td>${product.getCategory()}</td>
            <td>
                <button onclick="window.location.href ='${pageContext.request.contextPath}/products?action=edit&id=${product.getId()}'">
                    Edit
                </button>
            </td>
            <td>
                <button onclick="window.location.href ='${pageContext.request.contextPath}/products?action=delete&id=${product.getId()}'">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>
</table>
</h3>

</body>
</html>

