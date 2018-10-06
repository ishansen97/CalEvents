<%-- 
    Document   : RawInsert
    Created on : Oct 6, 2018, 10:51:39 AM
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
                <center><h1>Raw Operations </h1></center>
            </div>



            <!--<div class="container">-->
              <%-- insert raw --%>
                    <div id="ins" class="tab-pane fade in active"><br>      
                        <h3>Insert Raw Materials</h3>
                       
                        <form class="form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" name="se" aria-label="Search">
                            <%-- <button class="btn btn-outline-info my-2 my-sm-0" id="insertsearch" type="submit">Search</button> --%>
                        </form>
                        <hr>

                        <div class="row">
                            <div class="col-6">
                                <form action="../ins" method="POST" onclick="submit">
                                    <table class="table table-hover">
                                        <tr>
                                            <td>Raw material Name :</td>
                                            <td><input type="text" name="name"  placeholder="Name" required="" /></td>
                                        </tr>
                                        <tr>
                                            <td>Unit Type :</td>
                                            <td><input type="text" name="Utype"  placeholder="Type" required="" /></td>
                                        </tr>
                                        <tr>
                                            <td>Unit price :</td>
                                            <td><input type="text" name="Uprice"  placeholder="Price" required="" /></td>
                                        </tr>
                                        <tr>
                                            <td> Quantity :</td>
                                            <td><input type="text" name="qty"  placeholder="Quantity" required="" pattern="[0-9]+" /></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td align="right"><button class="button">INSERT</button>  </td>
                                        </tr>
                                    </table>
                                </form>
                            </div>


                            <div class="col-sm-6-" style="overflow-y:scroll; height:400px;">
                                <div class="">
                                    <table class="table" border="3" width="35%" cellspacing="2" >
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>Raw Materials Name</th>
                                                <th>Quantity</th>
                                                <th>Quantity Type</th>
                                                <th>Unit Price</th>
                                            </tr>
                                        </thead>


                                        <%
                                            DBConnect db = DBConnect.getInstance();
                                            Connection con = db.getCon();
                                            Statement stat = null;
                                            ResultSet data1 = null;

                                            String query = request.getParameter("se");
//
                                            stat = con.createStatement();
                                            String data;
                                            if (query != null) {
                                                data = "SELECT * FROM `raw_materials` WHERE `name` LIKE '%" + query + "%' ";
                                            } else {
                                                data = "SELECT * FROM `raw_materials`";
                                            }
                                            data1 = stat.executeQuery(data);

                                        %>
                                        <%while (data1.next()) {%>
                                        <tr>
                                            <td><%=data1.getString("name")%></td>
                                            <td><%=data1.getString("qType")%></td>
                                            <td><%=data1.getDouble("quantity")%></td>
                                            <td style="text-align:right;"><%=data1.getDouble("unit_Price")%></td>
                                        </tr>
                                        <% } %>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div> 


