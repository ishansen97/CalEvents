<%-- 
    Document   : view
    Created on : Sep 1, 2018, 11:20:03 PM
    Author     : User
--%>

<%@page import="facilities.event.Facility"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="facilities.event.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

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
    <body>


        <div class="w3-main">


            <div class="alert alert-danger">
                <h1>Remove Facilities</h1>
            </div>

            <div class="alert-danger">
                <button class="button button5" onclick="openTd('tentTabled')">Tents</button>
                <button class="button button5" onclick="openTd('soundsTabled')">Sounds</button>
                <button class="button button5" onclick="openTd('lightsTabled')">Lights</button>
                <button class="button button5" onclick="openTd('kitchenTabled')">Kitchen Utensils</button>
                <button class="button button5" onclick="openTd('tablesTabled')">Tables</button>
                <button class="button button5" onclick="openTd('chairsTabled')">Chairs</button>
            </div>


            <div id="tentTabled" class="w3-container tableName1" style="margin-left: 0%; margin-top: 0%;">

                <h2>Tent Information</h2>
                <p>bellow table contains all the currently available facilities regarding TENTS.</p>       

                <table class="table">
                    <thead>
                        <tr>
                            <th>Tent</th>
                            <th>Available Quantity</th>
                            <th>Total Quantity</th>
                            <th>Condition</th>
                            <th>Color</th>
                            <th>Size</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%  Facility tentsD = new Tents();
                            ResultSet tentsVD = tentsD.fetch();
                        %>
                        <tr><%while (tentsVD.next()) {%>
                            <td><%= tentsVD.getString("facilitiyName")%></td>
                            <td><%= tentsVD.getString("availableQuantity")%></td>
                            <td><%= tentsVD.getString("totalQuantity")%></td>
                            <td><%= tentsVD.getString("facilityCondition")%></td>
                            <td><%= tentsVD.getString("tentColor")%></td>
                            <td><%= tentsVD.getString("tentSize")%></td>
                            <td><a href="deleteFacility.jsp?event_id=<%=tentsVD.getString("facilityID")%>" class="button button5">Delete</a></td>
                        </tr><%}%>

                    </tbody>
                </table>

            </div>        


            <div id="soundsTabled" class="w3-container tableName1"  style="display: none;">

                <h2>Sound Equipment Information</h2>
                <p>bellow table contains all the currently available facilities regarding SOUND EQUIPMENTS.</p>            
                <table class="table">
                    <thead>
                        <tr>
                            <th>Sound Equipment</th>
                            <th>Available Quantity</th>
                            <th>Total Quantity</th>
                            <th>Condition</th>
                            <th>Brand</th>
                    </thead>
                    <tbody>
                        <%  Facility soundsD = new Sounds();
                            ResultSet soundsVD = soundsD.fetch();
                        %>
                        <tr><%while (soundsVD.next()) {%>
                            <td><%= soundsVD.getString("facilitiyName")%></td>
                            <td><%= soundsVD.getString("availableQuantity")%></td>
                            <td><%= soundsVD.getString("totalQuantity")%></td>
                            <td><%= soundsVD.getString("facilityCondition")%></td>
                            <td><%= soundsVD.getString("soundsBrand")%></td>
                            <td><a href="deleteFacility.jsp?event_id=<%=soundsVD.getString("facilityID")%>" class="button button5">Delete</a></td>
                        </tr><%}%>
                    </tbody>
                </table>
            </div>

            <div id="lightsTabled" class="w3-container tableName1"  style="display: none;">

                <h2>Lightning Equipment Information</h2>
                <p>bellow table contains all the currently available facilities regarding LIGHTNING EQUIPMENTS.</p>            
                <table class="table">
                    <thead>
                        <tr>
                            <th>Light Equipment</th>
                            <th>Available Quantity</th>
                            <th>Total Quantity</th>
                            <th>Condition</th>
                    </thead>
                    <tbody>
                        <%  Facility lightsD = new Lights();
                            ResultSet lightsVD = lightsD.fetch();
                        %>
                        <tr><%while (lightsVD.next()) {%>
                            <td><%= lightsVD.getString("facilitiyName")%></td>
                            <td><%= lightsVD.getString("availableQuantity")%></td>
                            <td><%= lightsVD.getString("totalQuantity")%></td>
                            <td><%= lightsVD.getString("facilityCondition")%></td>
                            <td><a href="deleteFacility.jsp?event_id=<%=lightsVD.getString("facilityID")%>" class="button button5">Delete</a></td>
                        </tr><%}%>
                    </tbody>
                </table>
            </div>

            <div id="kitchenTabled" class="w3-container tableName1"  style="display: none;">

                <h2>Kitchen Utensils Information</h2>
                <p>bellow table contains all the currently available facilities regarding KITCHEN UTENSILS.</p>            
                <table class="table">
                    <thead>
                        <tr>
                            <th>Item Name</th>
                            <th>Available Quantity</th>
                            <th>Total Quantity</th>
                            <th>Condition</th>
                            <th>Type</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%  Facility kitchenD = new KitchenUtensils();
                            ResultSet kitchenVD = kitchenD.fetch();
                        %>
                        <tr><%while (kitchenVD.next()) {%>
                            <td><%= kitchenVD.getString("facilitiyName")%></td>
                            <td><%= kitchenVD.getString("availableQuantity")%></td>
                            <td><%= kitchenVD.getString("totalQuantity")%></td>
                            <td><%= kitchenVD.getString("facilityCondition")%></td>
                            <td><%= kitchenVD.getString("kUType")%></td>
                            <td><a href="deleteFacility.jsp?event_id=<%=kitchenVD.getString("facilityID")%>" class="button button5">Delete</a></td>
                        </tr><%}%>
                    </tbody>
                </table>

            </div> 

            <div id="tablesTabled" class="w3-container tableNam1"  style="display: none;">

                <h2>Table Information</h2>
                <p>bellow table contains all the currently available facilities regarding TABLES.</p>            
                <table class="table">
                    <thead>
                        <tr>
                            <th>Table Type</th>
                            <th>Available Quantity</th>
                            <th>Total Quantity</th>
                            <th>Condition</th>
                            <th>Table Size</th>
                            <th>No Of Chairs</th>
                            <th>Shape</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%  Facility tablesD = new Tables();
                            ResultSet tablesVD = tablesD.fetch();
                        %>
                        <tr><%while (tablesVD.next()) {%>
                            <td><%= tablesVD.getString("facilitiyName")%></td>
                            <td><%= tablesVD.getString("availableQuantity")%></td>
                            <td><%= tablesVD.getString("totalQuantity")%></td>
                            <td><%= tablesVD.getString("facilityCondition")%></td>
                            <td><%= tablesVD.getString("tableSize")%></td>
                            <td><%= tablesVD.getString("nOfChairsPT")%></td>
                            <td><%= tablesVD.getString("tableShape")%></td>
                            <td><a href="deleteFacility.jsp?event_id=<%=tablesVD.getString("facilityID")%>" class="button button5">Delete</a></td>
                        </tr><%}%>
                    </tbody>
                </table>

            </div>

            <div id="chairsTabled" class="w3-container tableName1"  style="display: none;">

                <h2>Chair Information</h2>
                <p>bellow table contains all the currently available facilities regarding CHAIRS.</p>            
                <table class="table">
                    <thead>
                        <tr>
                            <th>Item</th>
                            <th>Available Quantity</th>
                            <th>Total Quantity</th>
                            <th>Condition</th>
                            <th>Brand</th>
                    </thead>
                    <tbody>
                        <%  Facility chairsD = new Chairs();
                            ResultSet chairsVD = chairsD.fetch();
                        %>
                        <tr><%while (chairsVD.next()) {%>
                            <td><%= chairsVD.getString("facilitiyName")%></td>
                            <td><%= chairsVD.getString("availableQuantity")%></td>
                            <td><%= chairsVD.getString("totalQuantity")%></td>
                            <td><%= chairsVD.getString("facilityCondition")%></td>
                            <td><%= chairsVD.getString("chairMaterial")%></td>
                            <td><a href="deleteFacility.jsp?event_id=<%=chairsVD.getString("facilityID")%>" class="button button5">Delete</a></td>
                        </tr><%}%>
                    </tbody>
                </table>

            </div>

        </div>








        <script>
            function openTd(table_name) {
                var i;
                var x = document.getElementsByClassName("tableName1");
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                document.getElementById(table_name).style.display = "block";
            }
        </script>
    </body>
</html>
