
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
    <head>
        <jsp:include page="admin-main-layout.jsp"></jsp:include>
            <title>Customer Account</title>
            <style>
                .not-active {
                    pointer-events: none;
                    cursor: default;
                    text-decoration: none;
                    color: black;
                }
                .button {
                    background-color: #4CAF50; /* Green */
                    border-radius: 30%;
                    color: white;
                    padding: 5px 5px;
                    text-align: center;
                    text-decoration: none;
                    display: inline-block;
                    font-size: 12px;
                    margin: 4px 2px;
                    -webkit-transition-duration: 0.4s; /* Safari */
                    transition-duration: 0.4s;
                    cursor: pointer;
                }

                .button1 {
                    background-color: white; 
                    color: green; 
                    border: 2px solid #4CAF50;
                }

                .button1:hover {
                    background-color: #4CAF50;
                    color: white;
                }

                .button2 {
                    background-color: white; 
                    color: black; 
                    border: 2px solid #008CBA;
                }

                .button2:hover {
                    background-color: #008CBA;
                    color: white;
                }

                .button3 {
                    background-color: white; 
                    color: red; 
                    border: 2px solid #f44336;
                }

                .button3:hover {
                    background-color: #f44336;
                    color: white;
                }

                .button4 {
                    background-color: white;
                    color: orange;
                    border: 2px solid orange;
                }

                .button4:hover {background-color: orange;}

                .button5 {
                    background-color: white;
                    color: black;
                    border: 2px solid #555555;
                }

                .button5:hover {
                    background-color: #555555;
                    color: white;
                }
            </style>

        </head>

        <body class="skin-blue sidebar-mini">
            <div class="wrapper">

                <!-- Main Header -->
            <jsp:include page="admin-main-header.jsp"></jsp:include>
                <!-- Left side column. contains the logo and sidebar -->
            <jsp:include page="admin-main-sidebar.jsp"></jsp:include>

                <!-- Content Wrapper. Contains page content -->
                <div class="content-wrapper">
                    <!-- Content Header (Page header) -->
                    <section class="content-header">
                        <h1>
                            Customer Manager
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-users"></i> Customer Account</a></li>
                            <li class="active">View</li>
                        </ol>
                    </section>
                    <!-- Main content -->
                    <section class="content">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="box">
                                    <div class="box-header">
                                        <h3 class="box-title">Customer List</h3>
                                    </div><!-- /.box-header -->
                                    <div class="box-body">
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>No.</th>
                                                    <th>Full Name</th>
                                                    <th>Email</th>
                                                    <th>Status</th>
                                                    <th>Action</th>


                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="c" items="${list}">
                                                <tr class="contentPage">
                                                    <td>${c.contactID}</td>
                                                    <td>${c.name}</td>
                                                    <td>${c.email}</td>
                                                    <td>
                                                        <c:if test="${c.status==true}">not seen</c:if>
                                                        <c:if test="${c.status==false}">seen</c:if>                                                   
                                                    </td>
                                                    <td> 
                                                         <c:if test="${c.status==true}">
                                                        <a href="getEmailCusServlet?contacId=${c.contactID}" class="button button3">Reply</a>
                                                        </c:if>
                                                        <c:if test="${c.status==false}">
                                                        <a href="getEmailCusServlet?contacId=${c.contactID}" class="button button1">Detail</a>
                                                        </c:if>
                                                    </td>                        
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                    <!-- Your Page Content Here -->

                </section><!-- /.content -->
            </div><!-- /.content-wrapper -->

            <!-- Main Footer -->
            <jsp:include page="admin-main-footer.jsp"></jsp:include>

            </div><!-- ./wrapper -->

            <!-- REQUIRED JS SCRIPTS -->

            <script type="text/javascript">
                $(function() {
                    $('#example1').DataTable({
                        "order": [[0, "desc"]],
                        dom: 'Bfrtip',
                        buttons: [
                            'copy', 'excel', 'pdf', 'print'
                        ]
                    });
                });
            </script>
            <!-- Optionally, you can add Slimscroll and FastClick plugins.
                  Both of these plugins are recommended to enhance the
                  user experience. Slimscroll is required when using the
                  fixed layout. -->
        </body>
    </html>
