<%-- 
    Document   : deleteRaw
    Created on : Aug 12, 2018, 1:05:55 AM
    Author     : Lini Eisha
--%>

<%@page import="KitchenJavaF.rawMaterials"%>
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

            
            <% String id = request.getParameter("r_id");
           
           if (rawMaterials.isDeleted_raw(id)) {
        %>
        <script>
            alert("Your record has been successfully deleted");
        </script>
        <%@include file="updateRaw.jsp" %> 
        <% }else
            out.println("sorry your record cannot be deleted");
        %>
    
    
    
    
    
    
    
    
    
    
    
    <%@ include file="Layouts/Footer.jsp" %>
<!-- End page content -->
</div>

<%@ include file="Layouts/Scripts.jsp" %>
</body>
</html>