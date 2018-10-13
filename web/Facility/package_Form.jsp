<%-- 
    Document   : package form
    Created on : Sep 13, 2018, 10:58:35 PM
    Author     : User
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="facilities.event.DBConnect"%>
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
        <style>



        </style>
        <title>Facility Form</title>
    </head>
    <body>

        <h2 class="alert-success">Select you event type :</h2>
        Indoor : <input type="radio" name="inout" value="indoor" id='in'/>
        Outdoor :<input type="radio" name="inout" value="outdoor" id='out'/> 

        <h2 class="alert-success">Select Facilities</h2>


        <hr><div class="container-fluid">
            <div class="row">
                <div class="col" id="indoorStuff" style="display:none;">
                    <table class="table-hover">
                        <tbody>
                            <tr>
                                <td><input type="checkbox" name="sounds" id="sounds" value="ON" /></td>
                                <td><h4 class="alert-danger">Entertainment</h4></td>
                                <%

                                    DBConnect db = DBConnect.getInstance();
                                    ResultSet fetchPackagesforCustomer = null;
                                    PreparedStatement queryFetchPackages = null;

                                        try{
                                    if(db.isConnected()){
                                        Connection con = db.getCon();
                                        queryFetchPackages = con.prepareStatement("SELECT * FROM `facility_packages`");
                                        fetchPackagesforCustomer = queryFetchPackages.executeQuery();
                                        while(fetchPackagesforCustomer.next()){
                                    
                                    
                                %>
                                <td><input type="radio" name="packageselected" id="fetchPackagesforCustomer.getString("packageID")%>"/><%=fetchPackagesforCustomer.getString("packageName")%></td><%}%>
                             
                            <%}}catch(Exception e){ out.print(e);}%>
                            </tr>

                            <tr>
                                <td><input type="checkbox" name="chairs" id="chairs"  value="ON" /></td>
                                <td><h4 class="alert-danger">Chairs</h4></td>
                            </tr>
                            <tr id="chairsOpt" style="display:none;">
                                <td><h4 class="alert-info">How many :</h4></td>
                                <td><input type="text" name="requiredChairs" id="requiredChairs"/></td>
                            </tr>
                            <tr style="display:none;" id="tentsOption">
                                <td><input type="checkbox" name="tents" id="tents"  value="ON" /></td>
                                <td><h4 class="alert-danger">Party Tent</h4></td>
                            </tr>
                        </tbody>
                    </table>

                </div>

                <button>Confirm</button>
                <button>Cancel</button>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $("#sounds").click(function () {
                    $("#soundsOpt").toggle();
                    $("#lightsOpt").toggle();
                });
            });
            $(document).ready(function () {
                $("#mics").click(function () {
                    $("#micOpt").toggle();
                });
            });
            $(document).ready(function () {
                $("#chairs").click(function () {
                    $("#chairsOpt").toggle();
                });
            });
            $(document).ready(function () {
                $("#in").click(function () {
                    $("#indoorStuff").show();
                    $("#tentsOption").hide();
                });
            });
            $(document).ready(function () {
                $("#out").click(function () {
                    $("#indoorStuff").show();
                    $("#tentsOption").show();
                });
            });
        </script>

    </body>
</html>
