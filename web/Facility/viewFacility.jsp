<%-- 
    Document   : viewFacility
    Created on : Sep 1, 2018, 1:04:49 AM
    Author     : User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="event.facilities.*"%>
<%--<%@page import="event.facilities.Facility"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Facilities</title>
        <script>
            function tents(){
              
              //hide
              
              document.getElementById("soundsTable").style.display="none";              
              document.getElementById("lightsTable").style.display="none";
              document.getElementById("kitchenTable").style.display="none";
              document.getElementById("tablesTable").style.display="none";
              document.getElementById("chairsTable").style.display="none";

              
              
              //show
              document.getElementById("tentsTable").style.display="";
            }
            function sounds(){
              
              //hide
              
              document.getElementById("tentsTable").style.display="none";              
              document.getElementById("lightsTable").style.display="none";
              document.getElementById("kitchenTable").style.display="none";
              document.getElementById("tablesTable").style.display="none";
              document.getElementById("chairsTable").style.display="none";
                
              //show
              document.getElementById("soundsTable").style.display="";
            }
            function lights(){
              
              //hide
              
              document.getElementById("tentsTable").style.display="none";              
              document.getElementById("soundsTable").style.display="none";
              document.getElementById("kitchenTable").style.display="none";
              document.getElementById("tablesTable").style.display="none";
              document.getElementById("chairsTable").style.display="none";
              
              //show
              document.getElementById("lightsTable").style.display="";
            }
            function kitchen(){
              
              //hide
              
              document.getElementById("tentsTable").style.display="none";              
              document.getElementById("soundsTable").style.display="none";
              document.getElementById("lightsTable").style.display="none";
              document.getElementById("tablesTable").style.display="none";
              document.getElementById("chairsTable").style.display="none";
              
              //show
              document.getElementById("kitchenTable").style.display="";
            }
            function tables(){
              
              //hide
              
              document.getElementById("tentsTable").style.display="none";              
              document.getElementById("soundsTable").style.display="none";
              document.getElementById("lightsTable").style.display="none";
              document.getElementById("kitchenTable").style.display="none";
              document.getElementById("chairsTable").style.display="none";
              
              //show
              document.getElementById("tablesTable").style.display="";
            }
            function chairs(){
              
              //hide
              
              document.getElementById("tentsTable").style.display="none";              
              document.getElementById("soundsTable").style.display="none";
              document.getElementById("lightsTable").style.display="none";
              document.getElementById("kitchenTable").style.display="none";
              document.getElementById("tablesTable").style.display="none";
              
              //show
              document.getElementById("chairsTable").style.display="";
            }
        </script>
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
</style>
    </head>
    <body>
        <input type="submit" class="button button5"  value="View Tents" name="Tents" id="tents" onclick="javascript:tents();" />
        <input type="submit" class="button button5"  value="View sounds" name="Tents" id="tents" onclick="javascript:sounds();" />
        <input type="submit" class="button button5"  value="View lights" name="Tents" id="tents" onclick="javascript:lights();" />
        <input type="submit" class="button button5"  value="View kitchen utensils" name="Tents" id="tents" onclick="javascript:kitchen();" />
        <input type="submit" class="button button5"  value="View tables" name="Tents" id="tents" onclick="javascript:tables();" />
        <input type="submit" class="button button5"  value="View chairs" name="Tents" id="tents" onclick="javascript:chairs();" />
        <!--facility class-->
        
        <div id="tentsTable" style="display: none;">
        </div>
        
        <div id="soundsTable" style="display: none;">
        </div>
        <div id="lightsTable" style="display: none;"><h1>lights area</h1></div>
        <div id="kitchenTable" style="display: none;"><h1>kitchen area</h1></div>
        <div id="tablesTable" style="display: none;"><h1>tables area</h1></div>
        <div id="chairsTable" style="display: none;"><h1>chairs area</h1></div>
    </body>
</html>
