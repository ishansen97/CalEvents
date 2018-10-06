<%-- 
    Document   : newjsp
    Created on : Oct 2, 2018, 9:23:23 PM
    Author     : User
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="facilities.event.DBConnect"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
    </head>
    <body>
        
        <%
            ResultSet rs43 = null;
            ResultSet rs22 = null;
            PreparedStatement ps43 = null;
            PreparedStatement ps22 = null;

            ArrayList<Integer> co = new ArrayList<Integer>();
            ArrayList<String> facilityNames = new ArrayList<String>();
            DBConnect dbsomething = DBConnect.getInstance();

            Set<String> set = new HashSet<String>();
            Set<String> set2 = new HashSet<String>();
            int counter = 0;
            int j = 0;

            if (dbsomething.isConnected()) {
                Connection con = dbsomething.getCon();

                ps43 = con.prepareStatement("SELECT * FROM `packagesview`");
                rs43 = ps43.executeQuery();

                while (rs43.next()) {
                    set.add(rs43.getString("packageName"));

                }
                String[] array = set.toArray(new String[set.size()]);

                for (int i = 0; i < array.length; i++) {
                    ps22 = con.prepareStatement("SELECT * FROM `packagesview` WHERE `packageName` = ? ");
                    ps22.setString(1, array[i]);
                    rs22 = ps22.executeQuery();%>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-10">
            <!--<span class="border border-danger">-->
        <table class="table table-hover">
            <thead>
                <tr><th><h4>Package Name </h4></th>
                    <th><h4><b><%=array[i]%></b></h4></th>
                </tr>
            </thead>
            <tr class="danger">
                <td><h4>Facilities : </h4></td>
                    <%while (rs22.next()) {%>
                <td>
                    <h4 ><%=rs22.getString("facilitiyName")%></h4>
                </td>

                    <%

                                }

                            }
                        }
                    %>
            </tr>

        </table>
            <!--</span>-->
        </div>
        
    </div>
    
    
</div>



    </body>
</html>
