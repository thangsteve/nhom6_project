
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Reset password</title>
        <!-- plugins:css -->
        <link rel="stylesheet" href="assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="assets/vendors/iconfonts/ionicons/css/ionicons.css">
        <link rel="stylesheet" href="assets/vendors/iconfonts/typicons/src/font/typicons.css">
        <link rel="stylesheet" href="assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css">
        <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
        <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.addons.css">
        <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="/js/jquery.validate.min.js"></script>

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
        <style>
            label.error{
                color: red;
                font-weight: normal;
            }
        </style>
    </head>
    <body>
        <div class="container-scroller">
            <div class="container-fluid page-body-wrapper full-page-wrapper">
                <div class="content-wrapper d-flex align-items-center auth register-bg-1 theme-one">
                    <div class="row w-100">
                        <div class="col-lg-4 mx-auto">
                            <h2 class="text-center mb-4">Enter new password</h2>
                            <div class="auto-form-wrapper">
                                <form  id="formLogin" action="resetPasswordServlet" method="post">
                                    <div class="form-group">
                                        <div class="input-group-sm" >
                                            <input type="password" name="password"  id="password" class="form-control" placeholder="Enter your new Password">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group-sm  " >
                                            <input type="password" name="password_confirm" id="password_confirm"  class="form-control" placeholder="Confrim Password">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <input type="submit" class="btn btn-primary submit-btn btn-block">
                                    </div>
                                </form>
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
    <script src="//cdnjs.cloudflare.com/ajax/libs/validate.js/0.12.0/validate.min.js"></script>
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <!-- endinject -->
    <script type="text/javascript">
        $().ready(function() {
            $("#formLogin").validate({
                onfocusout: false,
                onkeyup: false,
                onclick: false,
                rules: {
                    "password": {
                        required: true,
                        minlength: 6,
                        maxlength: 30
                    },
                    "password_confirm": {
                        required: true,
                        equalTo: "#password",
                        minlength: 6
                    }
                },
                messages: {
                    "password": {
                        required: "Please provide a new password",
                        minlength: "    Your password must consist of at least 6 characters",
                        maxlength: "    Your password must be maximum 30 characters"
                    },
                    "password_confirm": {
                        required: "Please provide a new password",
                        equalTo: "Please enter the same password as above",
                        minlength: "Your password must consist of at least 6 characters"
                    }
                }
            });
        });
    </script>
</body>
</html>
