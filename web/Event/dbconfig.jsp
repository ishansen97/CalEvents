<%-- 
    Document   : dbconfig
    Created on : Jun 29, 2018, 9:31:36 AM
    Author     : DELL
--%>

<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String url = "jdbc:mysql://localhost:3306/calevents";
           String user = "root";
           String pass = "";
           
           Class.forName("com.mysql.jdbc.Driver");
           
           Connection con = DriverManager.getConnection(url, user, pass);
           
           if (con != null)
              out.println("connected");
           else
              out.println("not connected");%>
    </body>
</html>
