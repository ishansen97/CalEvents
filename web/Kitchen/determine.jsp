<%-- 
    Document   : determine
    Created on : Sep 1, 2018, 12:20:52 AM
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

            
             <%-- determine raw --%>
                    <% String[] ingredients = null;
                        ArrayList<String> ingredients_list = new ArrayList<String>(); %>
                    <div id="det" class="tab-pane fade in">
                        <br>      
                        <h3>Determine Raw Materials</h3>

                        <hr><hr>
                        <div class="col-sm-8" style="overflow-y:scroll; height:400px;">
                            <table class="table" border="3" width="35%" cellspacing="2" >
                                <thead class="thead-dark">
                                    <tr>
                                        <th class="table-info">Menu Name</th>
                                        <th class="table-info">Food Name</th>
                                        <th class="table-info">Ingredients </th>
                                        <th class="table-info"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        fetch food = new fetch();
                                        ResultSet foodI = food.getFood();
                                    %>
                                    <%while (foodI.next()) {%>
                                    <tr id="menu_details" foodName="<%=foodI.getString("name")%>">
                                        <td class="table-info"><%=foodI.getString("category")%></td>
                                        <td class="table-info"><%=foodI.getString("name")%></td>
                                        <td class="table-info"><%=foodI.getString("ingredients")%></td>
                                        <td><button class="btn btn-outline-info" id="<%=foodI.getString("item_id")%>" name="insertRawQuantity" value="<%=foodI.getString("item_id")%>" onclick="displayModal(this.id)">Insert</button></td>
                                        <% ingredients_list.add(foodI.getString("ingredients")); %>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>

                            <script>
                                function displayModal(obj) {
                                    var item_id = obj;
                                    //alert(item_id);

                                    $.post("insertIngQuantity.jsp", {menue_ID: item_id}, function (data) {
                                        $("#insertIngModal .modal-body").html(data);
                                    });
                                    $("#insertIngModal").modal();
                                }
                            </script>

                            <div class="modal fade" id="insertIngModal">
                                <div class="modal-dialog" style="width: 1200px">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <!--                                            <h1 class="modal-title">Insert Quantity</h1>-->
                                        </div>
                                        <div class="modal-body">

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                String message = (String) session.getAttribute("message");
                                if(message!=null){
                            %>
                            <script>
                                alert("<%=message%>");
                            </script>
                            <%
                                session.removeAttribute("message");}
                            %>
                        </div>
                    </div>

