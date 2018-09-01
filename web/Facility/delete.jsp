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
        
        <style>
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
            select {
                background-repeat:no-repeat;
                background-position:300px;
                width:353px;
                padding:5px;
                margin-top:8px;
                border-radius:5px;
                background-color:white;
                color:#555555;
                font-size:15px;
            }
            
            select:hover {
                color:white;
                background-color:#555555;
            }
            
            input[type=text], select {
                width: 20%;
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
        
<div class="w3-bar w3-black">
<button class="w3-bar-item w3-button" onclick="openT('tentTable')">Tents</button>
<button class="w3-bar-item w3-button" onclick="openT('soundsTable')">Sounds</button>
<button class="w3-bar-item w3-button" onclick="openT('lightsTable')">Lights</button>
<button class="w3-bar-item w3-button" onclick="openT('kitchenTable')">Kitchen Utensils</button>
<button class="w3-bar-item w3-button" onclick="openT('tablesTable')">Tables</button>
<button class="w3-bar-item w3-button" onclick="openT('chairsTable')">Chairs</button>
</div>
        
        
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
        <%  Facility tents1 = new Tents();
            ResultSet tentsV1 = tents1.fetch();
            ResultSet tentsV2 = tents1.fetch();
        %>
    
      <tr><%while(tentsV1.next()){%>
          <td><%= tentsV1.getString("facilitiyName") %></td>
          <td><%= tentsV1.getString("availableQuantity") %></td>
          <td><%= tentsV1.getString("totalQuantity") %></td>
          <td><%= tentsV1.getString("facilityCondition") %></td>
          <td><%= tentsV1.getString("tentColor") %></td>
          <td><%= tentsV1.getString("tentSize") %></td>
      </tr><%}%>
    </tbody>
  </table>

    <form action="../delete" method="POST">
    <select name="idT"><%while(tentsV2.next()){%>
        <option><%= tentsV2.getString("facilitiyName") %></option><%}%>
    </select>
    <input type="hidden" value="facilitytent" name="view">
    <input type="submit" value="Remove This" class="button button5" />
    </form>
      </div>      
        
        
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
        <%  Facility sounds1 = new Sounds();
            ResultSet soundsV1 = sounds1.fetch();
            ResultSet soundsV2 = sounds1.fetch();
        %>
      <tr><%while(soundsV1.next()){%>
          <td><%= soundsV1.getString("facilitiyName") %></td>
          <td><%= soundsV1.getString("availableQuantity") %></td>
          <td><%= soundsV1.getString("totalQuantity") %></td>
          <td><%= soundsV1.getString("facilityCondition") %></td>
          <td><%= soundsV1.getString("soundsBrand") %></td>
      </tr><%}%>
    </tbody>
  </table>

    <form action="../delete" method="POST">
    <select><%while(soundsV2.next()){%>
        <option><%= soundsV2.getString("facilitiyName") %></option><%}%>
    </select>
    <input type="hidden" value="facilitysound" name="view">
    <input type="submit" value="Remove This" class="button button5" />
    </form>
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
        <%  Facility lights1 = new Lights();
            ResultSet lightsV1 = lights1.fetch();
            ResultSet lightsV2 = lights1.fetch();
        %>
      <tr><%while(lightsV1.next()){%>
          <td><%= lightsV1.getString("facilitiyName") %></td>
          <td><%= lightsV1.getString("availableQuantity") %></td>
          <td><%= lightsV1.getString("totalQuantity") %></td>
          <td><%= lightsV1.getString("facilityCondition") %></td>
      </tr><%}%>
    </tbody>
  </table>

    <form action="../delete" method="POST">
    <select><%while(lightsV2.next()){%>
        <option><%= lightsV2.getString("facilitiyName") %></option><%}%>
    </select>
    <input type="hidden" value="facilitylight" name="view">
    <input type="submit" value="Remove This" class="button button5" />
    </form>
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
        <%  Facility kitchen1 = new KitchenUtensils();
            ResultSet kitchenV1 = kitchen1.fetch();
            ResultSet kitchenV2 = kitchen1.fetch();
        %>
      <tr><%while(kitchenV1.next()){%>
          <td><%= kitchenV1.getString("facilitiyName") %></td>
          <td><%= kitchenV1.getString("availableQuantity") %></td>
          <td><%= kitchenV1.getString("totalQuantity") %></td>
          <td><%= kitchenV1.getString("facilityCondition") %></td>
          <td><%= kitchenV1.getString("kUType") %></td>
      </tr><%}%>
    </tbody>
  </table>

    <form action="../delete" method="POST">
    <select><%while(kitchenV2.next()){%>
        <option><%= kitchenV2.getString("facilitiyName") %></option><%}%>
    </select>
    <input type="hidden" value="facilitykitchen" name="view">
    <input type="submit" value="Remove This" class="button button5" />
    </form>
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
        <%  Facility tables1 = new Tables();
            ResultSet tablesV1 = tables1.fetch();
            ResultSet tablesV2 = tables1.fetch();
        %>
      <tr><%while(tablesV1.next()){%>
          <td><%= tablesV1.getString("facilitiyName") %></td>
          <td><%= tablesV1.getString("availableQuantity") %></td>
          <td><%= tablesV1.getString("totalQuantity") %></td>
          <td><%= tablesV1.getString("facilityCondition") %></td>
          <td><%= tablesV1.getString("tableSize") %></td>
          <td><%= tablesV1.getString("nOfChairsPT") %></td>
          <td><%= tablesV1.getString("tableShape") %></td>
      </tr><%}%>
    </tbody>
  </table>

    <form action="../delete" method="POST">
    <select><%while(tablesV2.next()){%>
        <option><%= tablesV2.getString("facilitiyName") %></option><%}%>
    </select>
    <input type="hidden" value="facilitytable" name="view">
    <input type="submit" value="Remove This" class="button button5" />
    </form>
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
        <%  Facility chairs1 = new Chairs();
            ResultSet chairsV1 = chairs1.fetch();
            ResultSet chairsV2 = chairs1.fetch();
        %>
      <tr><%while(chairsV1.next()){%>
          <td><%= chairsV1.getString("facilitiyName") %></td>
          <td><%= chairsV1.getString("availableQuantity") %></td>
          <td><%= chairsV1.getString("totalQuantity") %></td>
          <td><%= chairsV1.getString("facilityCondition") %></td>
          <td><%= chairsV1.getString("chairMaterial") %></td>
      </tr><%}%>
    </tbody>
  </table>

    <form action="../delete" method="POST">
    <select><%while(chairsV2.next()){%>
        <option><%= chairsV2.getString("facilitiyName") %></option><%}%>
    </select>
    <input type="hidden" value="facilitychair" name="view">
    <input type="submit" value="Remove This" class="button button5" />
    </form>
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
