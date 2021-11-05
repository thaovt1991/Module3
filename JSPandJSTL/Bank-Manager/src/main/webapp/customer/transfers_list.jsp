<%--
  Created by IntelliJ IDEA.
  User: vothao
  Date: 04/11/2021
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Transfers money information</title>
    <link rel="stylesheet" href="/assets/fontawesome-free-6.0.0-beta2-web/css/all.css">
    <link rel="stylesheet" href="/assets/css/bootstrap-5.1.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/bootstrap-footer-15/bootstrap-footer-15/css/style.css">

    <style>
        #header {
            width: 100%;
            height: 100px;
            background: rgb(53, 93, 224);
            color: white;
            margin: 0;
        }
        #main {
            width: 100%;
            height: auto;
        }

        #main table {
            width: 100%;
            height: auto;
            border-spacing: 0px;
        }

        #main table tr th  {
            text-align: center;
            background: green;
            font-size: 18px;
            font-weight: bold;
            color: white;
        }
        td{
            text-align: center;
        }
    </style>
</head>
<body>
<div class="row" id="header">
    <div class="col-md-6">
        <h1>Transfer money Information</h1>
    </div>
    <div class="col-md-6">
        <button type="button" class="btn btn-outline-light" style="float: right;margin-top: 20px;"
                onclick="window.location.href='/customers'">
            <i class="fa fa-list"></i>
            <span>Customers List</span>
        </button>
    </div>
</div>
<div id="main">
    <table border="1" class="table table-striped table table-hover">
        <tr id="head-table">
            <th class="id">#</th>
            <th class="id_sender">SenderID</th>
            <th class="name_sender">Sender Name</th>
            <th class="id_recipient">Recipient ID</th>
            <th class="name_recipient">Recipient Name</th>
            <th class="t_amount">Transfer Amount (VND)</th>
            <th class="fees">Fees (%)</th>
            <th class="fees_amount">Fees Amount (VND)</th>
        </tr>
        <c:forEach items='${requestScope["transfers"]}' var="transfer">
        <tr>
            <td class="id">${transfer.getIdTransfer()}</td>
            <td class="id_sender">${transfer.getIdSender()}</td>
            <td class="name_sender">${transfer.getName_Sender()}</td>
            <td class="id_recipient">${transfer.getIdRecipient()}</td>
            <td class="name_recipient">${transfer.getName_Recipient()}</td>
            <td class="t_amount">
                <fmt:formatNumber type="number" maxFractionDigits="3"
                                  value="${transfer.getTransferAmount()}"></fmt:formatNumber>
            </td>
            <td class="fees">${transfer.getFees()}</td>
            <td class="fees_amount">
                <fmt:formatNumber type="number" maxFractionDigits="3"
                                  value="${transfer.getTransferAmount()*transfer.getFees()/ 100}"></fmt:formatNumber>
            </td>
        </tr>
        </c:forEach>
</div>
</div>
</body>
</html>
