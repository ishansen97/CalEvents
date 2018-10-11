<%-- 
    Document   : updateRaw
    Created on : Aug 11, 2018, 1:39:48 PM
    Author     : Lini Eisha
--%>

<%@page import="KitchenJavaF.rawMaterials"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<title>Kitchen</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ include file="Layouts/Styles.jsp" %>

<body class="w3-light-grey">
 
<%@ include file="Layouts/Navigation.jsp" %>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">


    <% ResultSet res = rawMaterials.getRaw(); %>
    <table>
        <tr>
            <th>Raw Material Name </th>
            <th>Quantity </th>
            <th>Unit Price(in $) </th>
        </tr>
        <tr>
            <% while (res.next()) { %>
            <td><%=res.getString("name") %></td>
            <td><%=res.getString("Quantity") %></td>
            <td><%=res.getString("unit_price") %></td>
            <td><a href="hmmmm.jsp?raw_ID=<%=res.getString("R_id") %>">Edit</a></td>
            <td><a href="hmmmm.jsp?raw_ID=<%=res.getString("R_id") %>">Delete</a></td>
        </tr>
        <% } %>
    </table>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <%@ include file="Layouts/Footer.jsp" %>
<!-- End page content -->
</div>

<%@ include file="Layouts/Scripts.jsp" %>
</body>
</html>
