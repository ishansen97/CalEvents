<%-- 
    Document   : toAllocate
    Created on : Oct 6, 2018, 10:45:06 PM
    Author     : User
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="facilities.allocation.Allocation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Facility</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="jquery-3.3.1.min.js"></script>
        <%@ include file="Layouts/Styles.jsp" %>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="jquery-3.3.1.min.js"></script>
    </head>

    <body class="w3-light-grey">
        <%@ include file="Layouts/Navigation.jsp" %>
        <div class="w3-main" style="margin-left:400px;margin-top:100px;">


            <table class="table">
                <thead>
                    <tr>
                        <th>Facility</th>
                        <th>Quantity Requested</th>
                        <th>Quantity Available</th>

                    </tr>
                </thead>
                <tbody>
                    <%
                        String evID = (String) session.getAttribute("eventsId");

                        Allocation retr = new Allocation();
                        ResultSet tobeAl = retr.fetch_to_allocate(evID);
                        while (tobeAl.next()) {
                    %>
                    <tr>
                        <td><%=tobeAl.getString("facility")%></td>
                        <td><%=tobeAl.getString("quantity")%></td>
                        <td><%=tobeAl.getString("availableQuantity")%></td>
                        <td><a href="finalAllocate.jsp?ID=<%=tobeAl.getString("itemID")%>&ids=<%=tobeAl.getString("id")%>&rq=<%=tobeAl.getString("quantity")%>&aq=<%=tobeAl.getString("availableQuantity")%>" class="btn btn-success">Allocate</a></td>
                        <td><input type="text" name="requestedQ" id="requestedQ"/></td>
                        <td><button class="btn btn-danger" onclick='window.top.location.href="request.jsp?nikanID=<%=tobeAl.getString("id")%>&itemid=<%=tobeAl.getString("itemID")%>&val=" + document.getElementById("requestedQ").value;'>Request</button></td>
                        <%}%>
                    </tr>
                </tbody>
            </table>



            <!-- End page content -->


            <%@ include file="Layouts/Scripts.jsp" %>
        </div>
        <%
            String message = (String) session.getAttribute("result");
            if(message!=null){
        %>
        <script type="text/javascript">
            var msg = "<%=message%>";
            alert(msg);
        </script><%
                session.removeAttribute("message");
                    }%>
    </body>
</html>