<%-- 
    Document   : makka
    Created on : Sep 9, 2018, 12:01:03 PM
    Author     : Lini Eisha
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="test.fetch"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#home">Appetizers</a></li>
  <li><a data-toggle="tab" href="#menu1">Main Dishes</a></li>
  <li><a data-toggle="tab" href="#menu2">Desserts</a></li>
  <li><a data-toggle="tab" href="#menu3">Refreshments</a></li>
</ul>
        
        
<div class="tab-content">
  <div id="home" class="tab-pane fade in active">
    <h3>Appetizers</h3>
    <p> </p>
  </div>
  <div id="menu1" class="tab-pane fade">
    <h3>Main Dishes</h3>
    <p>Some content in menu 1.</p>
  </div>
  <div id="menu2" class="tab-pane fade">
    <h3>Desserts</h3>
    <p>Some content in menu 2.</p>
  </div>
  <div id="menu3" class="tab-pane fade">
    <h3>Refreshments</h3>
    <p>Some content in menu 2.</p>
  </div>
</div>
    </body>
</html>
