<%-- 
    Document   : request
    Created on : Oct 7, 2018, 12:32:35 AM
    Author     : User
--%>

<%@page import="facilities.allocation.Allocation"%>
<%@page import="facilities.event.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String item_ID = request.getParameter("itemid").toString();
            String valueQ = request.getParameter("val").toString();
            String allID = request.getParameter("nikanID").toString();
            int idRIF = Integer.parseInt(allID);
            int value = Integer.parseInt(valueQ);
            Facility facReq = new Sounds();
            Allocation allreq = new Allocation();
            try {

                if (facReq.incrementAvailableQuantity(value, item_ID) && allreq.setAvailablesQ(idRIF, value)) {
                    HttpSession sessionallocated = request.getSession();
                    sessionallocated.setAttribute("result", "Quantity Added");
                    response.sendRedirect("toAllocate.jsp");
                }
            } catch (Exception e) {
                out.print("Exception " + e);
            }
        %>

    </body>
</html>
