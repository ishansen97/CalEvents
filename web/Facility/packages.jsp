<%-- 
    Document   : addPackages
    Created on : Sep 13, 2018, 5:54:52 PM
    Author     : User
--%>

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

        <button id="btn">click</button>
                        <script>
            $(document).ready(function () {
                $("#btn").click(function () {
                   
                   window.open("facilityActivities.jsp");
                    
                });
            });
        </script>
    </body>
</html>
            <%
                Allocation all = new Allocation("dj");
                all.find_facility_view();
                ResultSet test = all.fetch_available_facilities();
            %>
            <%while (test.next()) {%>
            <h3><%=test.getString("facilitiyName")%></h3>
            <h3><%=test.getString("availableQuantity")%></h3>
            <h3><%=test.getString("facilityCondition")%></h3>

            <%}%>
