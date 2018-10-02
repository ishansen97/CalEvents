<%-- 
    Document   : _test
    Created on : Oct 1, 2018, 12:30:46 PM
    Author     : Lini Eisha
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="facilities.event.*"%>
<%@page import="facilities.allocation.Packages"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Facility</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="jquery-3.3.1.min.js"></script>
        <style>
            div.scrollselectfacilities{
                background-color: white;
                width: 200px;
                height: 110px;
                overflow-y: scroll;
                margin-left: 10%;
            }

            .button {
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
            }

            input[type=text], select {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }


        </style>

    </head>
    <body>

        <div class="container">
            <div class="row">
                <h1></h1>
            </div>
            <div class="row">
                <div class="col">
                    <form action="../CreatePackage">
                        <table>
                            <tr>
                                <td><h4>Package Name :</h4> </td>
                                <td><input type="text" id="packagename" name="name"/></td>
                            </tr>
                            <tr>
                                <td><h4>Price</h4></td>
                                <td><input type="text" id="packageprice" name="price"/></td>
                            </tr>
                            <tr>
                                <td><h4>Select Facilities :</h4></td>
                            </tr>
                        </table>
                        <div class="scrollselectfacilities">
                            <%
                                ResultSet rs22211 = Packages.getAllFacilities();

                                while (rs22211.next()) {%>
                            <input type="checkbox" name="fac" id="<%=rs22211.getString("facilityID")%>" value="<%=rs22211.getString("facilityID")%>"/><%=rs22211.getString("facilitiyName")%>
                            <br>

                            <%}%>
                        </div>
                        <button class="button button5" type="submit">Submit</button>
                    </form>
                </div>
                        
                        <div class="col">
                            
                        </div>
            </div>
        </div>

    </body>
</html>
