<%-- 
    Document   : insertIngQuantity
    Created on : Oct 5, 2018, 12:56:25 AM
    Author     : Lini Eisha
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="test.fetch"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="../QInsert" method="POST">
        <% 
        
            String menuID = request.getParameter("menue_ID");
            String test = "";
            fetch fetchIns = new fetch();
            ResultSet itemIns = fetchIns.getFoodbyID(menuID);
            while(itemIns.next()){
                test = itemIns.getString("ingredients");
                String[] arr = test.split(",");
                
                
        %>
        <center><h3 class="alert alert-info"><%=itemIns.getString("name")%></h3></center>
        <hr>
        <%for(int i = 0 ; i  < arr.length ; i++){%>
        <h3><%=arr[i]%></h3><input type="text" name="ingQuantity" id="ingQ" placeholder="Quantity"/>
        <input type="hidden" name="rawName" id="rawName" value="<%=arr[i]%>"/>
        <%}}%>
        <center><button class="btn btn-success" type="submit">Insert</button></center>
        </form>
    </body>
</html>
