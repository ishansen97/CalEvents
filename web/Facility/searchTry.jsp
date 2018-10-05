<%-- 
    Document   : searchTry
    Created on : Oct 6, 2018, 12:52:58 AM
    Author     : User
--%>

<%@page import="java.sql.Connection"%>
<%@page import="facilities.event.DBConnect"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <form action="" method="get">
            <input class="form-control" type="text" name="search" id="search" placeholder="Search for facilities"/>
        </form>
        <%
            Statement stat = null;
            ResultSet res = null;
            DBConnect dbcon = DBConnect.getInstance();
            if(dbcon.isConnected()){
                Connection conn = dbcon.getCon();
                stat = conn.createStatement();
                String query = request.getParameter("search");
                String data ;
                if(query!=null){
                    data = "SELECT * FROM `facilities` WHERE `facilityType` like '%"+query+"%' or `facilitiyName` like '%"+query+"%'";
                }
                else{
                    data = "SELECT * FROM `facilities`";
                }
                res = stat.executeQuery(data);
                
            }
            while (res.next()){
        %>
        <h4><%=res.getString("facilitiyName")%></h4>
        <%}%>
        
    </body>
</html>
