<%-- 
    Document   : create_seat_arrangement
    Created on : Sep 12, 2018, 6:59:15 PM
    Author     : DELL
--%>
<%@page import="java.sql.*, reservation.*, java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="./Layouts/Styles.jsp" %>
        <%@include file="./Layouts/Scripts.jsp" %>
        
        <style>
            .container {
                color: black;
            }
            td {
                font-size: 20px;
                padding: 30px;
            }
        </style>
        
        <script>
            $(document).ready(function() {
                $("#createBtn").click(function() {
                    var columns = document.getElementById("col-size").value;
                    var x = document.getElementById("x-dir").value;
                    var y = document.getElementById("y-dir").value;
                    
                    if (columns === "" || x === "" || y === "") {
                        alert("Please fill the fields");
                        return false;
                    }
                    
                    $.post("createHTML.jsp", {columns : columns, x : x, y : y}, function(data) {
                        $("#seat_arrangement").html(data);
                    });
                });
            });
            
            $(document).ready(function() {
                $("select").change(function() {
                    var id = $(this).val();
                    //alert("hello : " + id);
                    
                    $(".seats").each(function() {
                       var event_id = $(this).attr("data-value");
                       
                       if (id === event_id) {
                           //alert("found");
                           $(this).attr("type","text");
                           var num_seats = $(this).val();
                           $("#col-size").attr({"min" : 0, "max" : num_seats});
                           
                           $("#col-size").change(function() {
                                var column_size = $(this).val();
                                var seats_per_column = num_seats / column_size;
                                
                                if (num_seats % column_size === 0) {
                                    $("#x-dir").attr({"value" : seats_per_column, "min" : 1, "max" : seats_per_column});
                                    $("#y-dir").attr("value",1);
                                    
                                    $("#x-dir").change(function() {
                                       var columns_per_column = $(this).val();
                                       var rows_per_column = seats_per_column / columns_per_column;
                                       column_size = $(this).val() / $("#y-dir").val();
                                       $("#col-size").attr("value",column_size);
                                       
                                       if (seats_per_column % columns_per_column === 0) {
                                           $("#y-dir").attr({"value" : rows_per_column, "min" : 1, "max" : rows_per_column});
                                       }
                                       else {
                                           alert("number of columns in a column is invalid");
                                           $("#y-dir").attr("value",0);
                                       }
                                    });
                                }
                                else {
                                    alert("This column size is not recommended");
                                }
                                
                           });
                       } else {
                           $(this).attr("type","hidden");
                       }
                    });
                });
            });
            
            
            
            function reset() {
                document.getElementById("col-size").value = "";
                document.getElementById("x-dir").value = "";
                document.getElementById("y-dir").value = "";
                $("#seat_arranegement").hide();
            }
            
            function validArrangement() {
                var columns = document.getElementById("col-size").value;
                var x = document.getElementById("x-dir").value;
                var y = document.getElementById("y-dir").value;
                
                
                var counted_total_seats = columns * x * y;
                alert("counted total seats : " + counted_total_seats);
                var actual_total_seats;
                
                $(".seats").each(function() {
                   var type = $(this).attr("type");
                   if (type === "text") {
                       actual_total_seats = $(this).val();
                       alert("actual total seats : " + actual_total_seats);
                   }
                });
                
                if ((counted_total_seats > actual_total_seats) || (counted_total_seats < actual_total_seats)) {
                    alert("Your selected seat_arrangement is incorrect, Please create a new one");
                    return false;
                }
                else {
                    return true;
                }
            }
            
            $(document).ready(function() {
               $("#view_arr").click(function() {
                  $.post("seat_arrangement_table.jsp", function(data) {
                      $("#seat_arrangement_content").html(data);
                  }); 
               });
            });
            
//            function saveArrangement() {
//                var columns = document.getElementById("col-size").value;
//                var x = document.getElementById("x-dir").value;
//                var y = document.getElementById("y-dir").value;
//                var arrangement_validity = validArrangement();
//                alert("arrangement_validity : " + arrangement_validity);
//                
//                return false;
//                
////                if (columns === "" || x === "" || y === "") {
////                    alert("Please fill the fields");
////                    return false;
////                }
////                if (arrangement_validity) {
////                    return true;
////                }
////                else {
////                    return false;
////                }
//            }
            
        </script>
    </head>
    <%@include file="./Layouts/Navigation.jsp" %>
    <body class="w3-light-grey">
        <div class="w3-main" style="margin-top: 50px; margin-left: 300px">
            <% ResultSet result = ReservationManagement.getBookedEventID();
               List<Integer> seat_list = ReservationManagement.getNoOfTotalSeats();
               List<String> event_list = new ArrayList<String>();
               int count = 0;

               while (result.next()) {
                   event_list.add(result.getString("event_ID"));
               }
               
               int event_list_size = event_list.size();
               String[] str_arr = event_list.toArray(new String[0]);
               
            %>
            <div class="container bg-white">
                <div class="row">
                    <h1 style="color: black">create seat arrangements</h1>
                </div>
                <div class="row" style="margin-left: 20px">
                    <a href="create_seat_arrangement.jsp" class="btn btn-outline-primary">Create Seat Arrangement</a>
                    <a href="seat_arrangement_table.jsp" class="btn btn-outline-primary" id="view_arr">View Seat Arrangement details</a>
                </div>
                <div class="row" id="seat_arrangement_content" style="margin-top: 20px">
                    <form action="<%=request.getContextPath() %>/CreateSeatArrangementServlet" method="POST" onsubmit="return validArrangement()">
                        <table>
                            <tr>
                                <td>Select event ID</td>
                                <td><select name="event_id" id="event_ID">
                                        <option value=""></option>
                                        <% for (String event_id : event_list) { %>
                                        <option value="<%=event_id %>"><%=event_id %></option>
                                        <% } %>
                                    </select>
                                </td>
                            </tr>
                            <tr id="seat_num_row">
                                <td>No of seats</td>
                                <td>
                                <% for (int seat : seat_list) { %>
                                    <input type="hidden" name="seat_list" class="seats" data-value="<%=str_arr[count] %>" value="<%=seat %>" readonly>
                                <% count++; %>
                                <% } %>
                                </td>
                            </tr>
                            <tr>
                                <td>No of columns</td>
                                <td><input type="number" id="col-size" name="columns" required></td>
                            </tr>
                            <tr>
                                <td>No of columns in a column</td>
                                <td><input type="number" id="x-dir" name="x-axis" required></td>
                            </tr>
                            <tr>
                                <td>No of rows in a column</td>
                                <td><input type="number" id="y-dir" name="y-axis" required></td>
                            </tr>
                            <tr>
                                <td><button type="button" class="btn btn-outline-primary" id="createBtn">create</button>
                                    <button type="submit" class="btn btn-outline-success" id="saveBtn">save arrangement</button>
                                    <button type="reset" class="btn btn-outline-danger" onclick="reset()">reset</button>
                                </td>

                            </tr>
                        </table>
                    </form>
                    <div class="row">
                        <div class="col-12">
                            <div id="seat_arrangement">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
