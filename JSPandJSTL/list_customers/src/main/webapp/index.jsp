<%@ page import="java.lang.reflect.Array" %><%--
  Created by IntelliJ IDEA.
  User: vothao
  Date: 31/10/2021
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<style>
    table {
        border-collapse: collapse;
        width: 100%;
    }

    th, td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
</style>
<body>
<h1>Danh sách khách hàng</h1>
<table class="table">
    <thead>
    <tr>
        <th scope="col">Tên</th>
        <th scope="col">Ngày sinh</th>
        <th scope="col">Địa chỉ</th>
        <th scope="col">Ảnh</th>
    </tr>
    </thead>

    <jsp:useBean id="list" scope="request" type="java.util.List"/>
    <c:forEach items="${list}" var="cus">
        <tbody>
        <tr>
            <td>${cus.name}</td>
            <td>${cus.dateOfBirth}</td>
            <td>${cus.add}</td>
<%--            <td><img src="${cus.getImage}" alt=""></td>--%>
           <td><img src="${cus.image}" alt=""></td>
        </tr>
        </tbody>
    </c:forEach>
</table>
</body>
</html>
</body>
</html>
