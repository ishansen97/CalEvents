<%-- 
    Document   : view
    Created on : Sep 1, 2018, 11:20:03 PM
    Author     : User
--%>


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
        
<div class="w3-bar w3-gray">
<button class="button button5" onclick="openTu('tentTableu')">Tents</button>
<button class="button button5" onclick="openTu('soundsTableu')">Sounds</button>
<button class="button button5" onclick="openTu('lightsTableu')">Lights</button>
<button class="button button5" onclick="openTu('kitchenTableu')">Kitchen Utensils</button>
<button class="button button5" onclick="openTu('tablesTableu')">Tables</button>
<button class="button button5" onclick="openTu('chairsTableu')">Chairs</button>
</div>
        
        
<div id="tentTableu" class="w3-container tableName" style="margin-left: 0%; margin-top: 0%;">
    
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
        <%  Facility tentsU = new Tents();
            ResultSet tentsVU = tentsU.fetch();
        %>
      <tr><%while(tentsVU.next()){%>
          <td><%= tentsVU.getString("facilitiyName") %></td>
          <td><%= tentsVU.getString("availableQuantity") %></td>
          <td><%= tentsVU.getString("totalQuantity") %></td>
          <td><%= tentsVU.getString("facilityCondition") %></td>
          <td><%= tentsVU.getString("tentColor") %></td>
          <td><%= tentsVU.getString("tentSize") %></td>
          <td><a href="updateFacility.jsp?event_id=<%=tentsVU.getString("facilityID") %>" class="button button5">Update</a></td>
      </tr><%}%>
      
    </tbody>
  </table>
    
</div>        
        
        
<div id="soundsTableu" class="w3-container tableName"  style="display: none;">
    
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
        <%  Facility soundsU = new Sounds();
            ResultSet soundsVU = soundsU.fetch();
        %>
      <tr><%while(soundsVU.next()){%>
          <td><%= soundsVU.getString("facilitiyName") %></td>
          <td><%= soundsVU.getString("availableQuantity") %></td>
          <td><%= soundsVU.getString("totalQuantity") %></td>
          <td><%= soundsVU.getString("facilityCondition") %></td>
          <td><%= soundsVU.getString("soundsBrand") %></td>
          <td><a href="updateFacility.jsp?event_id=<%=soundsVU.getString("facilityID") %>" class="button button5">Update</a></td>
      </tr><%}%>
    </tbody>
  </table>
</div>

<div id="lightsTableu" class="w3-container tableName"  style="display: none;">
    
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
        <%  Facility lightsU = new Lights();
            ResultSet lightsVU = lightsU.fetch();
        %>
      <tr><%while(lightsVU.next()){%>
          <td><%= lightsVU.getString("facilitiyName") %></td>
          <td><%= lightsVU.getString("availableQuantity") %></td>
          <td><%= lightsVU.getString("totalQuantity") %></td>
          <td><%= lightsVU.getString("facilityCondition") %></td>
          <td><a href="updateFacility.jsp?event_id=<%=lightsVU.getString("facilityID") %>" class="button button5">Update</a></td>
      </tr><%}%>
    </tbody>
  </table>
</div>

<div id="kitchenTableu" class="w3-container tableName"  style="display: none;">
    
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
        <%  Facility kitchenU = new KitchenUtensils();
            ResultSet kitchenVU = kitchenU.fetch();
        %>
      <tr><%while(kitchenVU.next()){%>
          <td><%= kitchenVU.getString("facilitiyName") %></td>
          <td><%= kitchenVU.getString("availableQuantity") %></td>
          <td><%= kitchenVU.getString("totalQuantity") %></td>
          <td><%= kitchenVU.getString("facilityCondition") %></td>
          <td><%= kitchenVU.getString("kUType") %></td>
          <td><a href="updateFacility.jsp?event_id=<%=kitchenVU.getString("facilityID") %>" class="button button5">Update</a></td>
      </tr><%}%>
    </tbody>
  </table>
    
</div> 

<div id="tablesTableu" class="w3-container tableName"  style="display: none;">
    
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
        <%  Facility tablesU = new Tables();
            ResultSet tablesVU = tablesU.fetch();
        %>
      <tr><%while(tablesVU.next()){%>
          <td><%= tablesVU.getString("facilitiyName") %></td>
          <td><%= tablesVU.getString("availableQuantity") %></td>
          <td><%= tablesVU.getString("totalQuantity") %></td>
          <td><%= tablesVU.getString("facilityCondition") %></td>
          <td><%= tablesVU.getString("tableSize") %></td>
          <td><%= tablesVU.getString("nOfChairsPT") %></td>
          <td><%= tablesVU.getString("tableShape") %></td>
          <td><a href="updateFacility.jsp?event_id=<%=tablesVU.getString("facilityID") %>" class="button button5">Update</a></td>
      </tr><%}%>
    </tbody>
  </table>
    
</div>

<div id="chairsTableu" class="w3-container tableName"  style="display: none;">
    
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
        <%  Facility chairsU = new Chairs();
            ResultSet chairsVU = chairsU.fetch();
        %>
      <tr><%while(chairsVU.next()){%>
          <td><%= chairsVU.getString("facilitiyName") %></td>
          <td><%= chairsVU.getString("availableQuantity") %></td>
          <td><%= chairsVU.getString("totalQuantity") %></td>
          <td><%= chairsVU.getString("facilityCondition") %></td>
          <td><%= chairsVU.getString("chairMaterial") %></td>
          <td><a href="updateFacility.jsp?event_id=<%=chairsVU.getString("facilityID") %>" class="button button5">Update</a></td>
      </tr><%}%>
    </tbody>
  </table>

</div>


        
        
        
        
        
        
        
        
<script>
function openTu(table_name) {
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
