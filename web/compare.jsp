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
<<<<<<< HEAD
        <link type="text/css" rel="stylesheet" href="css/rating.css">
        <jsp:include page="linkcss.jsp"></jsp:include>
        </head>
        <body>
        <jsp:include page="header.jsp"></jsp:include>
        <c:if test="${compare != null}">
            <div class="breadcrumb-area">
=======
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script
          <jsp:include page="linkcss.jsp"></jsp:include>
    </head>
    <body>
         <jsp:include page="header.jsp"></jsp:include>
         <c:if test="${compare != null}">
        <div class="breadcrumb-area">
>>>>>>> d049b940d1326760f0781baeb059ec444f2ecca4
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
<<<<<<< HEAD
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
=======
                                <c:forEach var="c" items="${compare}">
                                    <td class="compare-column-productinfo">
                                        <div class="compare-pdoduct-image">
                                            <a href="single-product.html">
                                                <img src="uploadDir/${c.images}" alt="Product Image" height="150px">
                                            </a>
                                            <a onclick='addProductToCart("${c.productID}")' href="" class="ho-button ho-button-sm">
                                                <span>Add To Cart</span>
                                            </a>
                                        </div>
                                    </td>
>>>>>>> d049b940d1326760f0781baeb059ec444f2ecca4
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
<<<<<<< HEAD
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
=======
         </c:if>
         <c:if test="${compare == null}">
             <p><h3> Nothing to Compare <a href="ProductServlet">continue Shopping !! </a> </h3></p>
         </c:if>
              <jsp:include page="footer.jsp"></jsp:include>
        <jsp:include page="linkscript.jsp"></jsp:include>
    <script type="text/javascript">
            function addProductToCart(productid)
            {
                $.ajax({
                    url: "CartServlet?command=plus&productID=" + productid,
                    type: "POST",
                    //data: {name: name1, price: price1, product_id: id, number: number, registerid: 75, waiter: waiterID},
                    success: function()
                    {
                        location.reload();
                    }
                });
            }
            function addProductWishlist(productid, customerId)
            {

                $.ajax({
                    url: "WishListSevlet?productId=" + productid + "&cusId=" + customerId,
                    type: "POST",
                    //data: {name: name1, price: price1, product_id: id, number: number, registerid: 75, waiter: waiterID},
                    success: function()
                    {
                      
                        location.reload();

                    },
                    error: function(jqXHR, textStatus, errorThrown)
                    {
                        alert("Cannot Add");
                    }
                });

            }
            function removeProductWishlist(productid, customerId)
            {
                $.ajax({
                    url: "RemoveWishlistServlet?productId=" + productid + "&cusId=" + customerId,
                    type: "POST",
                    //data: {name: name1, price: price1, product_id: id, number: number, registerid: 75, waiter: waiterID},
                    success: function()
                    {

                        location.reload();
                        alert("Remove Product" + productid + " in wish list Success");
                    },
                    error: function(jqXHR, textStatus, errorThrown)
                    {

                        alert("Cannot Remove ");
                    }
                });
            }
            function edit_posale(productid)
            {
                var qt1 = $('#qt' + productid).val();
                if (qt1 > 99) {
                    swal("Quantity isn't more than 99");
                } else
                {
                    $.ajax({
                        url: "EditCartServlet?productID=" + productid + "&quantity=" + qt1,
                        type: "POST",
                        success: function()
                        {
                            location.reload();
                        },
                        error: function(jqXHR, textStatus, errorThrown)
                        {
                            alert(orderid + "\n" + qt1 + "\n" + productid);
                        }
                    });

                }

            }

        </script>
    </body>
>>>>>>> d049b940d1326760f0781baeb059ec444f2ecca4
</html>
