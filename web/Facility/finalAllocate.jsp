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
//            String eventID = request.getParameter("eventID");
            String item_ID = request.getParameter("ID");
            String idStr = request.getParameter("ids");
//            String item_Name = request.getParameter("itemName");
            String rq = request.getParameter("rq");
            String aq = request.getParameter("aq");
            int required = Integer.parseInt(rq);
            int available = Integer.parseInt(aq);
            int id = Integer.parseInt(idStr);
//            
            try {
                Allocation all = new Allocation();
                Facility fac = new Sounds();
//            
                if (required <= available) {
                    fac.reduceAvailableQuantity(required, item_ID);
                    Allocation allted = new Allocation();
                    if (allted.setAllocated(id)) {

                        HttpSession sessionallocated = request.getSession();
                        sessionallocated.setAttribute("result", "done");
                        response.sendRedirect("toAllocate.jsp");

                }
                    } else {
                        HttpSession sessionallocatedE = request.getSession();
                        sessionallocatedE.setAttribute("result", "Not Enough Quantity to Allocate. Try to Request!");
                        response.sendRedirect("toAllocate.jsp");
                    }
            } catch (Exception e) {
                   out.print("Exception");
            }


        %>
<!--        <h1><%=item_ID%></h1>
        <h1>Required : <%=rq%></h1>
        <h1>Available : <%=aq%></h1>-->

    </body>
</html>