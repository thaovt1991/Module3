<%--
  Created by IntelliJ IDEA.
  User: vothao
  Date: 04/11/2021
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>
        Withdraw money
    </title>
    <link rel="stylesheet" href="/assets/fontawesome-free-6.0.0-beta2-web/css/all.css">
    <link rel="stylesheet" href="/assets/css/bootstrap-5.1.3-dist/css/bootstrap.min.css">

    <style>
        .row {
            margin-left: 20px;
            margin-right: 20px;
        }

        .row > * {
            padding-right: calc(var(--bs-gutter-x) / 2);
            padding-left: calc(var(--bs-gutter-x) / 2);
            padding-top: 20px;
        }

        #header {
            background-color: #0a58ca;
            height: 120px;
            color: white;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row" id="header">
        <div class="col-sm-8">
            <h1>Withdraw money from the customer's account</h1>
        </div>
        <div class="col-sm-4">
            <button type="button" class="btn btn-outline-light" style="float: right;"
                    onclick="window.location.href='/customers'">
                <i class="fa fa-list"></i>
                <span>Customers List</span>
            </button>
        </div>
    </div>

    <form method="post">
        <div class="row">
            <div class="col-md-6">
                <label class="form-label">Customer ID</label>
                <input type="text" class="form-control" id="id" name="id"
                       value="${requestScope["customer"].getId()}" disabled>
            </div>
            <div class="col-md-6">
                <label class="form-label">Full Name</label>
                <input type="text" class="form-control" id="fullName" name="fullName"
                       value="${requestScope["customer"].getFullName()}" disabled>
            </div>
            <div class="col-md-6">
                <label class="form-label">Current balance (VND)</label>
                <input type="number" class="form-control" id="balance" name="balance"
                       value="${requestScope["customer"].getBalance()}" disabled>
            </div>
            <div class="col-md-6">
                <label class="form-label">Transaction Amount (VND)</label>
                <input type="number" class="form-control" id="transferAmount" name="transferAmount"
                       value="0">
            </div>

            <div class="col-md-12">
                <br>
                <button type="submit" id="btnCreateCustomer" class="btn btn-outline-warning">
                    <i class="fas fa-minus"></i>
                    Withdraw
                </button>
            </div>
        </div>
    </form>
    <div class="row">
        <div id="footer" class="col-sm-12">
            <p style="color: green">
                <c:if test='${requestScope["message"] != null}'>
                    <span class="message">${requestScope["message"]}</span>
                </c:if>
            </p>
            <p style="color: red">
                <c:if test='${requestScope["messageError"] != null}'>
                    <span class="message">${requestScope["messageError"]}</span>
                </c:if>
            </p>
        </div>
    </div>
</div>
</body>
</html>