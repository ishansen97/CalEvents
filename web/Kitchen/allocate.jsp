<%-- 
    Document   : allocate
    Created on : Sep 1, 2018, 12:19:35 AM
    Author     : Lini Eisha
--%>
 
<%@page import="java.sql.Connection"%>
<%@page import="Connection.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet, java.util.ArrayList"%>
<%@page import="test.fetch"%>
<!DOCTYPE html>
<html>
    <head>

        <title>Kitchen</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <%@ include file="Layouts/Styles.jsp" %>

        <%--<%@ include file="Layouts/Navigation.jsp" %>--%>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


        <style> 
            body h3{

                color:#004085;
                width: 40%;
                align-content: center;
            }

            .button {
                background-color:#009688;
                border: none;
                color: white;
                padding: 10px 25px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: px;
                margin: 5px 7px;
                cursor: pointer;
                align-items: right;
            }
            body h1{


                color:#004085;
                width: 45% ; 
            }

            h4{
                color:#0c5460;
                width: 45%;
                height:20%; 
            }

            input[type=text] {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                box-sizing: border-box;
                border: none;
                background-color: #c0c0c0;
                color: black;
            }

        </style>


        <script>

//            function addRaw() {
//                document.getElementById('moreRaw').style.display = "block";
//                $(document).scrollTop($(document).height());
//            }

            $(document).ready(function () {
                $("#nameList").change(function () {
                    var name = $(this).val();
                    var food_item = $(this).find(":selected").attr("fItem");
                    var raw = $(this).find(":selected").attr("raw");
                    var crowd = $(this).find(":selected").attr("crowd");

                    $("#fItem").attr("value", food_item);
                    $("#rawMaterial").attr("value", raw);
                    $("#crowd").attr("value", crowd);

                });
            });





            $(document).ready(function () {
                $("#food_item_name").change(function () {
                    var food_item = $(this).val();
                    alert(food_item);
//                   var test = food_items.toString(); 
//                   var array = test.split(',');
//                   alert(test);
                    $("#ingredient_list").attr("value", food_item);
//                   $("tbody #menu_details").each(function() {
//                      var menu_food = $(this).attr("foodName");
//                      alert(menu_food);
//                      
//                      if (menu_food === food_item) {
//                          alert("found";);
//                      }
//                      else {
//                          alert("not found";);
//                      }
//                   });
                });
            });

        </script>
    </head>

    <body class="w3-light-grey">

        <%@ include file="Layouts/Navigation.jsp" %>

        <!-- !PAGE CONTENT! -->

        <div class="w3-main" style="margin-left:300px;margin-top:43px;">
            <div>
                <center><h1>Raw Materials </h1></center>
            </div>

            
                        <div id="allo" class="tab-pane fade in"><br>      
                        <h3>Allocate Raw Materials</h3>

                        <hr>

                        <div class="col-sm-8" style="overflow-y:scroll; height:200px;">

                            <table class="table" border="3" width="35%" cellspacing="2" >
                                <thead class="thead-dark">
                                    <tr>
                                        <th class="table-info">Order Name</th>
                                        <th class="table-info">Menu Name</th>
                                        <th class="table-info">Expected Crowd</th>
                                        <th class="table-info">Ingredients </th>
                                        <th class="table-info"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        fetch order = new fetch();
                                        ResultSet foodO = order.getOderRaw();
                                    %>
                                    <%while (foodO.next()) {%>
                                    <tr>
                                        <td class="table-info"><%=foodO.getString("private_Id")%></td>
                                        <td class="table-info"><%=foodO.getString("name")%></td>
                                        <td class="table-info"><%=foodO.getInt("crowd_expected")%></td>
                                        <td class="table-info"><%=foodO.getString("ingredients")%></td>
                                        <td class="table-info"><a class="btn btn-primary" href="../AllocateRawMaterials?nameM=<%=foodO.getString("name")%>&eventID=<%=foodO.getString("private_Id")%>&crowdExpected=<%=foodO.getInt("crowd_expected")%>">Allocate</a></td>

                                    </tr>
                                    <%}%>
                                </tbody>
                            </table> 

                        </div>
                        <h4>ALLOCATE</h4>

                        <div class="container">
                            <div class="col-sm-8">
                                <h4>Choose the Menu</h4>

                                <select class="form-control" name="SelMenu" id="nameList">
                                    <option value="0">Select Event</option>
                                    <%
                                        fetch event = new fetch();
                                        ResultSet eventName = event.getOderRaw();
                                    %>
                                    <%while (eventName.next()) {%>
                                    <option value="<%=eventName.getString("event_Name")%>" fItem="<%=eventName.getString("item_id")%>" raw="<%=eventName.getString("ingredients")%>" crowd="<%=eventName.getString("crowd_expected")%>"><%=eventName.getString("event_Name")%></option>
                                    <%}%> 
                                </select> 

                            </div>

                            <br> <br>


                            <table class="table table-hover">

                                <tr>
                                    <th>Food Item</th>   
                                    <th>Expected crowd</th> 
                                    <th></th>
                                </tr>

                                <tr>
                                    <td><input type="text" id="fItem"></td>
                                    <td><input type="text" id="crowd"></td>

                                </tr>


                                <table class="table table-hover">

                                    <tr>
                                        <th>Raw Material Name</th>
                                        <th>Quantity</th>
                                        <th>Total Quantity</th>
                                    </tr>

                                    <tr>
                                        <td><p><input type="text" id="rawMaterial"></td>
                                        <td><input type="text" id="quantity"></td>
                                        <td><input type="text" id="total_quantity"></td>
                                    </tr>

                                </table>



                        </div>
                    </div>