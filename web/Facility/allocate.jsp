<%-- 
    Document   : allocate]
    Created on : Sep 2, 2018, 9:45:29 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Allocate</title>
<style>     .button {
                background-color: #4CAF50; /* Green */
                border: none;
                color: white;
                padding: 16px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                -webkit-transition-duration: 0.4s; /* Safari */
                transition-duration: 0.4s;
                cursor: pointer;
            }
            
            .button5 {
                background-color: white;
                color: black;
                border: 2px solid #555555;
            }
            .button5:hover {
                background-color: #555555;
                color: white;
            }</style>
    </head>
<body style="background-color: #ededed">
 
<%@ include file="Layouts/Navigation.jsp" %>

<div class="w3-main" style="margin-left:300px; margin-top:43px;">
        <h1>Allocate Facilities</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Upcoming Events</th>
                    <th>Required Quantity</th>
                    <th>Available Quantity</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>items list</td>
                    <td>22</td>
                    <td>35</td>
                    <td><input type="submit" value="Allocate" name="Allocate" class="button button5" /></td>
                </tr>
            </tbody>
        </table>
</div>
    </body>
</html>
