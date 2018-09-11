<%-- 
    Document   : adminPanal
    Created on : Aug 31, 2018, 10:12:02 PM
    Author     : Lini Eisha
--%>

 
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.persistence.criteria.Fetch"%>
<%@page import="test.fetch"%>
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
    
    
    
    
    <style>
.button {
    background-color:#009688;
    border: none;
    color: white;
    padding: 10px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: px;
    margin: 5px 7px;
    cursor: pointer;
    align-items: right;
}
</style>

           <div>
    <center><h1 style="color:#10707f" > KITCHEN ADMIN </h1></center>
    </div>
    <hr><hr>
    
       <div>
    <center><h1 style="color:#10707f" >Raw Materials </h1></center>
    </div>
    
      
            <div class="col-sm-6">
                <table class="table" border="5" width="35%" cellspacing="2" >
                     <thead class="thead-dark">
                        <tr>
                            <th>Raw Materials Name</th>
                            <th>Quantity</th>
                            <th>Quantity Type</th>
                            <th>Unit Price</th>
                            
                        </tr>
                    </thead>

                    <tbody>

                        <%
                            fetch name = new fetch();
                            ResultSet data1 = name.fetchData();
                        %>

                        <%while (data1.next()) {%>
                        <tr>
                            <td><%=data1.getString("name")%></td>
                            <td><%=data1.getString("quantity")%></td>
                            <td><%=data1.getString("qType")%></td>
                            <td style="text-align:right;"><%=data1.getDouble("unit_price")%></td>
                            <%}%>
                        </tr>
                    </tbody>
                </table>
            </div>
   





</div>

</body>
</html>