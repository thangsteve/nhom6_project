<%-- 
    Document   : checkout
    Created on : May 29, 2019, 7:14:11 PM
    Author     : congm
--%>

<%@page import="java.util.Map"%>
<%@page import="model.Item"%>
<%@page import="model.Cart"%>
<%@page import="model.Customers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.0/jquery-ui.js"></script>

        <script src="js/bootstrap-datepicker.js"></script>
        <jsp:include page="linkcss.jsp"></jsp:include>

        </head>
        <body>

        <%
            Cart cart = (Cart) session.getAttribute("cart");
            Customers cus = (Customers) session.getAttribute("LOGIN_CUSTOMER");
            String gd = "";
            if (cus.getGender() == true) {
                gd = "Male";
            } else {
                gd = "Female";
            }
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>
            <!-- Begin Li's Breadcrumb Area -->
            <div class="breadcrumb-area">
                <div class="container">
                    <div class="breadcrumb-content">
                        <ul>
                            <li><a href="ProductServlet">Home</a></li>

                            <li class="active">Checkout</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Li's Breadcrumb Area End Here -->
            <!--Checkout Area Strat-->
            <div class="checkout-area pt-60 pb-30">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="coupon-accordion">
                                <!--Accordion Start-->
                                <h3 style="color: red">Information Order ? &nbsp;<span id="showlogin">Click View Information</span></h3> 
                                <div id="checkout-login" class="coupon-content">
                                    <div class="coupon-info">

                                        <form action="#">
                                            <p class="form-row-first">
                                                <label>Customer Name<span class="required">*</span></label>
                                                <input type="text" value="<%=cus.getFullName()%> ">
                                        </p>
                                        <p class="form-row-last">
                                            <label>Gender<span class="required">*</span></label>
                                            <input type="text"value="<%=gd%>" >
                                        </p>
                                        <p class="form-row-last">
                                            <label>Phone<span class="required">*</span></label>
                                            <input type="text" value="<%=cus.getPhone()%>">
                                        </p>
                                        <p class="form-row-last">
                                            <label>Email <span class="required">*</span></label>
                                            <input type="text" value="<%=cus.getEmail()%>">
                                        </p>

                                    </form> 

                                </div>
                            </div>
                            <!--Accordion End-->
                            <!--Accordion Start-->

                            <!--Accordion End-->
                        </div>
                    </div>
                </div>
                <form  action="PleaceOrderServlet" method="post">
                    <div class="row">
                        <div class="col-lg-6 col-12">

                            <div class="checkbox-form">
                                <h3>Billing Details</h3>
                                <div class="row">

                                    <div class="col-md-6">
                                        <div class="checkout-form-list">
                                            <label>First Name <span class="required">*</span></label>
                                            <input placeholder="Enter Delivey Name"required="" name="firstname" pattern="[a-zA-Z]{1,15}" type="text">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="checkout-form-list">
                                            <label>Last Name<span class="required">*</span></label>
                                            <input placeholder="" name="lastname" pattern="[a-zA-Z]{1,15}" type="text">
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="checkout-form-list">
                                            <label>Delivery Address <span class="required">*</span></label>
                                            <input placeholder="Street address" name="address"type="text" required="">
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="checkout-form-list">
                                            <label>Phone <span class="required">*</span></label>
                                            <input type="text" name="tel"required="" pattern="^(?:0|\(?\+33\)?\s?|0033\s?)[1-79](?:[\.\-\s]?\d\d){4}$">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="checkout-form-list">
                                            <label>Note <span class="required">*</span></label>
                                            <input placeholder="" name="shipnote" type="text">
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="checkout-form-list">
                                            <label>Delivery Date  <span class="required">*</span></label>
                                            <input type="date" name="shipdate" value="">
                                        </div>
                                    </div>

                                </div>

                            </div>
                          

                        </div>
                        <div class="col-lg-6 col-12">
                            <div class="your-order">
                                <h3>Your order</h3>
                                <div class="your-order-table table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th class="cart-product-name">Product</th>
                                                <th class="cart-product-total">Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%for (Map.Entry<String, Item> list : cart.getCartItems().entrySet()) {%>
                                            <tr class="cart_item">
                                                <td class="cart-product-name"><%=list.getValue().getProduct().getProductName()%><strong class="product-quantity"> × <%=list.getValue().getQuantity()%></strong></td>
                                                <td class="cart-product-total"><span class="amount">£165.00</span></td>  
                                            </tr>
                                            <%}%>
                                        </tbody>
                                        <tfoot>
                                            <tr class="cart-subtotal">
                                                <th>Cart Subtotal</th>
                                                <td><span class="amount">$<%=cart.totalCart()%> </span></td>
                                            </tr>
                                            <tr class="order-total">
                                                <th>Order Total</th>
                                                <td><strong><span class="amount">$<%=cart.totalCart()%> </span></strong></td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <div class="payment-method">
                                    <div class="payment-accordion">

                                        <div class="order-button-payment">
                                            <input value="Place order" type="submit">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
        <jsp:include page="linkscript.jsp"></jsp:include>


    </body>
</html>
