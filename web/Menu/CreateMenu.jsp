<%-- 
    Document   : CreateMenu
    Created on : Aug 30, 2018, 10:14:02 AM
    Author     : Sohan
--%>
<%@page import="java.sql.*, menu.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Menu</title>
        
                 <%@ include file="Layouts/Styles.jsp" %>   

        
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <script src="../External/Jquery/jquery.min.js" type="text/javascript"></script>
        <script src="../External/Bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="../External/Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        
    </head>
    <script>
        function getAppertizers(obj) {
            var appertizer = document.getElementById(obj).value;
            var appertizer_arr = document.getElementById("appertizer_array").innerHTML;
            var arr1 = [appertizer_arr];
            
            arr1[arr1.length] = appertizer;
            document.getElementById("appertizer_array").innerHTML = arr1;
        }
        
        function getMainDishes(obj) {
            var main_dish = document.getElementById(obj).value;
            var main_dish_arr = document.getElementById("main_dish_array").innerHTML;
            var arr2 = [main_dish_arr];
            
            arr2[arr2.length] = main_dish;
            document.getElementById("main_dish_array").innerHTML = arr2;
        }
        
        function getDeserts(obj) {
            var desert = document.getElementById(obj).value;
            var dersert_arr = document.getElementById("deserts_array").innerHTML;
            var arr3 = [dersert_arr];
            
            arr3[arr3.length] = desert;
            document.getElementById("deserts_array").innerHTML = arr3;
        }
        
        function getRefreshments(obj) {
            var refreshment = document.getElementById(obj).value;
            var refresh_arr = document.getElementById("refreshments_array").innerHTML;
            var arr4 = [refresh_arr];
            
            arr4[arr4.length] = refreshment;
            document.getElementById("refreshments_array").innerHTML = arr4;
        }
        
        function integrate() {
            var appertizers = document.getElementById("appertizer_array").innerHTML;
            var main_dishes = document.getElementById("main_dish_array").innerHTML;
            var deserts = document.getElementById("deserts_array").innerHTML;
            var refreshments = document.getElementById("refreshments_array").innerHTML;
            
            document.getElementById("app_menu").value = appertizers;
            document.getElementById("main_menu").value = main_dishes;
            document.getElementById("desert_menu").value = deserts;
            document.getElementById("refresh_menu").value = refreshments;
        }
        
        function validation() {
            var appertizers = document.getElementById("app_menu").value;
            var main_dishes = document.getElementById("main_menu").value;
            var deserts = document.getElementById("desert_menu").value;
            var refreshments = document.getElementById("refresh_menu").value;
            
            if (appertizers === "" && main_dishes === "" && deserts === "" && refreshments === "") {
                alert("Please select menu items");
                return false;
            }
            else
                return true;
        }
        
        $(document).ready(function() {
            $("#create").click(function() {
                var appertizers = document.getElementById("app_menu").value;
                var main_dishes = document.getElementById("main_menu").value;
                var deserts = document.getElementById("desert_menu").value;
                var refreshments = document.getElementById("refresh_menu").value;
                
                $.post("<%=request.getContextPath() %>/Create_Menu", {appertizers : appertizers, main_dishes : main_dishes, deserts : deserts, refreshments : refreshments}, function(data) {
                    alert("Your data is : " + data); });
            });
        });
        
   </script>
    <body>
        
        <div align="center">
        <h1>Create Menu!</h1>
        
        <% ResultSet appertizers = Appertizer.getApperizer(); 
           ResultSet deserts = Deserts.getDeserts();
           ResultSet main_dishes = MainDish.getMainDish();
           ResultSet refreshments = Refreshments.getRefreshment();
        %>
        
        </div>
        <!--<form action="<%=request.getContextPath() %>/Create_Menu" onsubmit="return validation()">-->
            <a href="#app_chk_box" data-toggle="collapse" data-target="#app_chk_box">Appetizer : </a>
          <div class="form-group">
              
              <!--<input type="text" class="form-control " placeholder="Small form control" name="text1">-->
              <div id="app_chk_box" class="jumbotron collapse">
                  <% while (appertizers.next()) { %>
                  <input type="checkbox" id="<%=appertizers.getString("A_id") %>" value="<%=appertizers.getString("A_name") %>" onclick="getAppertizers(this.id)"><%=appertizers.getString("A_name") %>
                  <% } %>
                  <p id="appertizer_array" hidden></p>
              </div>
          </div>
            <a href="#main_chk_box" data-toggle="collapse" data-target="#main_chk_box">Main Dish : </a>
          <div class="form-group">
              <!--<input type="text" class="form-control" placeholder="Default form control" name="text2">-->
              <div id="main_chk_box" class="jumbotron collapse">
                  <% while (main_dishes.next()) { %>
                  <input type="checkbox" id="<%=main_dishes.getString("Md_id") %>" value="<%=main_dishes.getString("Md_name") %>" onclick="getMainDishes(this.id)"><%=main_dishes.getString("Md_name") %>
                  <% } %>
                  <p id="main_dish_array" hidden></p>
              </div>
          </div>
            <a href="#desert_chk_box" data-toggle="collapse" data-target="#desert_chk_box">Deserts : </a>
          <div class="form-group">
              <!--<input type="text" class="form-control" placeholder="Large form control" name="text3">-->
              <div id="desert_chk_box" class="jumbotron collapse">
                  <% while (deserts.next()) { %>
                  <input type="checkbox" id="<%=deserts.getString("D_id") %>" value="<%=deserts.getString("D_name") %>" onclick="getDeserts(this.id)"><%=deserts.getString("D_name") %>
                  <% } %>
                  <p id="deserts_array" hidden></p>
              </div>
          </div>
            <a href="#refresh_chk_box" data-toggle="collapse" data-target="#refresh_chk_box">Refreshments : </a>
          <div class="form-group">
              <!--<input type="text" class="form-control" placeholder="Large form control" name="text4">-->
              <div id="refresh_chk_box" class="jumbotron collapse">
                  <% while (refreshments.next()) { %>
                  <input type="checkbox" id="<%=refreshments.getString("R_id") %>" value="<%=refreshments.getString("R_name") %>" onclick="getRefreshments(this.id)"><%=refreshments.getString("R_name") %>
                  <% } %>
                  <p id="refreshments_array" hidden></p>
              </div>
          </div>  
            <button type="submit" class="btn btn-success" id="create">Create</button>
            <button type="button" class="btn btn-success" onclick="return integrate()">Confirm</button>
            <input type="text" name="app_menu" id="app_menu">
            <input type="text" name="main_menu" id="main_menu">
            <input type="text" name="desert_menu" id="desert_menu">
            <input type="text" name="refresh_menu" id="refresh_menu">
            
            <button type="reset" class="btn btn-danger"> Reset </button>
           
        <!--</form>-->
        
    </body>
</html>
