<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
<h1>
    <a href="/products">List Product</a>
</h1>
<br>
<h1>Edit Product</h1>
<h3>
    <c:if test='${message != null}'>
        <span style="color: green">${message}</span>
    </c:if>
    <c:if test='${error != null}'>
        <span style="color: red">${error}</span>
    </c:if>
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
                <select name="category" id="category">
                    <c:forEach items='${requestScope["categoryList"]}' var="category">
                        <option value="${category.getNameCategory()}">${category.getNameCategory()}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <button type="submit">
                    Edit
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
