<%--
  Created by IntelliJ IDEA.
  User: vothao
  Date: 30/10/2021
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Currency Converter</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<h2 style="color: red">Currency Converter</h2>
<form method="get" action="/convert">
  <label>Rate: </label><br/>
  <input type="text" name="rate" placeholder="RATE" value="22000"/><br/>
  <label>USD: </label><br/>
  <input type="text" name="usd" placeholder="USD" value="0"/>
  <br/>
  <br>
  <input type = "submit" id = "submit" value = "Converter"/>
</form>
</body>
</html>