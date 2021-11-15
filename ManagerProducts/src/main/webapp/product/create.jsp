<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create Product</title>
</head>
<body>
<h1>
    <a href="/products">List Product</a>
</h1>
<br>
<h1>Create Product</h1>
<h3>
    <c:if test='${message != null}'>
      <span style="color: green">${message}</span>
    </c:if>
</h3>
<form method="post">
<table>
    <tr>
        <td>
            <label>Name</label>
        </td>
        <td>
            <input type="text" name = "name" id="name">
        </td>
    </tr>
    <tr>
        <td>
            <label>Price</label>
        </td>
        <td>
            <input type="number" name="price" id="price">
        </td>
    </tr>
    <tr>
        <td>
            <label>Quantity</label>
        </td>
        <td>
            <input type="number" name="quantity" id="quantity">
        </td>
    </tr>
    <tr>
        <td>
            <label>Color</label>
        </td>
        <td>
            <input type="text" name="color" id="color">
        </td>
    </tr>
    <tr>
        <td>
            <label>Description</label>
        </td>
        <td>
            <input type="text" name="description" id="description">
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
                Create
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
