<%-- 
    Document   : updateRaw
    Created on : Oct 1, 2018, 12:40:00 AM
    Author     : Lini Eisha
--%>

<%@page import="test.fetch"%>
<%@page import="test.Raw_Materials"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        
<form action="../update" method="POST">
        <% 
        
            String rawID = request.getParameter("raw_ID");
            String test = "";
            fetch fetchupd = new fetch();
            ResultSet rawupd = fetchupd.getRawbyID(rawID);
       
                
        %>
        
        <div> 
        <form>
            
            <h3>Update</h3>
        
            
        </form>
        </div>