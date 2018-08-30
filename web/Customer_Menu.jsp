<%-- 
    Document   : Customer_Menu
    Created on : Aug 11, 2018, 1:31:17 PM
    Author     : Sohan
--%>
<%@page import="java.sql.*, menu.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Menu</title>
        
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <script src="External/Jquery/jquery.min.js" type="text/javascript"></script>
        <script src="External/Bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="External/Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <div align="center">
        <h1>Select Your Menu!</h1>
        
        <% ResultSet appertizers = Appertizer.getApperizer(); 
           ResultSet deserts = Deserts.getDeserts();
           ResultSet main_dishes = MainDish.getMainDish();
           ResultSet refreshments = Refreshments.getRefreshment();
        %>
        
        </div>
        <form action="/action_page.php">
            <a href="#app_chk_box" data-toggle="collapse" data-target="#app_chk_box">Appetizer : </a>
          <div class="form-group">
              
              <!--<input type="text" class="form-control " placeholder="Small form control" name="text1">-->
              <div id="app_chk_box" class="jumbotron collapse">
                  <% while (appertizers.next()) { %>
                  <input type="checkbox" id="<%=appertizers.getString("A_id") %>" value="<%=appertizers.getString("A_name") %>"><%=appertizers.getString("A_name") %>
                  <% } %>
              </div>
          </div>
            <a href="#main_chk_box" data-toggle="collapse" data-target="#main_chk_box">Main Dish : </a>
          <div class="form-group">
              <!--<input type="text" class="form-control" placeholder="Default form control" name="text2">-->
              <div id="main_chk_box" class="jumbotron collapse">
                  <% while (main_dishes.next()) { %>
                  <input type="checkbox" id="<%=main_dishes.getString("Md_id") %>" value="<%=main_dishes.getString("Md_name") %>"><%=main_dishes.getString("Md_name") %>
                  <% } %>
              </div>
          </div>
            <a href="#desert_chk_box" data-toggle="collapse" data-target="#desert_chk_box">Deserts : </a>
          <div class="form-group">
              <!--<input type="text" class="form-control" placeholder="Large form control" name="text3">-->
              <div id="desert_chk_box" class="jumbotron collapse">
                  <% while (deserts.next()) { %>
                  <input type="checkbox" id="<%=deserts.getString("D_id") %>" value="<%=deserts.getString("D_name") %>"><%=deserts.getString("D_name") %>
                  <% } %>
              </div>
          </div>
            <a href="#refresh_chk_box" data-toggle="collapse" data-target="#refresh_chk_box">Refreshments : </a>
          <div class="form-group">
              <!--<input type="text" class="form-control" placeholder="Large form control" name="text4">-->
              <div id="refresh_chk_box" class="jumbotron collapse">
                  <% while (refreshments.next()) { %>
                  <input type="checkbox" id="<%=refreshments.getString("R_id") %>" value="<%=refreshments.getString("R_name") %>"><%=refreshments.getString("R_name") %>
                  <% } %>
              </div>
          </div>  
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
        
        
        
    </body>
</html>
