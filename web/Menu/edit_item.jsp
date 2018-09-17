<%-- 
    Document   : editapp
    Created on : Aug 2, 2018, 1:53:15 PM
    Author     : Sohan
--%>

<%@page import="menu.MenuItems,java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
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

</head>
<body class="w3-light-grey">

    <%@ include file="Layouts/Navigation.jsp" %>
    <!-- !PAGE CONTENT! -->
    <div class="w3-main" style="margin-left:300px;margin-top:43px;">

        <%  String item_id = request.getParameter("id");
            ResultSet res = MenuItems.displayItem(item_id);
            while (res.next()) {
        %>
        <br>
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Update Item #<%= res.getString("item_id")%></h3>
                    <hr>
                    <form name="item_form" method="post" action="<%=request.getContextPath()%>/UpdateMenuItem" onsubmit="return formValidate()">
                        <div class="form-row">
                            <input hidden name="item_id" value="<%= res.getString("item_id")%>">
                            <div class="col-md-7 form-group">
                                <label class="text-muted">Name</label>
                                <input value="<%=res.getString("name")%>" type="text" class="form-control" placeholder="Item Name " name="item_name" required>
                            </div>
                            <div class="col-md-5 form-group">
                                <% String selCat = res.getString("category"); %>
                                <label class="text-muted">Category</label>
                                <select class="form-control" name="item_category" required>
                                    <option value="Appetizer" <% if (selCat.equals("Appetizer")) {
                                            out.print("selected");
                                        } %> >Appetizer</option>
                                    <option value="Main Dish" <% if (selCat.equals("Main Dish")) {
                                            out.print("selected");
                                        } %> >Main Dish</option>
                                    <option value="Dessert" <% if (selCat.equals("Dessert")) {
                                            out.print("selected");
                                        } %> >Dessert</option>
                                    <option value="Refreshment" <% if (selCat.equals("Refreshment")) {
                                            out.print("selected");
                                        }%> >Refreshment</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-7 form-group">
                                <label>Ingredients</label>
                                <input value="<%=res.getString("ingredients")%>" type="text" class="form-control" placeholder="Ingredients" name="item_ingredients" required>
                            </div>  

                            <div class="col-md-5 form-group">
                                <label>Price</label>
                                <div class="input-group">
                                    <div class="input-group-prepend"><span class="input-group-text">$</span></div>
                                    <input value="<%=res.getDouble("price")%>" type="text" class="form-control" placeholder="Price" name="item_price" required>
                                </div>
                            </div> 
                        </div>
                        <div class="form-row">
                            <div class="col-md-6">
                                <button type="submit" class="btn btn-primary">Update</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <% }%>
        <!-- Type your code Here -->

        <%@ include file="Layouts/Footer.jsp" %>
        <!-- End page content -->
    </div>

    <%@ include file="Layouts/Scripts.jsp" %>
</body>
