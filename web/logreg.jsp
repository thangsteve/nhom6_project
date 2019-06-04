<%-- 
    Document   : logreg
    Created on : May 24, 2019, 9:49:43 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

    <title>Login like Facebook</title>
    <head>
        <link type="text/css" rel="stylesheet" href="fb.css" />
        <meta name="Description" content="Facebook Style Homepage Design with Login Form registration for using html and CSS"/>

        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
    </head>
    <body>
        <div id="navwrapper">
            <div id="navbar">   
                <form action="loginCustomerServlet" method="post">
                    <table class="tablewrapper">
                        <tr>
                            <td class="row1">Email</td>
                            <td class="row1">Password</td>
                        </tr>
                        <tr>
                            <td><input required  type="email" name="email" class="inputtext">
                            </td>
                            <td><input required type="password" name="password" class="inputtext">
                            </td>
                            <td><input type="submit" value="Login" ></td>
                        </tr>

                        <tr>
                            <td class="row2 h"><a href="forgotpass.jsp">Forgot your password?</a></td></tr>
                    </table>
                </form>
                <h2 class="logowrapper">Big Mobiles</h2>
            </div>
        </div>
        <div id="contentwrapper">
            <div id="content">
                <div id="leftbod">
                    <div class="connect bolder">
                        If you do not have an account, please register.
                    </div>
                    <div class="connect bolder">
                        ${error}
                        ${me}
                        ${mes}</div>
                </div>
                <div id="rightbod">
                    <div class="signup bolder">Register</div>
                    <div class="free bolder">It's free and always will be</div>
                    <div class="formbox">
                        <form action="createCUSTOMERServlet" id="formRegis" method="post" enctype="multipart/form-data">
                            <input type="text" required="" id="fullname" name="fullname" class="inputbody in2" placeholder="Fullname">
                            <input type="number" required=""  id="phone" name="phone" class="inputbody in2" placeholder="Telephone Number">
                            <input type="email"  required="" name="email" class="inputbody in2" placeholder="Email">
                            <input type="password" required="" id="password" onchange="return  Validation()" name="password" class="inputbody in2" placeholder="Password">
                            <input type="file" required="" id="file" onchange="return fileValidation()"  name="file" class="inputbody in2" placeholder="Avatar">
                            <span data-type="radio" class="spanpad">
                                <input type="radio" name="gender" id="fem" class="m0">
                                <label for="fem" class="gender">Male
                                </label>
                                <input type="radio" name="gender" id="male" class="m0">
                                <label for="male" class="gender">Female
                                </label>
                            </span>
                            <button type="submit" class="signbut bolder">Register</button>
                        </form>
                        <div class="formbox">
                            <div class="agree">
                                <h3>   By clicking Register, you agree to our Terms and you have read our Data Usage Policy, including our use of cookies.   </div>  
                            </h3> 
                        </div>
                        <div class="formbox">
                            <div class="create"><div class="link h">Create a Page</div> for a celebrity, band or business.</div>
                        </div>
                    </div>
                </div>
            </div>
            <script src="js/jquery.validate.min.js" type="text/javascript"></script>
            <script>
                function fileValidation() {
                    var fileInput = document.getElementById('file');
                    var filePath = fileInput.value;//lấy giá trị input theo id
                    var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;//các file được phép upload
                    //Kiểm tra định dạng
                    if (!allowedExtensions.exec(filePath)) {
                        alert('File unavailable, please select an image file');
                        fileInput.value = '';
                        return false;
                    } else {
                    }
                }
               
            </script>
    </body>
</html>