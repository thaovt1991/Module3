<%--
  Created by IntelliJ IDEA.
  User: vothao
  Date: 02/11/2021
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View customer</title>
</head>
<body>
<h1>Customer details</h1>
<p>
    <a href="/products">Back to product list</a>
</p>
<table>
    <tr>
        <td>Name: </td>
        <td>${requestScope["product"].getName()}</td>
    </tr>
    <tr>
        <td>Price: </td>
        <td>${requestScope["product"].getPrice()}</td>
    </tr>
    <tr>
        <td>Amounts: </td>
        <td>${requestScope["product"].getAmount()}</td>
    </tr>
    <tr>
        <td>Description: </td>
        <td>
            ${requestScope["product"].getDescription()}
        </td>
    </tr>
</table>
</body>
</html>
