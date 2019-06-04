<%-- 
    Document   : forgotpass
    Created on : May 30, 2019, 10:38:01 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Big Mobiles</title>
        <!-- plugins:css -->
        <link rel="stylesheet" href="assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="assets/vendors/iconfonts/ionicons/css/ionicons.css">
        <link rel="stylesheet" href="assets/vendors/iconfonts/typicons/src/font/typicons.css">
        <link rel="stylesheet" href="assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css">
        <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
        <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.addons.css">
        <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.validate.min.js"></script>

        <!-- endinject -->
        <!-- plugin css for this page -->
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <link rel="stylesheet" href="assets/css/shared/style.css">
        <!-- endinject -->
        <!-- Layout styles -->
        <link rel="stylesheet" href="assets/css/demo_1/style.css">
        <!-- End Layout styles -->
        <link rel="shortcut icon" href="assets/images/favicon.png" />
    </head>
    <body>
        <div class="container-scroller">
            <div class="container-fluid page-body-wrapper full-page-wrapper">
                <div class="content-wrapper d-flex align-items-center auth register-bg-1 theme-one">
                    <div class="row w-100">
                        <div class="col-lg-4 mx-auto">
                            <h2 class="text-center mb-4">Enter your email</h2>
                            <div class="auto-form-wrapper">
                                <form id="resetForm" action="ForgetPasswordServlet" method="post">
                                    <div class="form-group">
                                        <h3> <c:if test="${not empty sessionScope.findUser_message}">
                                                ${sessionScope.findUser_message}
                                            </c:if></h3>
                                        <div class="input-group">
                                            <input type="email"  required name="email" id="email" class="form-control" placeholder="enter your email">
                                            <div class="input-group-append">
                                                <span class="input-group-text">
                                                    <i class="mdi mdi-check-circle-outline"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group d-flex justify-content-center">
                                        <div class="form-check form-check-flat mt-0">
                                            <label class="form-check-label">
                                                <input type="checkbox" class="form-check-input" checked>We will send you a link to change your password</label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input type="submit" class="btn btn-primary submit-btn btn-block">
                                    </div>
                                </form>
                                <div class="text-block text-center my-3">
                                    <span class="text-small font-weight-semibold">If you remember you password</span>
                                    <a href="logreg.jsp" class="text-black text-small">Login</a>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- content-wrapper ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>
        <!-- container-scroller -->
        <!-- plugins:js -->
        <script src="assets/vendors/js/vendor.bundle.base.js"></script>
        <script src="assets/vendors/js/vendor.bundle.addons.js"></script>
        <!-- endinject -->
        <!-- inject:js -->
        <script src="assets/js/shared/off-canvas.js"></script>
        <script src="assets/js/shared/misc.js"></script>

        <!-- endinject -->
        <script type="text/javascript">

            $(document).ready(function() {
                $("#resetForm").validate({
                    rules: {
                        email: {
                            required: true,
                            email: true
                        }
                    },
                    messages: {
                        email: {
                            required: "Please enter email",
                            email: "Please enter a valid email address"
                        }
                    }
                });

            });
        </script>
    </body>
</html>
