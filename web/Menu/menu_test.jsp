<%-- 
    Document   : menu_test
    Created on : Sep 6, 2018, 1:41:04 PM
    Author     : Sohan
--%>
<%@page import="java.sql.*, menu.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Menu</title>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <%@ include file="Layouts/Styles.jsp" %>
        <style>
            body {
                font-size: 16pt;
            }
            .menu-item-check:checked + .menu-item {
                box-shadow: 0 0 5px #007bff !important;
            }
            .menu-item-check:checked + .menu-item .menu-item-checked-icon {
                visibility: visible;
            }
            .menu-item:hover {
                background: rgb(245,245,245) !important;
            }
            .menu-category {
                padding: 0.75em;
                flex-grow: 1;
            }
            .menu-item {
                height: 5em;
                overflow: hidden;
                background-color: #fff;
                background-clip: border-box;
                border: 1px solid rgba(0,0,0,.125);
                border-radius: .25rem;
                display: flex;
                flex-direction: row;
                min-width: 350px;
                flex-grow: 1;
                cursor: pointer;
            }
            .menu-item-img {
                width: 5em;
                height: 5em;
                flex-grow: 0;
                flex-shrink: 0;
                background: gray;
                overflow: hidden;
                display: flex;
                justify-content: center;
                align-items: center;
                align-content: stretch;
                position: relative;

            }
            .menu-item-img img {
                height: 100%;
                width: auto;
                position: absolute;
            }
            .menu-item-checked-icon {
                z-index: 2;
                text-shadow: 0 0 2px black;
                color: white;
                visibility: hidden;
            }
            .menu-item-description {
                flex-grow: 1;
                padding: 0.75em;
            }
            .menu-item-title {
                margin-bottom: 0.45em;
                font-weight: bold;
            }
            .menu-item-ingredients {
                font-size: 80%;
                line-height: 1.15em;
            }
            .menu-item-select {
                display: flex;
                padding: 0.5em;
                justify-content:  center;
                align-items: center;
            }

        </style>
    </head>
    <body>
        <br>
        <br>
        <%
            ResultSet apt = Appertizer.getApperizer();
            ResultSet des = Deserts.getDeserts();
            ResultSet dish = MainDish.getMainDish();
            ResultSet refr = Refreshments.getRefreshment();
        %>
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Select your menu!</h4>
                    <div class="d-flex flex-wrap flex-row justify-content-between">
                        <!--CATEGORY START-->
                        <div class="menu-category">
                            <h5 class="mb-2 text-muted">Appetizers</h5>
                            <% while (apt.next()) {%>
                            <input id="<%=apt.getString("A_id")%>" vaule="<%=apt.getString("A_name")%>" class="menu-item-check" type="checkbox" hidden>
                            <label for="<%=apt.getString("A_id")%>" class="menu-item">
                                <div class="menu-item-img">
                                    <img src="" alt=""/>
                                    <i class="menu-item-checked-icon fa fa-check-circle"></i>
                                </div>
                                <div class="menu-item-description">
                                    <h6 class="menu-item-title"><%=apt.getString("A_name")%></h6>
                                    <p class="menu-item-ingredients text-muted"><%=apt.getString("Ingredient")%></p>
                                </div>
                                <div class="menu-item-select">
                                    <h5>$<%= String.format("%.2f", apt.getDouble("Price"))%></h5>
                                </div>
                            </label>
                            <% }%>
                        </div>
                        <!--CATEGORY END-->
                        <!--CATEGORY START-->
                        <div class="menu-category">
                            <h5 class="mb-2 text-muted">Main Dish</h5>
                            <% while (dish.next()) {%>
                            <input id="<%=dish.getString("Md_id")%>" vaule="<%=dish.getString("Md_name")%>" class="menu-item-check" type="checkbox" hidden>
                            <label for="<%=dish.getString("Md_id")%>" class="menu-item">
                                <div class="menu-item-img">
                                    <img src="" alt=""/>
                                    <i class="menu-item-checked-icon fa fa-check-circle"></i>
                                </div>
                                <div class="menu-item-description">
                                    <h6 class="menu-item-title"><%=dish.getString("Md_name")%></h6>
                                    <p class="menu-item-ingredients text-muted"><%=dish.getString("Ingredient")%></p>
                                </div>
                                <div class="menu-item-select">
                                    <h5>$<%= String.format("%.2f", dish.getDouble("Price"))%></h5>
                                </div>
                            </label>
                            <% }%>
                        </div>
                        <!--CATEGORY END-->
                        <!--CATEGORY START-->
                        <div class="menu-category">
                            <h5 class="mb-2 text-muted">Desserts</h5>
                            <% while (des.next()) {%>
                            <input id="<%=des.getString("D_id")%>" vaule="<%=des.getString("D_name")%>" class="menu-item-check" type="checkbox" hidden>
                            <label for="<%=des.getString("D_id")%>" class="menu-item">
                                <div class="menu-item-img">
                                    <img src="" alt=""/>
                                    <i class="menu-item-checked-icon fa fa-check-circle"></i>
                                </div>
                                <div class="menu-item-description">
                                    <h6 class="menu-item-title"><%=des.getString("D_name")%></h6>
                                    <p class="menu-item-ingredients text-muted"><%=des.getString("Ingredient")%></p>
                                </div>
                                <div class="menu-item-select">
                                    <h5>$<%= String.format("%.2f", des.getDouble("Price"))%></h5>
                                </div>
                            </label>
                            <% }%>
                        </div>
                        <!--CATEGORY END-->
                        <!--CATEGORY START-->
                        <div class="menu-category">
                            <h5 class="mb-2 text-muted">Refreshments</h5>
                            <% while (refr.next()) {%>
                            <input id="<%=refr.getString("R_id")%>" vaule="<%=refr.getString("R_name")%>" class="menu-item-check" type="checkbox" hidden>
                            <label for="<%=refr.getString("R_id")%>" class="menu-item">
                                <div class="menu-item-img">
                                    <img src="" alt=""/>
                                    <i class="menu-item-checked-icon fa fa-check-circle"></i>
                                </div>
                                <div class="menu-item-description">
                                    <h6 class="menu-item-title"><%=refr.getString("R_name")%></h6>
                                    <p class="menu-item-ingredients text-muted"><%=refr.getString("Ingredient")%></p>
                                </div>
                                <div class="menu-item-select">
                                    <h5>$<%= String.format("%.2f", refr.getDouble("Price"))%></h5>
                                </div>
                            </label>
                            <% }%>
                        </div>
                        <!--CATEGORY END-->
                    </div>
                </div>
                </body>
                </html>
