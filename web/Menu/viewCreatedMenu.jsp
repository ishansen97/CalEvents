<%-- 
    Document   : viewCreatedMenu
    Created on : Sep 11, 2018, 10:12:55 AM
    Author     : Sohan
--%>
<%@page import="java.sql.*, menu.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        String menuId = request.getParameter("id");
        ResultSet item = Menu.getMenuDetails(menuId);
    %>
    <br>
    <form name="menu-<%= menuId %>" action="<%=request.getContextPath()%>/DeleteCreatedMenu" method="POST">
        <div class="card bg-light">
            <div class="card-body">
                <h4 class="card-title">Menu #<%= menuId%></h4>
                <div class="d-flex flex-wrap flex-row justify-content-between">
                    <!--CATEGORY START-->
                    <div class="menu-category">
                        <!--<h5 class="mb-2 text-muted"></h5>-->
                        <% while (item.next()) {%>
                        <!--<input id="<%=item.getString("item_id")%>" vaule="<%=item.getString("item_id")%>" class="menu-item-check" type="checkbox" hidden>-->
                        <label for="<%=item.getString("item_id")%>" class="menu-item">
                            <div class="menu-item-img">
                                <img src="" alt=""/>
                                <!--                                    <i class="menu-item-checked-icon fa fa-check-circle"></i>-->
                            </div>
                            <div class="menu-item-description">
                                <h6 class="menu-item-title"><%=item.getString("name")%></h6>
                                <p class="menu-item-ingredients text-muted"><%=item.getString("ingredients")%></p>
                            </div>
                            <div class="menu-item-select flex-column text-right justify-content-end align-content-end">
                                <h6>$<%= String.format("%.2f", item.getDouble("price"))%></h6>
                                <span class="text-muted"><%= item.getString("category")%></span>
                            </div>
                        </label>
                        <% }%>
                    </div>
                    <!--CATEGORY END-->
                </div>
            </div>
            <input name="menuId" value="<%= menuId%>" hidden>
            <button class="btn btn-danger">Delete Menu</button>
        </div>
    </form>
</html>
