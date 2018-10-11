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
        <script src="../External/Jquery/jquery.min.js" type="text/javascript"></script>



    </head>

    <script>

    </script>
    <body class="w3-grey">
        <br>
        <br>
        <%
            ResultSet categories = MenuItems.getAllCategories();

        %>
        <div class="container" >
            <form method="POST" action="<%=request.getContextPath()%>/CustomerMenuCreate">
                <div class="card bg-light">
                    <div class="card-body">
                        <h4 class="card-title">Select your menu!</h4>
                        <div class="d-flex flex-wrap flex-row justify-content-between">
                            <!--CATEGORY START-->
                            <% while (categories.next()) {
                                    String category = categories.getString("category");
                                    ResultSet item = MenuItems.getItemsByCategory(category);
                            %>
                            <div class="menu-category">
                                <h5 class="mb-2 text-muted"><%= category%></h5>
                                <% while (item.next()) {%>
                                <input id="<%=item.getString("item_id")%>" data-price="<%= String.format("%.2f", item.getDouble("price"))%>" name="menuItem" value="<%=item.getString("item_id")%>" class="menu-item-check" type="checkbox" hidden>
                                <label for="<%=item.getString("item_id")%>" class="menu-item">
                                    <div class="menu-item-img">
                                        <img src="" alt=""/>
                                        <i class="menu-item-checked-icon fa fa-check-circle"></i>
                                    </div>
                                    <div class="menu-item-description">
                                        <h6 class="menu-item-title"><%=item.getString("name")%></h6>
                                        <p class="menu-item-ingredients text-muted"><%=item.getString("ingredients")%></p>
                                    </div>
                                    <div class="menu-item-select" >
                                        <h5>$<span class="menu-item-price"><%= String.format("%.2f", item.getDouble("price"))%></span></h5>
                                    </div>
                                </label>
                                <% }%>
                            </div>
                            <% }%>
                            <!--CATEGORY END-->
                        </div>
                        <hr>
                        <div class="row text-right">
                            <div class="col-12">
                                <h5 class="text-danger" id="itemPriceNone">No items are selected</h5>
                                <h5 id="itemPriceDisplay">Total (<i>per person</i>): $<span id="itemsTotal">0.00</span></h5>
                            </div>
                        </div>
                    </div>                
                    <button id="submitButton" class="btn btn-primary" type="sumbit" onclick="showSummary()">Submit</button>
                </div>
            </form>
        </div>
        <script type="text/javascript">
            var prices = [];
            var pricesShown = false;

            function hidePrices() {
                $("#itemPriceNone").show();
                $("#itemPriceDisplay").hide();
                $("#submitButton").attr("disabled", "disabled");
                pricesShown = false;
            }

            function showPrices() {
                $("#itemPriceNone").hide();
                $("#itemPriceDisplay").show();
                $("#submitButton").removeAttr("disabled");
                pricesShown = true;
            }

            hidePrices();

            // function call when items are selected
            $(".menu-item-check").change(function () {
                var sum = 0;

                // get the price of the items (stored in the input)
                var price = $(this).attr('data-price');

                // if item got selected add it's price to the total
                if (this.checked) {
                    prices.push(price);
                    console.log(prices);
                    // else remove it
                } else {
                    prices.splice($.inArray(price, prices), 1);
                }

                // if any items are selected get the total
                if (prices.length > 0) {
                    // get the sum of the prices array
                    $.each(prices, function (i, val) {
                        sum += Number.parseFloat(val);
                    });
                    // show price
                    $("#itemsTotal").html(Number(sum).toFixed(2));

                    // if the prices container was hidden, show it
                    if (pricesShown == false) {
                        showPrices();
                    }
                } else {
                    // if no items were selected hide the total
                    hidePrices();
                }

            });
        </script>
    </body>
</html>
