<%-- 
    Document   : compare
    Created on : May 31, 2019, 3:33:07 PM
    Author     : congm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css" rel="stylesheet" href="css/rating.css">
        <jsp:include page="linkcss.jsp"></jsp:include>
        </head>
        <body>
        <jsp:include page="header.jsp"></jsp:include>
        <c:if test="${compare != null}">
            <div class="breadcrumb-area">
                <div class="container">
                    <div class="breadcrumb-content">
                        <ul>
                            <li><a href="ProductServlet">Home</a></li>
                            <li class="active">Compare</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Li's Breadcrumb Area End Here -->
            <!-- Compare Area -->
            <div class="compare-area pt-60 pb-60">
                <div class="container">
                    <div class="compare-table table-responsive">
                        <table class="table table-bordered table-hover mb-0">
                            <tbody>
                                <tr>
                                    <th class="compare-column-titles">Image</th>
                                        <c:forEach var="c" items="${compare}">
                                        <td class="compare-column-productinfo">
                                            <div class="compare-pdoduct-image">
                                                <a href="#">
                                                    <img src="uploadDir/${c.images}" alt="Product Image" height="150px">
                                                </a>
                                                <a href="cart.html" class="ho-button ho-button-sm">
                                                    <span>ADD TO CART</span>
                                                </a>
                                            </div>
                                        </td>
                                    </c:forEach>
                                </tr>
                                <tr>
                                    <th>Product Name</th>
                                        <c:forEach var="c" items="${compare}">
                                        <td>
                                            <h5 class="compare-product-name"><a href="#">${c.productName}</a></h5>
                                        </td>
                                    </c:forEach>
                                </tr>
                                <tr>
                                    <th>Brand</th>
                                        <c:forEach var="c" items="${compare}">
                                        <td>
                                            <h5 class="compare-product-name"><a href="#">${c.brand}</a></h5>
                                        </td>
                                    </c:forEach>
                                </tr>
                                <tr>
                                    <th>Category</th>
                                        <c:forEach var="c" items="${compare}">
                                        <td>
                                            <h5 class="compare-product-name"><a href="#">${c.category}</a></h5>
                                        </td>
                                    </c:forEach>
                                </tr>
                                <tr>
                                    <th>Description</th>
                                        <c:forEach var="c" items="${compare}">
                                        <td>${c.description}</td>
                                    </c:forEach>
                                </tr>
                                <tr>
                                    <th>Price</th>
                                        <c:forEach var="c" items="${compare}">
                                        <td>$ &nbsp; ${c.price}</td>
                                    </c:forEach>
                                </tr>
                                <tr>
                                    <th>Feature</th>
                                        <c:forEach var="c" items="${compare}">
                                        <td>${c.feature}</td>
                                    </c:forEach>
                                </tr>
                                <tr>
                                    <th>Rating</th>
                                        <c:forEach var="c" items="${compare}" >
                                        <td align="center">
                                            <span class="star-rating star-5">
                                                <input  type="radio" checked="true">
                                                <i style="width:${(c.rating/5*100)}%"></i>   
                                            </span>
                                        </c:forEach>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${compare == null}">
            <br/><br/><br/><br/><br/><br/>
        <center>
            <p><h3> Nothing to Compare. Click <a href="ProductServlet"><span class="required">Here</span></a> to continue Shopping !!  </h3></p>
        <br/><br/><br/><br/><br/><br/><br/>
    </center>
</c:if>
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="linkscript.jsp"></jsp:include>
</body>
</html>
