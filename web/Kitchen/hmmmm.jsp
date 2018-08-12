<%-- 
    Document   : hmmmm
    Created on : Aug 11, 2018, 1:42:37 PM
    Author     : Lini Eisha
--%>

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

    
    
    <%  String r_id = request.getParameter("r_id");
        ResultSet res = rawMaterials.display_raw(r_id); 
    %>
    <form action="<%=request.getContextPath() %>/updateRawServ" method="post">
        <table>
            <% while (res.next()) { %>
            <tr>
                <td>Raw Material Name name</td>
                <td><input type="text" name="name" value="<%=res.getString("name") %>"></td>
            </tr>
            <tr>
                <td>Quantity</td>
                <td><input name="qantity" cols="42"><%=res.getString("quantity") %></td>
            </tr>
            <tr>
                <td>Unit Price</td>
                <td><input type="text" name="price" value="<%=res.getString("unit_price") %>"</td>
            </tr>
            <tr>
                <td><button type="submit" name="submit" class="btn btn-success">Submit</button></td>
            <input type="hidden" name="r_id" value="<%=res.getString("R_id") %>">
            </tr>
            <% } %>
        </table>
    </form>
    
    
    
    
    
    
    
    
    
    
    
    
    

    <%@ include file="Layouts/Footer.jsp" %>
<!-- End page content -->
</div>

<%@ include file="Layouts/Scripts.jsp" %>
</body>
</html>
