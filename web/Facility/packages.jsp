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
        <br>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-4 "><button type="button" class="btn btn-outline-dark">Add Packages</button></div>
            
                <div class="col-sm-4 "><button type="button" class="btn btn-outline-dark">Remove Packages</button></div>
            
                <div class="col-sm-4"><button type="button" class="btn btn-outline-dark">Update Price/Facilities</button>
              </div>
            </div>
            <br>

        </div>
        <div class="container-fluid"> <h1>Available Packages</h1></div>
       

        <div class="container-fluid">
            <table class="table table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>Package Name</th>
                        <th>Facilities</th>
                        <th>Price($)</th>
                    </tr>
                </thead>
                <tbody><%  Facility_Packages fetch = new Facility_Packages();
                    ResultSet packages = fetch.fetch_Packages();
                    %>
                    <%while (packages.next()) {%>
                    <tr>
                        <td><%=packages.getString("packageName")%></td>
                        <td><%=packages.getString("facilities")%></td>
                        <td><%=packages.getString("price")%></td>
                    </tr><%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
        <script>
            $(document).ready(function () {
                $("button").click(function () {
                    $("[id='packName']").each(function () {
                        var names = new Array($(this).text());
                    });

                });
            });
        </script>