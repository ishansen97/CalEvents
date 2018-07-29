<%@page import="java.sql.*,Employee.Employee" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin | Login</title>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link href="External/w3/all.css" rel="stylesheet" type="text/css">
        <link href="External/Bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="External/Bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="External/Font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="External/Font-awesome/css/all.css" rel="stylesheet" type="text/css">

<!--        <style type="text/css">
            .form-control:focus {
                color: rgb(15, 117, 188);
                background-color: #fff;
                border-color: rgb(254, 216, 89);
                outline: 0;
                box-shadow: 0 0 0 0.2rem rgba(254, 216, 89, 0.25);
            }
        </style>-->

    </head>
    <body>

        <div class="col-md-12 bg-secondary" style="height: 100vh">

            <div class="row">

                <div class="container px-md-5">

                    <div class="h-25 d-none d-sm-block"></div>
                    <div class="d-block d-sm-none" style="height: 12%"></div>

                    <div class="col-lg-6 offset-lg-3 px-0">
                        
                        <!--<div style="margin-top:-50px"></div>-->
                        
                        <div class="text-center pt-4 mt-1" style="background-color: rgba(0,0,0,0.3);">
                        <img src="https://oasisfireandice.com/wp-content/uploads/2017/02/logo.png" class="text-center" style="height: 200px;">
                        </div>
                        <form class="text-white pb-5 pt-0" style="background-color: rgba(0,0,0,0.3);" action="Process_Admin" method="POST">

                            <div class="form-group px-md-5 px-3 pt-md-4">
                                <label>Username</label>
                                <input type="email" class="form-control rounded-0" placeholder="Username" name="username" required>
                                <small class="form-text"  style="color: rgba(255,255,255,0.4)">Please type in your email address as username</small>
                            </div>

                            <div class="form-group px-md-5 px-3 mt-md-4">
                                <label>Password</label>
                                <input type="password" class="form-control rounded-0" placeholder="Password" name="password" required>
                            </div>

                            <div class="form-row px-md-5 px-3">
                                <div class="col-5 col-md-5">
                                    <div class="form-group custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="customCheck1" checked>
                                        <label class="custom-control-label" for="customCheck1">Remeber Me</label>
                                    </div>
                                </div>
                                <div class="col-6 col-md-6 ml-4 text-right">
                                    <a href="" class="w3-text-blue">Forgot Password?</a>
                                </div>
                            </div>

                            <div class="form-group text-center px-5 pt-3">
                                <button type="submit" name="login" class="mt-4 py-md-2 btn rounded-0 btn-primary btn-block"> &nbsp LOGIN &nbsp</button>
                            </div>

                        </form>

                        <small class=" mt-0 py-1 form-text text-secondary text-center" style="cursor: default; background-color: rgba(0,0,0,0.2)">Copyright © CalEvents 2018</small>

                    </div>

                </div>

            </div>

        </div>




        <!-- Bootstrap core JavaScript-->
        <script src="../External/Jquery/jquery.min.js"></script>
        <script src="../External/Bootstrap/js/bootstrap.bundle.js"></script>
        <script src="../External/Bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Core plugin JavaScript-->
        <script src="../External/Jquery/jquery.easing.min.js"></script>

    </body>
</html>