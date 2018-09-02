<%-- 
    Document   : removeRaw
    Created on : Sep 2, 2018, 1:30:07 PM
    Author     : Lini Eisha
--%>

<%@page import="test.Raw_Materials"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
              <%  String name = request.getParameter("name");
                  Raw_Materials raw = new Raw_Materials();
                  
                  if(raw.removeRaw(name).toString().equals("Record Removed")) {
                      response.sendRedirect("remove.jsp");
                  }
                  else {
                      out.println("Error");
                  }
                      %>
        
               
           
    </body>
</html>