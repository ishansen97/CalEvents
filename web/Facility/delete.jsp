<%-- 
    Document   : view
    Created on : Sep 1, 2018, 11:20:03 PM
    Author     : User
--%>

<%@page import="event.facilities.Chairs"%>
<%@page import="event.facilities.Tables"%>
<%@page import="event.facilities.KitchenUtensils"%>
<%@page import="event.facilities.Lights"%>
<%@page import="event.facilities.Sounds"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="event.facilities.Tents"%>
<%@page import="event.facilities.Facility"%>
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
</head>
<body>
        
<div class="w3-bar w3-black">
<button class="w3-bar-item w3-button" onclick="openT('tentTable')">Tents</button>
<button class="w3-bar-item w3-button" onclick="openT('soundsTable')">Sounds</button>
<button class="w3-bar-item w3-button" onclick="openT('lightsTable')">Lights</button>
<button class="w3-bar-item w3-button" onclick="openT('kitchenTable')">Kitchen Utensils</button>
<button class="w3-bar-item w3-button" onclick="openT('tablesTable')">Tables</button>
<button class="w3-bar-item w3-button" onclick="openT('chairsTable')">Chairs</button>
</div>
        
    <form method="POST" action="../delete">        
<div id="tentTable" class="w3-container tableName" style="margin-left: 0%; margin-top: 0%;">
    
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
        <%  Facility tents = new Tents();
            ResultSet tentsV = tents.fetch();
        %>
      <tr><%while(tentsV.next()){%>
          <td><%= tentsV.getString("facilitiyName") %></td>
          <td><%= tentsV.getString("availableQuantity") %></td>
          <td><%= tentsV.getString("totalQuantity") %></td>
          <td><%= tentsV.getString("facilityCondition") %></td>
          <td><%= tentsV.getString("tentColor") %></td>
          <td><%= tentsV.getString("tentSize") %></td>          
          <!--<td><input type="hidden" name="fID" value= /></td>--><%
            request.setAttribute("id", tentsV.getString("facilityID"));%>
          <td><input type="submit" value="Delete" id=<%= tentsV.getString("facilityID")%>/></td>
      </tr><%}%>
    </tbody>
  </table>
    
</div>        
</form>        
        
<div id="soundsTable" class="w3-container tableName"  style="display: none;">
    
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
        <%  Facility sounds = new Sounds();
            ResultSet soundsV = sounds.fetch();
        %>
      <tr><%while(soundsV.next()){%>
          <td><%= soundsV.getString("facilitiyName") %></td>
          <td><%= soundsV.getString("availableQuantity") %></td>
          <td><%= soundsV.getString("totalQuantity") %></td>
          <td><%= soundsV.getString("facilityCondition") %></td>
          <td><%= soundsV.getString("soundsBrand") %></td>
      </tr><%}%>
    </tbody>
  </table>
</div>

<div id="lightsTable" class="w3-container tableName"  style="display: none;">
    
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
        <%  Facility lights = new Lights();
            ResultSet lightsV = lights.fetch();
        %>
      <tr><%while(lightsV.next()){%>
          <td><%= lightsV.getString("facilitiyName") %></td>
          <td><%= lightsV.getString("availableQuantity") %></td>
          <td><%= lightsV.getString("totalQuantity") %></td>
          <td><%= lightsV.getString("facilityCondition") %></td>
      </tr><%}%>
    </tbody>
  </table>
</div>

<div id="kitchenTable" class="w3-container tableName"  style="display: none;">
    
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
        <%  Facility kitchen = new KitchenUtensils();
            ResultSet kitchenV = kitchen.fetch();
        %>
      <tr><%while(kitchenV.next()){%>
          <td><%= kitchenV.getString("facilitiyName") %></td>
          <td><%= kitchenV.getString("availableQuantity") %></td>
          <td><%= kitchenV.getString("totalQuantity") %></td>
          <td><%= kitchenV.getString("facilityCondition") %></td>
          <td><%= kitchenV.getString("kUType") %></td>
      </tr><%}%>
    </tbody>
  </table>
    
</div> 

<div id="tablesTable" class="w3-container tableName"  style="display: none;">
    
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
        <%  Facility tables = new Tables();
            ResultSet tablesV = tables.fetch();
        %>
      <tr><%while(tablesV.next()){%>
          <td><%= tablesV.getString("facilitiyName") %></td>
          <td><%= tablesV.getString("availableQuantity") %></td>
          <td><%= tablesV.getString("totalQuantity") %></td>
          <td><%= tablesV.getString("facilityCondition") %></td>
          <td><%= tablesV.getString("tableSize") %></td>
          <td><%= tablesV.getString("nOfChairsPT") %></td>
          <td><%= tablesV.getString("tableShape") %></td>
      </tr><%}%>
    </tbody>
  </table>
    
</div>

<div id="chairsTable" class="w3-container tableName"  style="display: none;">
    
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
        <%  Facility chairs = new Chairs();
            ResultSet chairsV = chairs.fetch();
        %>
      <tr><%while(chairsV.next()){%>
          <td><%= chairsV.getString("facilitiyName") %></td>
          <td><%= chairsV.getString("availableQuantity") %></td>
          <td><%= chairsV.getString("totalQuantity") %></td>
          <td><%= chairsV.getString("facilityCondition") %></td>
          <td><%= chairsV.getString("chairMaterial") %></td>
      </tr><%}%>
    </tbody>
  </table>"
</div>


        
        
        
        
        
        
        
        
<script>
function openT(table_name) {
    var i;
    var x = document.getElementsByClassName("tableName");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    document.getElementById(table_name).style.display = "block";  
}
</script>
    </body>
</html>
