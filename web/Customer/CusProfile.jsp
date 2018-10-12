<%-- 
    Document   : CusProfile
    Created on : Aug 11, 2018, 9:04:39 AM
    Author     : Shashi Perera
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DBConnection" %>
<%@page import="java.io.PrintWriter"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <link href="Bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <style type="text/css">
            @import url("https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700");
            * {
                box-sizing: border-box;
            }

            body {
                font-family: "Roboto Condensed", sans-serif;
            }

            .container {
                width: 900px;
                max-width: 80%;
                height: 100%;

                margin: 50px auto 0;
                box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.5);
            }

            .header {
                display: flex;
                justify-content: space-between;
                padding: 10px 20px;
                font-size: 30px;

                color: orange;
            }

            .content {
                text-align: center;
                padding: 10px 20px;
                background-color: lightgray;
            }

            .face {
                width: 150px;
                height: 150px;
                background-image: url("images/4.jpg");
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
                color: blackgrey;
                font-size: 30px;
                
            }
            .photo-section .thumb-wrapper {
                width: 100%;
                display: flex;
                flex-wrap: wrap;
            }
            .photo-section .thumb-wrapper .thumb-unit {
                width: 33.3%;
                background-color: pink;
                background-size: cover;
                background-position: center;
            }
            .photo-section .thumb-wrapper .thumb-unit:before {
                content: "";
                display: block;
                padding-top: 100%;
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
    </head>
    <body>

        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
            response.setHeader("pragma", "no-cache");

            if (session.getAttribute("id") == null) {
                response.sendRedirect("login.jsp");
            }

        %>
       
        <div class="container">
            <div class="header">

            </div>
            <div class="content">
                <div class="face">
                    <%  Connection con = null;
                        Statement statement = null;
                        ResultSet resultSet = null;

                    %>
                    <%                                    try {
                            con = DBConnection.createConnection();
                            statement = con.createStatement();
                            String sql = "SELECT * FROM  customer where cus_id='"+session.getAttribute("id")+"'";

                            resultSet = statement.executeQuery(sql);
                            while (resultSet.next()) {
                    %>
                </div>

 <div><form action="logoutServlet" method="post">
                        &nbsp&nbsp&nbsp<input type="submit" class="button btn-danger" value="Logout">
 </form></div>
                   
                <div class="name">Hi <%=resultSet.getString("name")%></div>
                 <button onclick="window.open('demo.pdf')" style="float: right;" class="button btn-warning">DEMO</button>
                
                <div class="email"><%=resultSet.getString("email")%></div>


              
            </div>
            <div class="photo-section">
                <div class="photo-title">
<div class="title"><a href="CusProfile.jsp" ><u>My Profile</u></a></div>
            
            <div class="title"><a href="bookedEvents">Booked Events</a></div>
            <div class="title"><a href="Feedback.jsp">Feedback</a></div>
          
                </div>
<br>
                <div align="center">




                    <p style="font-size:18px" class="text-center"><strong><big> Full name:  </big></strong><%=resultSet.getString("name")%></p>
                    <p style="font-size:18px"><strong><big>Address: </big></strong><%=resultSet.getString("address")%></p>
                    <p style="font-size:18px"><strong><big>Contact No: </big></strong> <%=resultSet.getString("contact_number")%></p>
                    <p style="font-size:18px"><strong><big>Email:</big> </strong><%=resultSet.getString("email")%></p>
                    <br><br>



                   

                    <button class="btn btn-success"  onclick="location.href = 'updateProfile.jsp?cus_id=<%=session.getAttribute("id")%>'"/>Edit Your Profile
                    </button>
                </div>


                <% }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>
             <BR><br><br>
<%@ include file="Layouts/Footer.jsp" %>
           <br>
           
            
        </div>

        <script src="Bootstrap/js/bootstrap.js"></script>
    </body>
</html>
