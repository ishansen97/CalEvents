<%-- 
    Document   : addPackages
    Created on : Sep 13, 2018, 5:54:52 PM
    Author     : User
--%>

<%@page import="supporting.Fetch"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="faciliyPackages.operations.Facility_Packages"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Packages</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            .btn-outline-dark{
                outline: black;
                font-size: 200%;
                color: #ffffff;
                background-color: #009688;
            }
            .table-hover{
                font-size: 150%;
            }
        </style>
    </head>
    <body>

        <div class="container-fluid">
            <h4>Tents Details</h4>
            <table border="1">
                <thead>
                    <tr>
                        <th>Facility Name</th>
                        <th>Tent Color</th>
                        <th>Tent Size</th>
                        <th>Available Quantity</th>
                        <th>Total Quantity</th>
                    </tr>
                </thead>

                <%
                    Fetch available_Facilities = new Fetch();
                    ResultSet avalFac = available_Facilities.fetch_Facilities_By_Name("facilitytent");

                %>
                <tbody>
                    <tr>
                    <%while (avalFac.next()) {%>
                        <td><%=avalFac.getString("facilitiyName")%></td>
                        <td><%=avalFac.getString("tentColor")%></td>
                        <td><%=avalFac.getString("tentSize")%></td>
                        <td><%=avalFac.getString("availableQuantity")%></td>
                        <td><%=avalFac.getString("totalQuantity")%></td>
                    </tr><%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
