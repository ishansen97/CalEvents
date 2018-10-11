<%-- 
    Document   : UpdateAppertizer
    Created on : Aug 2, 2018, 1:10:18 PM
    Author     : Sohan
--%>
<%@page import="menu.MenuItems"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    th,td {
        padding: 40px;
    }
</style>

<title>Menu</title>
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



<body class="w3-light-grey">

    <%@ include file="Layouts/Navigation.jsp" %>

    <!-- !PAGE CONTENT! -->
    <div class="w3-main" style="margin-left:300px;margin-top:43px;">
        <%
            String query = request.getParameter("search_item");
            ResultSet res;
            if (query == null) {
                res = MenuItems.getItems();
            } else {
                res = MenuItems.searchItems(query);
            }
        %>
        <br>
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <div class='d-flex justify-content-between'>
                        <h2>Menu</h2>

                        <form>
                        <div>
                            <h4>Search</h4><input type="text" name="search_item"> 
<!--                            <a class='btn btn-primary' href='./add_item.jsp'></a>-->
                        </div>
                        </form>
                    </div>
                </div>    
                <table class="table table-striped table-bordered">
                    <thead class="thead-dark">
                        <tr>
                            <th class='text-center' width='5%'>Id</th>
                            <th>Item Name</th>
                            <th width='40%'>Ingredients</th>
                            <th class='text-center' width='10%'>Price</th>
                            <th>Category</th>
                            <th class='text-center' width='15%'></th>
                        </tr>
                    </thead>
                    <tr>
                        <% while (res.next()) {%>
                        <td class='text-center'><%=res.getInt("item_id")%></td>
                        <td><%=res.getString("name")%></td>
                        <td><%=res.getString("ingredients")%></td>
                        <td class='text-center'>$<%= String.format("%.2f", res.getDouble("price"))%></td>
                        <td><%=res.getString("category")%></td>
                        <td class='text-center'>
                            <a href="edit_item.jsp?id=<%=res.getInt("item_id")%>" class="btn btn-sm btn-secondary">Edit</a>
                            <a href="delete_item.jsp?id=<%=res.getInt("item_id")%>" class="btn btn-sm btn-danger">Delete</a>
                        </td>
                    </tr>
                    <% }%>
                </table>

            </div>
        </div>

        <!-- Type your code Here -->

        <%@ include file="Layouts/Footer.jsp" %>
        <!-- End page content -->
    </div>

    <%@ include file="Layouts/Scripts.jsp" %>
</body>
