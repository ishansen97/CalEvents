<%-- 
    Document   : package form
    Created on : Sep 13, 2018, 10:58:35 PM
    Author     : User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="faciliyPackages.operations.Facility_Packages"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Facility Form</title>
    </head>
    <body>
        <h2>We recommend you these facility packages</h2>
        <hr>

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
                        <td id="packName"><%=packages.getString("packageName")%></td>
                        <td><%=packages.getString("facilities")%></td>
                        <td><%=packages.getString("price")%></td>
                        <td></td>
                    </tr><%}%>
                </tbody>
            </table>
                <button>work</button>
        </div>

        <script>
            $(document).ready(function () {
                $("button").click(function () {
                    $("[id='packName']").each(function () {
                        var names = new Array($(this).text());
                    });
                    
                });
            });
        </script>

    </body>
</html>
