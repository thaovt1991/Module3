<%--
  Created by IntelliJ IDEA.
  User: vothao
  Date: 04/11/2021
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Customer List</title>
  <link rel="stylesheet" href="/assets/fontawesome-free-6.0.0-beta2-web/css/all.css">
  <link rel="stylesheet" href="/assets/css/list_customers.css">
  <link rel="stylesheet" href="/assets/css/bootstrap-5.1.3-dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="/assets/bootstrap-footer-15/bootstrap-footer-15/css/style.css">

</head>
<body>

<div id = "header" >
  <table>
    <tr>
      <td style="width: 60%;"> <h1 style="color: white">Transfer money Information</h1></td>
      <td  style="width: 40%;">
        <button type="button" class="btn btn-outline-light" >
          <i class="fa fa-history" disabled></i>
          <span> Transfer money information</span>
        </button>
        <button type="button" class="btn btn-outline-light" onclick="window.location.href='/customers?action=create'">
          <i class="far fa-plus-square" ></i>
          <span>Add New Customer</span>
        </button>
      </td>
    </tr>
  </table>
</div>
<div id ="main">
  <table border="1" class="table table-striped table table-hover">
    <tr id = "head-table">
      <th class="id">#</th>
      <th class="full_name">SenderID</th>
      <th class="email">Sender Name</th>
      <th class="phone" >Recipient ID</th>
      <th class="address">Recipient Name</th>
      <th class="blance">Transfer Amount ($)</th>
      <th class="action" colspan="5">Action</th>
    </tr>
    <c:forEach items='${requestScope["customers"]}' var="customer">
      <tr>
        <td class="id">${customer.getId()}</td>
        <td class="full_name">${customer.getFullName()}</td>
        <td class="email">${customer.getEmail()}</td>
        <td class="phone" >${customer.getPhone()}</td>
        <td class="address">${customer.getAddress()}</td>
        <td class="blance">
          <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${customer.getBalance()}"></fmt:formatNumber>
        </td>
        <td>
          <button type="button" class="btn btn-outline-secondary"  data-toggle="tooltip" data-placement="top" title="Edit" onclick="window.location.href ='/customers?action=edit&id=${customer.getId()}'">
            <i class="far fa-edit"></i>
          </button>
        </td>
        <td>
          <button type="button" class="btn btn-outline-success"  data-toggle="tooltip" data-placement="top" title="Desposit">
            <i class="far fa-plus-square"></i>
          </button>
        </td>
        <td>
          <button type="button" class="btn btn-outline-warning"data-toggle="tooltip" data-placement="top" title="Withdraw">
            <i class="fas fa-minus"></i>
          </button>
        </td>
        <td>
          <button type="button" class="btn btn-outline-primary"data-toggle="tooltip" data-placement="top" title="Transfer">
            <i class="fas fa-exchange-alt"></i>
          </button></td>
        <td>
          <button type="button" class="btn btn-outline-danger"data-toggle="tooltip" data-placement="top" title="Suspended" onclick="window.location.href ='/customers?action=delete&id=${customer.getId()}'">
            <i class="fas fa-ban"></i>
          </button>
        </td>

      </tr>
    </c:forEach>
  </table>
