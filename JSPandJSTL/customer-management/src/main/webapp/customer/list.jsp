
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <title>List of Customer</title>

    <%@include file="/layout/head.jsp"%>
</head>

<body>

<!-- Begin page -->
<div id="wrapper">


    <!-- Topbar Start -->
    <%@include file="/layout/navbar.jsp"%>
    <!-- end Topbar --> <!-- ========== Left Sidebar Start ========== -->
    <%@include file="/layout/left-side-menu.jsp"%>
    <!-- Left Sidebar End -->

    <!-- ============================================================== -->
    <!-- Start Page Content here -->
    <!-- ============================================================== -->

    <div class="content-page">
        <div class="content">

            <!-- Start container-fluid -->
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">
                        <div>
                            <h4 class="header-title mb-3">List page !</h4>
                        </div>
                    </div>
                </div>
                <!-- end row -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box">
                            <h5 class="mt-0 font-14 mb-3">Contacts</h5>
                            <div class="table-responsive">
                                <table class="table table-hover mails m-0 table table-actions-bar table-centered">
                                    <thead>
                                    <tr>
                                       <th>#</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Address</th>
                                        <th>Edit</th>
                                        <th>Delete</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach items='${requestScope["customers"]}' var="customer">
                                        <tr>
                                            <td>${customer.getId()}</td>
                                            <td><a href="/customers?action=view&id=${customer.getId()}">${customer.getName()}</a></td>
                                            <td>${customer.getEmail()}</td>
                                            <td>${customer.getAddress()}</td>
                                            <td><a href="/customers?action=edit&id=${customer.getId()}">
                                                <button type="button" class="btn btn-info btn-bordered-info">Info</button></a>
                                            </td>
                                            <td><a href="/customers?action=delete&id=${customer.getId()}">
                                                <button type="button" class="btn btn-danger btn-bordered-danger">Delete</button>
                                            </a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end container-fluid -->



            <!-- Footer Start -->
            <%@include file="/layout/footer.jsp"%>
            <!-- end Footer -->

        </div>
        <!-- end content -->

    </div>
    <!-- END content-page -->

</div>
<!-- END wrapper -->


<!-- Right Sidebar -->
<%@include file="/layout/right-bar.jsp"%>
<!-- /Right-bar -->

<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>

<a href="javascript:void(0);" class="right-bar-toggle demos-show-btn">
    <i class="mdi mdi-settings-outline mdi-spin"></i> &nbsp;Choose Demos
</a>

<!-- Vendor js -->

<%@include file="/layout/script.jsp"%>
</body>

</html>

