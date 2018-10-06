<%-- 
    Document   : Menu_Overview
    Created on : Sep 19, 2018, 2:05:04 PM
    Author     : Sohan
--%>
<%@page import="java.sql.*, menu.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Menu Report</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <%@ include file="./Layouts/Styles.jsp" %>
        <%@ include file="./Layouts/Navigation.jsp" %>
        <script src="./Layouts/canvasjs.js"></script>
        <script>
            function validationCategory() {
                var category = document.getElementById("category").value;
                var report_name = document.getElementById("report_name").value;

                if (category === "" || report_name === "") {
                    alert("Please select a category");
                    return false;
                } else {
                    return true;
                }
            }
        </script>
    </head>

    <body class="w3-main">
        <% ResultSet categories = MenuItems.getAllCategories();%>

        <div class="container" style="margin-top: 50px; margin-left: 300px">
            <div class="row">
                <div class="col-12">
                    <h1 class="modal-title text-primary">Menu Reports Page</h1>
                    <hr>
                    <br>
                </div>
            </div>
            <div class="row">
                <div class="card-group col-5">
                    <div class="card" style="margin-right: 20px" >
                        <div class="card-header">
                            <h4 class="card-title mb-0">Menu Categories</h4>
                        </div>
                        <div class="card-body">
                            <form action="<%=request.getContextPath()%>/Report_Servlet" method="POST" onsubmit="return validationCategory()">
                                <div class="form-group">
                                    <label>Select category</label>
                                    <select class="form-control" name="menu_category" id="category">
                                        <option value="" ></option>
                                        <% while (categories.next()) {%>
                                        <option value="<%=categories.getString("category")%>"><%=categories.getString("category")%></option>
                                        <% }%>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label>Name of the report</label>
                                    <input class="form-control" type="text" name="report_name" value=" ">
                                </div>

                                <button type="submit" class="btn btn-success">Create Report</button>
                            </form>
                        </div>

                    </div>                                                                         
                </div>                                    

            </div>
        </div>
    </div>

    <br>
    <br>
    <%@ include file="Layouts/Footer.jsp" %>
    <!-- End page content -->


    <%@ include file="Layouts/Scripts.jsp" %>
</body>