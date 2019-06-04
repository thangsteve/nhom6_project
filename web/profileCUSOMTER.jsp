<%@page import="model.Customers"%>

<% Customers custom = (Customers) session.getAttribute("LOGIN_CUSTOMER");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin của bạn</title>
        <jsp:include page="linkcss.jsp"></jsp:include>
        <jsp:include page="header.jsp"></jsp:include>

            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
            <style>
                label.error{
                    color: red;
                    font-weight: normal;
                }
                .aaaa{
                    background-color: #030aac;
                }
            </style>
            <script type="text/javascript">
                function functionn()
                {
                    document.location.href = "http://www.google.com";
                }
            </script>
        </head>
        <body>
            <div class="contact-page-side-content">
                <div class="container">
                    <div class="row">
                        <div  class="col-5" style="background-color: white">
                            <form action="ChangeInfoCustomer" >
                                <br>
                                <h4 class="login-title">Your Information</h4>

                                <input type="hidden" name="customerID" value="${custom.customerID}">
                            <label>Your Name</label>
                            <input class="mb-0" type="text"style="font-weight: bold;"     name="fullname" value="${custom.fullName}">
                            <label>Email</label>
                            <input class="mb-0" type="email"style="font-weight: bold;"  name="email" value="${custom.email}">
                            <label>Telephone number</label>
                            <input class="mb-0" type="number" style="font-weight: bold;"  name="phone" value="${custom.phone}">
                            <label>Gender</label>
                            <select class="input" name="gender" required="true">
                                <c:choose>
                                    <c:when test="${custom.gender eq true}">
                                        <option value="Male" selected="true">Male</option>
                                        <option value="Female">Female</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="Male">Male</option>
                                        <option value="Female" selected="true">Female</option>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                            <input type="submit" value="Change" class="register-button mt-0">

                            <a class="btn btn-facebook" href="ChangePasswordCustomer.jsp">Change Password</a>


                        </form>
                    </div>
                    <div class="col-md-7">
                        <div class="box">
                            <div class="box-body">

                                <table OnClick="functionn()" class="w3-table-all w3-hoverable">
                                    <thead>
                                        <tr>
                                            <th>Oder Code</th>
                                            <th>Recipient</th>
                                            <th>Order day</th>
                                            <th>Ship Phone</th>                                                                                                     
                                            <th>Status</th>
                                            <th>Total</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="c" items="${listOder}" varStatus="index">
                                            <tr class="contentPage">
                                                <td>${c.orderID}</td>
                                                <td>${c.shipName}</td>
                                                <td>${c.createdDate}</td>
                                                <td>${c.shipPhone}</td>
                                                <td>                                                       
                                                    <c:if test="${c.processStatus eq 'Completed'}">
                                                        <span class="badge badge-success">${c.processStatus}</span>
                                                    </c:if>
                                                    <c:if test="${c.processStatus eq 'Shipping'}">
                                                        <span class="badge badge-warning">${c.processStatus}</span>
                                                    </c:if>
                                                    <c:if test="${c.processStatus eq 'Pending'}">
                                                        <span class="badge badge-info">${c.processStatus}</span>
                                                    </c:if>
                                                    <c:if test="${c.processStatus eq 'Canceled'}">
                                                        <span class="badge badge-danger">${c.processStatus}</span>
                                                    </c:if>
                                                </td>
                                                <td>${c.total}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div><!-- /.box-body -->
                        </div><!-- /.box -->
                    </div><!-- /.col -->
                    <!--
                                        <div class="col-4">    
                                            <form action="EditAvatarServlet" method="post" enctype="multipart/form-data">
                                                <div class="billing-details">
                                                    <h3 >Avatar</h3>
                                                    <div class="form-group">
                                                        <input class="input" type="hidden" name="cusID" value="${sessionScope.LOGIN_CUSTOMER.customerID}">
                                                        <img class="img-rounded" id="blah" src="uploadDir/${sessionScope.LOGIN_CUSTOMER.avatar}" style="margin:auto; width:150px;display:block;" onclick="document.getElementById('exampleInputFile').click();">
                                                        <br/>
                                                        <input  type="file" id="file" accept="image" onchange="return fileValidation()" name="inputImage" class="btn btn-inverse-dark" placeholder="Hình đại diện">
                                                        <input type="submit"  class="input order-submit" style=" text-align: center; width: 50% ;background-color: #ffcc00;font-weight: bold; color: #000;" value="Change">
                                                    </div>
                                                </div>
                                            </form>
                                        </div>-->
                </div>

            </div>
            <div class="row">

                <div class="col-md-3"></div>

                <div class="col-md-3"></div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
        <jsp:include page="linkscript.jsp"></jsp:include>
        <script src="//cdnjs.cloudflare.com/ajax/libs/validate.js/0.12.0/validate.min.js"></script>
        <script type="text/javascript" src="js/jquery.validate.min.js"></script>
        <script>
                                    function fileValidation() {
                                        var fileInput = document.getElementById('file');
                                        var filePath = fileInput.value;//lấy giá trị input theo id
                                        var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;//các file được phép upload
                                        //Kiểm tra định dạng
                                        if (!allowedExtensions.exec(filePath)) {
                                            alert('Tệp không khả dụng, vui lòng chọn tệp hình ảnh');
                                            fileInput.value = '';
                                            return false;
                                        } else {

                                        }
                                    }
        </script>

    </body>
</html>
