<%-- 
    Document   : editrefresh
    Created on : Aug 5, 2018, 9:49:34 PM
    Author     : Sohan
--%>
<%@page import="menu.Refreshments,java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    th,td {
        padding: 40px;
    }
</style>

<title>Update</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ include file="Layouts/Styles.jsp" %>


<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <style>
  .fakeimg {
      height: 200px;
      background: #aaa;
  }
  </style>
  
  
  <script type="text/javascript">
      function formValidate(form) {
          var price = document.getElementById("res_price").value;
          
          var exp = /[0-9]/;
          if (price.toString().match(exp)) {
              return true;
          }
          else {
              alert("Please Enter Numbers Only.");
              return false;
          }

      }
      
  </script>



<body class="w3-light-grey">
 
<%@ include file="Layouts/Navigation.jsp" %>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">
    
    <%  String ref_id = request.getParameter("ref_id");
        ResultSet res = Refreshments.displayRefreshment(ref_id); 
    %>
    <form action="<%=request.getContextPath()%>/UpdateRefreshments" method="post" onsubmit="return formValidate()">
        <table>
            <% while (res.next()) { %>
            <tr>
                <td>Refreshment name</td>
                <td><input type="text" name="ref_name" value="<%=res.getString("R_name") %>"></td>
            </tr>
            <tr>
                <td>Ingredients</td>
                <td><textarea name="ingredients" cols="42"><%=res.getString("Ingredient") %></textarea></td>
            </tr>
            <tr>
                <td>Price</td>
                <td><input type="text" name="price" id="res_price" value="<%=res.getString("Price") %>"</td>
            </tr>
            <tr>
                <td><button type="submit" name="sub" class="btn btn-success">Submit</button></td>
            <input type="hidden" name="ref_id" value="<%=res.getString("R_id") %>">
            </tr>
            <% } %>
        </table>
    </form>
    
    
    <!-- Type your code Here -->

    <%@ include file="Layouts/Footer.jsp" %>
<!-- End page content -->
</div>

<%@ include file="Layouts/Scripts.jsp" %>
</body>
