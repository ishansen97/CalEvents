<%-- 
    Document   : Allocatetheef
    Created on : Sep 30, 2018, 9:14:16 PM
    Author     : User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="facilities.allocation.Allocation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%  String something = request.getParameter("required_facility");
         String type="";
               if(something.startsWith("L") || something.startsWith("D")){
                type = "l";  
               }
               else if(something.startsWith("Te")){
                   type = "t";
               }
               else if(something.startsWith("M")){
                   type = "l";
               }
               else if(something.startsWith("C")){
                   type = "c";
               }
               Allocation allocate = new Allocation(type);
               allocate.find_facility_view(type);
               ResultSet facilities = allocate.fetch_available_facilities();
               
               
              %>
              
              <h3 class="alert alert-dark">Allocate <%=something%>   </h3>
              <table class="table table-hover">
                  <thead>
                      <tr>
                          <th>facilities</th>
                          <th>Available Quantity</th>
                      </tr>
                  </thead>
                  <tbody>
                      <tr><%while(facilities.next()){%>
                          <td><%=facilities.getString("facilitiyName")%></td>
                          <td><%=facilities.getString("availableQuantity")%></td>
                          <td><input type="text" id="quantityToAllocate" name="quantityToAllocate" value=""/></td>
                          <td><button>Allocate</button></td>
                      </tr><%}%>
                     
                  </tbody>
              </table>

    </body>
</html>
