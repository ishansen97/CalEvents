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
        <link href="Bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="style.css" rel="stylesheet" type="text/css"/>

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
                background-image: url(https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR5heNMmxfRuWx3r1LjFNdiFXPlWEmxA3nxBvYy-pF1wuBHidpqpw);
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
    </head>
    <body>

        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
            response.setHeader("pragma", "no-cache");

            if (session.getAttribute("username") == null && session.getAttribute("id") == null) {
                response.sendRedirect("login.jsp");
            }

        %>
        <link href="font-awesome.min.css" rel="stylesheet">
        <div class="container">
            <div class="header">
                <div class="icon"><i class="fa fa-ellipsis-h"></i></div>
                <div class="icon"><i class="fa fa-plus"></i></div>
            </div>
            <div class="content">
                <div class="face">
                    <%   Connection con = null;
                        Statement statement = null;
                        ResultSet resultSet = null;

                    %>
                    <%try {
                            con = DBConnection.createConnection();
                            statement = con.createStatement();
                            String sql = "SELECT * FROM users where userID=" + session.getAttribute("id");

                            resultSet = statement.executeQuery(sql);
                            while (resultSet.next()) {
                    %>
                    <!--<div class="number"><%=resultSet.getString("userID")%></div>->
                </div>


                <div class="name">Hi <%=resultSet.getString("name")%></div>

                <div><form action="logoutServlet" method="post">
                        &nbsp&nbsp&nbsp<input type="submit" class=" button btn-outline-danger" value="Logout">

                    </form></div>

            </div>
            <div class="photo-section">
                <div class="photo-title">
                    <div class="active title"><a href="CusProfile.jsp">My Profile</a></div>
                    <div class="title"><a href="Gallery">Gallery</a></div>
                    <div class="title"><a href="bookedEvents.jsp">Booked Events</a></div>
                    <div class="title"><a href="Feedback.jsp">Feedback</a></div>
                    <div class="title"><a href="Notification.jsp">Notifications</a></div>

                </div>


                <div align="center">

                   
                    <% }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                    <br><br><br><br><br><br>


                    <table border="2" class="table-hover" cellpadding="50">


                        <tr class="table-info">
                            
                            
                            <th>Email</th>
                            <th>Subject</th>
                            

                        </tr>

                        <%
                            try {
                                con = DBConnection.createConnection();
                                statement = con.createStatement();
                                String sqll = "SELECT * FROM  feedback where userID=" + session.getAttribute("id");

                                resultSet = statement.executeQuery(sqll);
                                while (resultSet.next()) {
                        %>
                        <tr>

                           
                            
                            <td><%=resultSet.getString("email")%></td>
                            <td><%=resultSet.getString("subject")%></td>
                           

                            <!--<td><input type="submit" value="update" onclick="location.href = 'updateFeedback.jsp?fid=<%=resultSet.getString("fid")%>'"/></td>-->




                                <% }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                        </tr>
                    </table>
                    <br><br><br>
                </div>

            </div>


        </div>

        <script src="Bootstrap/js/bootstrap.js"></script>
    </body>
</html>
