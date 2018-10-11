<%-- 
    Document   : editapp
    Created on : Aug 2, 2018, 1:53:15 PM
    Author     : Sohan
--%>

<%@page import="menu.MenuItems,java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>Menu - Update Item</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="Layouts/Styles.jsp" %>
<style>
    .fakeimg {
        height: 200px;
        background: #aaa;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="Layouts/validation.js" type="text/javascript"></script>
<script type="text/javascript">
    function getSelectedItems() {
        console.log("Selected");
        var selectedItems = [];
        $(".menu-item-check:checked").each(function (e) {
            selectedItems.push(this.id);
        })
        if (selectedItems.length < 1) {
            alert("Please select at least 1 item!");
        } else {
            $("#menu_form_items").val(selectedItems.join(", "))
            return true;
        }
        return false;
    }
</script>

<body class="w3-light-grey">

    <%@ include file="Layouts/Navigation.jsp" %>
    <!-- !PAGE CONTENT! -->
    <div class="w3-main" style="margin-left:300px;margin-top:43px;">
        <br>
        <%
            ResultSet categories = MenuItems.getAllCategories();

        %>
        <div class="container" >
            <div class="card bg-light">
                <div class="card-body">
                    <h3 class="card-title">Create Menu</h3>
                    <hr>
                    <div class="d-flex flex-wrap flex-column justify-content-between">
                        <!--CATEGORY START-->
                        <% while (categories.next()) {
                                String category = categories.getString("category");
                                ResultSet item = MenuItems.getItemsByCategory(category);
                        %>
                        <div class="menu-category">
                            <h5 class="mb-2 text-muted"><%= category%></h5>
                            <% while (item.next()) {%>
                            <input id="<%=item.getString("item_id")%>" vaule="<%=item.getString("item_id")%>" class="menu-item-check" type="checkbox" hidden>
                            <label for="<%=item.getString("item_id")%>" class="menu-item">
                                <div class="menu-item-img">
                                    <img src="" alt=""/>
                                    <i class="menu-item-checked-icon fa fa-check-circle"></i>
                                </div>
                                <div class="menu-item-description">
                                    <h6 class="menu-item-title"><%=item.getString("name")%> <small class="badge badge-info">#<%=item.getString("item_id")%></small></h6>
                                    <p class="menu-item-ingredients text-muted"><%=item.getString("ingredients")%></p>
                                </div>
                                <div class="menu-item-select">
                                    <h5>$<%= String.format("%.2f", item.getDouble("price"))%></h5>
                                </div>
                            </label>
                            <% }%>
                        </div>
                        <% }%>
                        <!--CATEGORY END-->
                        <form class="form row justify-content-center" method="POST" action="<%=request.getContextPath()%>/CreateMenu" onsubmit="return getSelectedItems()">
                            <div class="input-group col-6">
                                <input class="form-control" name="menu_name" type="text" placeholder="Menu name" required>
                                <div clas="input-group-append">                                   
                                    <button class="form-control btn btn-primary" type="submit">Create menu</button>  
                                    <input id="menu_form_items" name="menu_items" type="text" hidden>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="Layouts/Footer.jsp" %>
        <!-- End page content -->
    </div>
    <%@ include file="Layouts/Scripts.jsp" %>
</body>
