<%@page import="menu.MenuItems"%>
<%@page import="java.sql.*, Event.*" %>
<!DOCTYPE html>
<html>
    <title>Event</title>
    <meta charset="UTF-8">
    <meta    name="viewport" content="width=device-width, initial-scale=1">
    <script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>



    <script>
        function date_validate() {
            var date = document.getElementById("st_date").value;
            var time1 = document.getElementById("st_STime").value;
            var time2 = document.getElementById("ed_Time").value;

            var ev_date = new Date(date);
            var cur_date = new Date();
            var start_time = new Date(time1);
            var end_time = new Date(time2);

            if (ev_date.getTime() < cur_date.getTime()) {
                alert("enter a day after current date");
                return false;
            } else
                return true;

            //  if(start_time.getHours() > end_time.getHours()) {
            //  alert("srart time should be less than end time");
            //    return false;
            //  }
            //    else
            //        return true;
        }
        function time_validate() {
            var date = document.getElementById("st_date").value;
            var time1 = document.getElementById("st_STime").value;
            var time2 = document.getElementById("ed_Time").value;

            var strtime1 = time1.toString();
            var strtime2 = time2.toString();

            var start_arr = strtime1.split(":");

            var ev_date = new Date(date);
            var cur_date = new Date();
            var start_time = new Date(time1);
            var end_time = new Date(time2);

            if (time1 > time2) {
                alert("start time should be less than end time");
                return false;
            } else {
                //alert("start_time " + time1);
                return true;
            }
        }


        function validation() {
            var time_validation = time_validate();
            var date_validation = date_validate();

            if (time_validation == true)
            {
                if (date_validation == true)
                {
                    return true;
                } else
                {
                    return false;
                }
            } else
            {
                return false;
            }

            //alert(time_validation);
            alert(date_validation);

            // return false;

            //return time_validation && date_validation;
        }
                   function itemDemo() {
                document.getElementById("event").value = "Birthday Party";
                document.getElementById("name").value = "Uditha Silva";
                document.getElementById("phone").value = "0777846511";
                document.getElementById("email").value = "abishaanr99@gmail.com";
                document.getElementById("loc").value = "H001";
                document.getElementById("crowd").value = "100";
                
                
                
                
                
//                document.getElementById("start").value = "2018-10-20";
//                document.getElementById("start_time").value = "02:00:00";
//                document.getElementById("end_time").value = "05:00:00";
//                
                       }
    </script>
    <style>
        .formField
        {
            width:200%;
            height:auto;
        }

        .formField input[type=text],.formField input[type=time],.formField input[type=date]
        {
            width:100%;
            margin:2px;
            border-radius:10px;
            outline:none;
            font-size:18px;
            font-family: Calibri;
            border:1px solid black;
            padding:5px;
            background: transparent;
        }
        .formField input[type=submit]
        {
            margin-left: 100%;
            width:50%;
            font-size:18px;
            padding:5px;
            border:2px solid dimgrey;
            background: whitesmoke;
            outline:none;
            border-radius:5px;
            font-family: Calibri;
            margin:5px;
            color:dimgray;
            transition-duration: 0.5s;
        }

        .formField input[type=submit]:hover
        {
            background: dimgray;
            color:white;
            border-radius:10px;
        }
    </style>

    <%@ include file="Layouts/Styles.jsp" %>

    <body class="w3-light-grey">

        <%@ include file="Layouts/Navigation.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">


            <div class="container-fluid"  style="padding-top:22px">
                <!-- Breadcrumbs-->
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="Dashboard">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item active">Event Request</li>
                </ol>

                <div class="container-fluid mb-3 bg-white">
                    <p style="color:black;font-size:50px;text-align:center">Event Request</p>
                    <form action="<%=request.getContextPath()%>/MyServletPrivate" method="post" onsubmit="return validation()">

                        <%  try { //do modifications later

                                String id = "";
                                if (id != null) {
                                    String next_time = null;
                                    //                        ResultSet result = Event.Next_start_time();
                                    //                        if (result.next()) {
                                    //                            next_time = result.getString("Next_start_time");
                                    //                        }
                        %>

                        <div class="row">

                            <div class="col-md-6 px-5 pb-5">
                                <% request.setAttribute("start_time", "00:00");
                                    String start_time = request.getAttribute("start_time").toString();%>



                                <p style="color:black;font-size:20px;text-align:left">Event name:</p>    
                                <div class='form-row mb-2'>
                                    <div class='form-group col-lg-12'>
                                        <div class='input-group'>
                                            <div class='input-group-prepend'>

                                                <div class='input-group-text rounded-0'><i class='fa fa-calendar-check'></i></div>
                                            </div>
                                            <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg'  name="eventName" id="event" placeholder="Event Name" required>
                                        </div>
                                    </div>
                                </div> 
                                <p style="color:black;font-size:20px;text-align:left">Customer name:</p>    
                                <div class='form-row mb-2'>
                                    <div class='form-group col-lg-12'>
                                        <div class='input-group'>
                                            <div class='input-group-prepend'>

                                                <div class='input-group-text rounded-0'><i class='fa fa-user'></i></div>
                                            </div>
                                            <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg'  name="CustomerName" id="name" placeholder="Customer Name" required>
                                        </div>
                                    </div>
                                </div>
                                <p style="color:black;font-size:20px;text-align:left">Phone Number:</p>    
                                <div class='form-row mb-2'>
                                    <div class='form-group col-lg-12'>
                                        <div class='input-group'>
                                            <div class='input-group-prepend'>

                                                <div class='input-group-text rounded-0'><i class='fa fa-phone'></i></div>
                                            </div>
                                            <input type='tel' class='form-control rounded-0 border border-left-0 form-control-lg'  name="phoneNo" id="phone" placeholder="phone Number" required>
                                        </div>
                                    </div>
                                </div> 
                                <p style="color:black;font-size:20px;text-align:left">Email:</p>    
                                <div class='form-row mb-2'>
                                    <div class='form-group col-lg-12'>
                                        <div class='input-group'>
                                            <div class='input-group-prepend'>

                                                <div class='input-group-text rounded-0'><i class='fa fa-envelope'></i></div>
                                            </div>
                                            <input type='email' class='form-control rounded-0 border border-left-0 form-control-lg'  name="email" id="email" placeholder="Email" required>
                                        </div>
                                    </div>
                                </div> 
                                <p style="color:black;font-size:20px;text-align:left">Date:</p>
                                <div class='form-row mb-2'>
                                    <div class='form-group col-lg-12'>
                                        <div class='input-group'>
                                            <div class='input-group-prepend'>
                                                <div class='input-group-text rounded-0'><i class='fa fa-calendar'></i></div>
                                            </div>
                                            <input type='date' class='form-control rounded-0 border border-left-0 form-control-lg' name="date" id="st_date" placeholder="Date" onchange="display()" required>
                                            <p id="isAvailable"></p>
                                        </div>
                                    </div>
                                </div>

                                <div class='form-row mb-2'>
                                    <div class='form-group col-lg-6'>
                                        <label style="color:black;font-size:20px;text-align:left">Start Time: </label> 
                                        <div class='input-group'>
                                            <div class='input-group-prepend'>
                                                <div class='input-group-text rounded-0'><i class='fa fa-clock'></i></div>
                                            </div>
                                            <input type='time' class='form-control rounded-0 border border-left-0 form-control-lg' name="start_time" id="st_STime" placeholder="Start Time" onchange="checkStartTime()" required>
                                        </div>
                                    </div>

                                    <div class='form-group col-lg-6'>
                                        <label style="color:black;font-size:20px;text-align:left">End Time: </label> 
                                        <input type='time' class='form-control rounded-0 form-control-lg' name="end_time" id="ed_Time" placeholder="End Time" required>
                                        <%--<a onclick="checkTimeAvailable()">
                                            Check Time
                                        </a>--%>
                                    </div>  
                                </div>

                                <p style="color:black;font-size:20px;text-align:left">Location:</p>
                                <div class='form-row mb-2'>
                                    <div class='form-group col-lg-12'>
                                        <div class='input-group'>
                                            <div class='input-group-prepend'>
                                                <div class='input-group-text rounded-0'><i class='fa fa-building'></i></div>
                                            </div>
                                            <select class="form-control border border-left-0 form-control-lg rounded-0" name="location" id="loc">
                                                <option>Choose Location</option>
                                                <option>H001</option>
                                                <option>H002</option>
                                                <option>H003</option>

                                            </select>
                                        </div>
                                    </div>
                                </div> 

                                <p style="color:black;font-size:20px;text-align:left">Crowd Expected:</p>
                                <div class='form-row mb-2'>
                                    <div class='form-group col-lg-12'>
                                        <div class='input-group'>
                                            <div class='input-group-prepend'>
                                                <div class='input-group-text rounded-0'><i class='fa fa-users'></i></div>
                                            </div>
                                            <input type='number' class='form-control rounded-0 border border-left-0 form-control-lg' id="crowd" name="crowdE" min="0" max="500" placeholder="Seat allocation" required>
                                            <p id="isAvailable"></p>
                                        </div>
                                    </div>
                                </div>
                                
                                <div id="confirm_btn">
                                    <button type="button" class="btn btn-success" data-toggle="collapse" data-target="#create_menu">Next</button>
                                    <button type="button" style="margin: auto" class="btn btn-success" onclick="itemDemo()">Demo</button>
                                </div>
                                   

                                <div class="form-row mb-2">
                                    <div class="col-12">
                                        <div id="display_start"></div>
                                    </div>    
                                </div>

                            </div>

                            <div class="col-md-6 pb-5 collapse" id="create_menu">

                                <% ResultSet categories = MenuItems.getAllCategories(); %>
                                <p style="color:black;font-size:20px;text-align:left">Select Menu:</p>  
                                <div class="d-flex flex-wrap flex-row justify-content-between">
                                    <!--CATEGORY START-->
                                    <% while (categories.next()) {
                                            String category = categories.getString("category");
                                            ResultSet item = MenuItems.getItemsByCategory(category);
                                    %>
                                    <div class="menu-category">
                                        <h6 class="mb-2 text-muted"><%= category%></h6>
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
                        </div>
                                    
                                    <div class=" ">
                                        <%@ include file="package_Form.jsp" %>
                                    </div>
                            <div class="row">
                                <!--<div class="col-md-6"></div>-->
                                <div class="col-12 align-content-center">
                                    <button type="submit" name="action" value="add_employee" class="btn btn-lg btn-outline-success rounded-0 btn-block">Submit</button>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6"></div>
                                <div class="col-md-6 bg-light py-2"></div>
                            </div>

                    </form>
                </div> 
            </div>
            <%  }
                } catch (Exception ex) {
                    out.println("exception occcured");
                }
            %>

            <!-- End page content -->

            <%@ include file="Layouts/Footer.jsp" %>
            <%@ include file="Layouts/Scripts.jsp" %>
            <script>
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
        </div>
    </body>
</html>
