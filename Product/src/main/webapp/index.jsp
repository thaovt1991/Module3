<%--
  Created by IntelliJ IDEA.
  User: THAO_VT
  Date: 10/30/2021
  Time: 3:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Product</title>
</head>
<body>
<form action="/display-discount" method="post">
  <h1> Product Discount Calculator</h1>
  <br>
  <lable>Product Description</lable>  <br>
  <input type="text" name ="productDescription" placeholder="Mo ta san pham">    <br>
  <lable>List Price</lable>
  <br>
  <input type="number" name ="listPrice" placeholder="Gia niem yet">   <br>
  <lable>Discount Percent</lable>  <br>
  <input type="number" name = "discountPercent" placeholder="Ti le chiet khau">   <br>
  <input type="submit" value = " Calculate Discount">
</form>
</body>
</html>
