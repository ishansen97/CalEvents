<%-- 
    Document   : UpdateAppertizer
    Created on : Aug 2, 2018, 1:10:18 PM
    Author     : Sohan
--%>
<%@page import="menu.Menu"%>
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

<script>
    function displayMenu(id) {
        var menu_id = document.getElementById(id).value;
        
        $.get("viewCreatedMenu.jsp", {id : menu_id}, function(data) {
            $("#demo").html(data);
        });
    }
</script>



<body class="w3-light-grey">

    <%@ include file="Layouts/Navigation.jsp" %>

    <!-- !PAGE CONTENT! -->
    <div class="w3-main" style="margin-left:300px;margin-top:43px;">
        <% ResultSet res = Menu.getAllMenus(); %>
        <br>
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <div class='d-flex justify-content-between'>
                        <h2>Available menus</h2>
                        <!--<button class="align-right"><h3> Remove </h3></button>-->
                        <div>
                            <a class='btn btn-danger' href='./create_menu.jsp'>Add menu</a>
                        </div>
                    </div>
                    <hr>
                    <div>
                        <% while (res.next()) { %>
                        <button class="btn btn-outline-primary"  id="<%=res.getString("menu_id") %>" value="<%=res.getString("menu_id") %>" onclick="displayMenu(this.id)">
                            <%= res.getString("menu_name") %>
                        </button>
                        <% } %>
                    </div>
                </div>    
            </div>
                    <div id="demo"></div>
        </div>

        <!-- Type your code Here -->

        <%@ include file="Layouts/Footer.jsp" %>
        <!-- End page content -->
    </div>

    <%@ include file="Layouts/Scripts.jsp" %>
</body>
