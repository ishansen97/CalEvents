
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

    <head>

        <title>Login/Register</title>

        <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="292041729795-1mno4fs5qgbncrl1cv7o0595bb5rtmhc.apps.googleusercontent.com">
   
        <link href="Bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <style type="text/css">
            @import url("https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700");
            * {
                box-sizing: border-box;
            }

            body {
                font-family: "Roboto Condensed", sans-serif;
            }

            .container {
                width: 100%;
                max-width: 100%;
                height: 800px;

                margin: 50px auto 0;
                box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.5);
            }

            .header {
                display: flex;
                justify-content: space-between;
                padding: 20px 20px;
                font-size: 30px;
                color: orange;
            }

            .content {
                text-align: center;
            }

            .face {
                width: 150px;
                height: 150px;
                background-image: url(images/4.jpg);
                background-size: cover;
                background-position: top center;
                border-radius: 50%;
                margin: 0 auto;
                position: relative;
            }
            .face .number {
                background: orange;
                position: absolute;
                padding: 10px;
                font-size: 14px;
                color: white;
                border-radius: 50%;
                top: 80%;
                left: 50%;
                transform: translateX(-50%);
            }

            .name {
                font-size: 40px;
                letter-spacing: 2px;
                margin-top: 20px;
            }
            .userID {
                font-size: 20px;
                letter-spacing: 2px;
                margin-top: 20px;
            }

            .email {
                font-size: 20px;
                color: rgba(0, 0, 0, 0.6);
                letter-spacing: 2px;
            }

            .social {
                width: 100%;
                display: flex;
                justify-content: center;
                margin-top: 30px;
            }

            .text {
                margin-right: 20px;
                font-size: 20px;
            }
            .text:last-child {
                margin-right: 0;
            }

            .text span {
                display: block;
                background: grey;
                padding: 5px;
                border-radius: 5px;
                color: white;
                margin-bottom: 10px;
            }

            .photo-section .photo-title {
                display: flex;
                justify-content: space-between;
                padding: 20px;
            }
            .photo-section .photo-title{
                text-decoration: none;
                color: grey;
                font-size: 20px;
            }

            .title a{
                text-decoration: none;
                color: grey;
                font-size: 22px;
            }
            .photo-section .thumb-wrapper {
                width: 100%;
                display: flex;
                flex-wrap: wrap;
            }
            .photo-section .thumb-wrapper .thumb-unit {
                width: 33.33%;
                background-color: pink;
                background-size: cover;
                background-position: center;
            }
            .photo-section .thumb-wrapper .thumb-unit:before {
                content: "";
                display: block;
                padding-top: 100%;
            }
            .photo-section .thumb-wrapper .thumb-unit:nth-child(1) {
                background-image: url(https://images.unsplash.com/photo-1461010083959-8a5727311252?dpr);
            }
            .photo-section .thumb-wrapper .thumb-unit:nth-child(2) {
                background-image: url("https://images.unsplash.com/photo-1430163393927-3dab9af7ea38?dpr=1&auto=compress,format&fit=crop&w=376&h=251&q=80&cs=tinysrgb&crop=");
            }
            .photo-section .thumb-wrapper .thumb-unit:nth-child(3) {
                background-image: url(https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSAYEWLVhW1R3NTkuvL3jZ6hghIXOVlhU-uYApn-yPBh5drMU3O);
            }
            .photo-section .thumb-wrapper .thumb-unit:nth-child(4) {
                background-image: url(https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ_XfkV4qaDqhkWDZ7KrlXXLFwL60fhggN7fanMPYD4IzirQwwq);
            }
            .photo-section .thumb-wrapper .thumb-unit:nth-child(5) {
                background-image: url(https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRXzsSNHONO2So54HkHVPzO8NBqD62jGT-CVpVaVcbRoh-MpZeONg);
            }
            .photo-section .thumb-wrapper .thumb-unit:nth-child(6) {
                background-image: url(https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR5heNMmxfRuWx3r1LjFNdiFXPlWEmxA3nxBvYy-pF1wuBHidpqpw);
            }

            .footer {
                display: flex;
                justify-content: space-between;
                align-items: center;
                font-size: 30px;
                padding: 10px 20px;
                color: grey;
            }
            .footer .face {
                width: 50px;
                height: 50px;
                margin: 0px 0px;
            }
            @import url(https://fonts.googleapis.com/css?family=Lato:400,700);
            @import url(2.css);
            body {
                font-family: "Lato", "sans-serif";
            }
            .profile {
                min-height: 400px;
                display: inline-block;
            }
            figcaption.ratings {
                margin-top: 20px;
            }
            figcaption.ratings a {
                color: #f1c40f;
                font-size: 11px;
            }
            figcaption.ratings a:hover {
                color: #f39c12;
                text-decoration: none;
            }
            .divider {
                border-top: 1px solid rgba(0, 0, 0, 0.1);
            }
            .emphasis {
                border-top: 4px solid transparent;
            }
            .emphasis:hover {
                border-top: 4px solid #1abc9c;
            }
            .emphasis h2 {
                margin-bottom: 0;
            }
            span.tags {
                background: #1abc9c;
                border-radius: 2px;
                color: #f5f5f5;
                font-weight: bold;
                padding: 2px 4px;
            }





        </style>


    </head>

    <body>
    <link href="font-awesome.min.css" rel="stylesheet">
    <div class="container">
        <div class="header">
            <div class="icon"><i class="fa fa-ellipsis-h"></i></div>
            <div class="name">You are not logged in.</div>
            <div class="icon"><i class="fa fa-plus"></i></div>
        </div>
        <div class="content">
            <div class="face"></div>



            <div class="photo-section">
                <div class="photo-title">
                    <!--<div class="active title"><a href="CusProfile">My Profile</a></div>
                    <div class="title"><a href="Gallery">Gallery</a></div>
                    <div class="title"><a href="bookedEvents">Booked Events</a></div>
                    <div class="title"><a href="#">Videos</a></div>-->


                </div>
                <br><br>
                <div align="center">
                    <form name="form" action="loginServlet" method="post" >
                        <div class="form-row">
                            <div class="col">
                                <h3><b>For Registered Customer</b></h3><br><br>
                                <table align="center">

                                    <!--<tr> 
                                        <td> Enter User Type :</td>
                                        <td> <select name="utype">
                                                <option value="Please Select"></option>
                                                <option value="customer">Customer</option>
                                               
                                                <option value="admin">Admin</option>
                                            </select>
                                        </td>
                                    </tr>-->
                                    <tr> 		
                                        <td> Enter Email :</td>
                                        <td> <input type="text" name="email" required/></td>
                                    </tr>

                                   <!-- <tr> 		
                                        <td> Enter Username :</td>
                                        <td> <input type="text" name="uname" required/></td>
                                    </tr>-->
                                    <tr>
                                        <td>Enter password : </td>
                                        <td> <input type="password" name="pass" required/></td>
                                    </tr>

                                    <tr>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <td></td>
                                        <td><br><input type="submit" class="button btn-primary" value="Login" />&nbsp;&nbsp;
                                            <input type="reset" class="button btn-primary" value="Reset"/></td>
                                    </tr>
                                </table>
                            <!--</div>
                             <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
    
                             <script>
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
      };
    </script>-->
                        </div>
                            <div class="col">
                                <h3><b>For New User Registration </b></h3>
                                <br><br><br>
                                <input type=submit class="button btn-primary" onclick="location.href = 'RegisterCus.jsp'"  value = "Register">

                                <br><br><br>

                            </div>
                    </form>

                </div>

            </div>
        </div>

        <script src="Bootstrap/js/bootstrap.js"></script>

    </div>
</body>
</html>