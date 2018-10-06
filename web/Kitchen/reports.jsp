<%-- 
    Document   : reports
    Created on : Oct 5, 2018, 6:36:03 PM
    Author     : Lini Eisha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

         <%@ include file="Layouts/Styles.jsp" %>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <style>
             body h1{


                color:#004085;
                width: 45% ; 
            }
        </style>
        

    </head>
    <body class="w3-light-grey">
        
 <%@ include file="Layouts/Navigation.jsp" %>
 
 <div class="w3-main" style="margin-left:300px;margin-top:43px;">
 
<div>
                <center><h1>Raw Materials </h1></center>
            </div>



            <!--<div class="container">-->
            <h1 style="padding-left:0%;">Reports</h1>
            <hr><hr>
     
     <div class="col-sm-8 col-md-6">
        <div class="card text-white bg-info mb-3" style="max-width:45%; max-height: 50%; align-content: right">
            <div class="card-header">Raw Materials</div>
            <div class="card-body">
                <h4 class="card-title">Information about the stock</h4>
                <p class="card-text">Available raw materials , price of the raw materials in the stock and also the quantities</p>
                <a href="#" class="btn btn-light">Get the report</a>
            </div>
        </div>
        </div>
            
            <div class="col-sm-8 col-md-6">
                    <div class="card text-white bg-info mb-3" style="max-width: 45%; max-height: 50%; align-content: right">
            <div class="card-header">Determine Raw Materials </div>
            <div class="card-body">
                <h4 class="card-title">Information about determined raw materials</h4>
                <p class="card-text">which food have what raw materials and quantities</p>
                <a href="#" class="btn btn-light">Get the report</a>
            </div>

        </div>
            </div>
            
            <div class="col-sm-8 col-md-6">
                    <div class="card text-white bg-info mb-3" style="max-width: 45%; max-height: 50%; align-content: center">
            <div class="card-header">Allocate Raw Materials</div>
            <div class="card-body">
                <h4 class="card-title">Information allocated raw materials</h4>
                <p class="card-text">which food is needed for a particular event , how much quantities are needed, anything requested from suppliers</p>
                <a href="#" class="btn btn-light">Get the report</a>
            </div>
</
        </div>
                
            
            
            
    </body>
</html>
