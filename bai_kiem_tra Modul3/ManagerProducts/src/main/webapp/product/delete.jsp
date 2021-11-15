<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Delete Product</title>
</head>
<body>
<h1>
    <a href="/products">List Product</a>
</h1>
<br>
<h1>Delete Product</h1>
<h3>
</h3>
<form method="post">
    <table>
        <tr>
            <td>
                <label>Name</label>
            </td>
            <td>
                <input type="text" name = "name" id="name" value="${product.getNameProduct()}">
            </td>
        </tr>
        <tr>
            <td>
                <label>Price</label>
            </td>
            <td>
                <input type="number" name="price" id="price" value="${product.getPrice()}">
            </td>
        </tr>
        <tr>
            <td>
                <label>Quantity</label>
            </td>
            <td>
                <input type="number" name="quantity" id="quantity" value="${product.getQuantity()}">
            </td>
        </tr>
        <tr>
            <td>
                <label>Color</label>
            </td>
            <td>
                <input type="text" name="color" id="color" value="${product.getColor()}">
            </td>
        </tr>
        <tr>
            <td>
                <label>Description</label>
            </td>
            <td>
                <input type="text" name="description" id="description" value="${product.getDescription()}">
            </td>
        </tr>
        <tr>
            <td>
                <label>Category</label>
            </td>
            <td>
<%--                <select name="category" id="category">--%>
<%--                    <c:forEach items='${requestScope["categoryList"]}' var="category">--%>
<%--                        <option value="${category.getNameCategory()}">${category.getNameCategory()}</option>--%>
<%--                    </c:forEach>--%>
<%--                </select>--%>
                <input type="text" name="category" id="category"  value="${product.getCategory()}">
            </td>
        </tr>
        <tr>
            <td>
                <button type="submit">
            Delete
                </button>
            </td>
            <td>
                <button type="button" onclick="window.location.href ='${pageContext.request.contextPath}/products'">
                    Back
                </button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
