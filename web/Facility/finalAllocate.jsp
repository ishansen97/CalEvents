<%-- 
    Document   : finalAllocate
    Created on : Oct 5, 2018, 8:26:43 PM
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
            String eventID = request.getParameter("eventID");
            String item_ID = request.getParameter("item_ID");
            String item_Name = request.getParameter("itemName");
            String rq = request.getParameter("rq");
            String aq = request.getParameter("aq");
            int required = Integer.parseInt(rq);
            int available = Integer.parseInt(aq);
            Allocation all = new Allocation();
            
            all.inserttoAllocation(item_Name, required, eventID);
            
            if(required<=available){
            Facility fac = new Sounds();
            fac.reduceAvailableQuantity(required , item_ID);
                HttpSession sessionallocated = request.getSession();
                sessionallocated.setAttribute("result","done");
                sessionallocated.setAttribute("allocated_id", item_ID.toString());
                response.sendRedirect("allocated.jsp");
            }
            else{
                HttpSession sessionallocated = request.getSession();
                sessionallocated.setAttribute("result","Not Enough Quantity to Allocate.");
                response.sendRedirect("allocated.jsp");
            }
            
                
        
        %>
        <h1><%=eventID%></h1>
        <h1><%=item_ID%></h1>
        <h1><%=item_Name%></h1>
        <h1>Required : <%=rq%></h1>
        <h1>Available : <%=aq%></h1>
        
    </body>
</html>
