<%-- 
    Document   : test
    Created on : Jul 16, 2018, 10:49:52 AM
    Author     : DELL
--%>

<%@page import="reservation.EventViewer,java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../External/Jquery/jquery.min.js" type="text/javascript"></script>
        <!--<link href="../External/Bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>-->
        <!--<script src="../External/Bootstrap/js/bootstrap.js" type="text/javascript"></script>-->
        <link href="../External/Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../External/Bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <style>
            #seats {
                margin-top: 50px;
            }
            
            #customer {
                display: none;
                margin-top: 50px;
            }
            td {
                padding: 20px;
            }
            #customer_payment {
                display: none;
            }
        </style>
        
        <script>
            function generate() {
                var i;
                for (i = 1; i <= 5; i++) {
                    var elem = document.createElement("button");
                    var node = document.createTextNode(i);
                    elem.appendChild(node);
                    var doc = document.getElementById("div1");
                    doc.appendChild(elem);
                    
                    
                }
            }
            
            function buttonColor() {
                var i;
                
                for (i = 1; i <= 10; i++) {
                    var button = document.getElementById(i);
                    var elem = document.getElementById("seats");
                    elem.style.display = "block";
                }
                    
                
            }
            
            function display(obj) {
                //var option = document.getElementById("demo").innerHTML;
                var earlier_arr = document.getElementById("seat_array").innerHTML;
                var no_of_seats = document.getElementById("no_of_seats").value;
                var arr = [earlier_arr];
                
                //if (option === "multiple") {
                    var b = document.getElementById(obj);
                    b.style.color = "red";
                    arr[arr.length] = obj;
                    no_of_seats = no_of_seats + 1;
                    document.getElementById("seat_array").innerHTML = arr;
                    document.getElementById("no_of_seats").value = no_of_seats;
                //}
                /*else
                    document.getElementById("show").value = obj;*/
                    
            }
            
            function displayCus() {
                var seat_arr = document.getElementById("seat_array").innerHTML;
                //var seat_number = document.getElementById("show").value;
                var no_of_seats = document.getElementById("no_of_seats").value;
                
                /*if ((seat_number || seat_arr) === "") {
                    alert("Please select a seat number");
                }*/
                if (seat_arr === "") {
                    alert("Please select a seat number");
                }
                else {
                    var val = document.getElementById("customer");
                    var val1 = document.getElementById("customer_payment");
                    val.style.display = "block";
                    val1.style.display = "block";
                    
                    if (no_of_seats > 1111) {
                        alert("only 4 seats can be reserved");
                    }
                    else {
                        document.getElementById("show").value = seat_arr;
                    }
                    
                }
            }
            
            function seat_handle() {
                //var val = document.getElementById("opt").value;
                document.getElementById("max").innerHTML = "(maximum seats that can be reserved are 4)";
                
                /*if (val === "select") {
                    alert("Please select an option");
                    return false;
                }
                else {
                    document.getElementById("demo").innerHTML = val;
                    if (val === "multiple")
                        document.getElementById("max").innerHTML = "(maximum seats that can be reserved are 4)";
                    return true;
                }*/
                
            }
            
            function showSeats() {
                var seats = document.getElementById('seats');
                //seats.classList.toggle('collapse');
            }
            
            $(document).on("show.bs.collapse", function(e){
                console.log(e);
                e.target.scrollIntoView();
            })
            
        </script>
    </head>
    <body>
        
        <% String event_id = request.getParameter("id");
            
           EventViewer ev = new EventViewer(event_id);
           ResultSet rs = ev.getSeats();
           int noOfSeats = ev.getNoOfSeats();
           ResultSet event = ev.getEventDetails();
           
        %>
 
        <div class="container" style="border: 2px solid blue">
            <a href="calendar.jsp" class="btn btn-light">Go To Calendar View</a>
            <h1>Hello World!</h1>
            <div id="event" class="jumbotron">
                <table>
                    <% while (event.next()) { %>
                    <tr>
                        <td>Event Name :</td>
                        <td><%=event.getString("event_name") %></td>
                    </tr>
                    <tr>
                        <td>Description :</td>
                        <td><%=event.getString("description") %></td>
                    </tr>
                    <tr>
                        <td>Date :</td>
                        <td><%=event.getString("date") %></td>
                    </tr>
                    <tr>
                        <td>From :</td>
                        <td><%=event.getString("start_time") %></td>
                    </tr>
                    <tr>
                        <td>To :</td>
                        <td><%=event.getString("end_time") %></td>
                    </tr>
                    <% } %>
                </table>
            </div>
            <div id="div1">
                <!--<p id="para" onclick="buttonColor()" data-toggle="collapse" data-target="#seats">Click on me to see the difference!!</p>-->
                <% if (noOfSeats == 0) { %>
                    <p style="color: red">No Seats are available</p>
                <% } else { %>
                    <!--<button type="button" data-toggle="collapse" data-target="#seats" class="btn btn-success" >Show</button>-->
                    <a href="#seats" data-toggle="collapse" data-target="#seats" style="font-size:20px">Seat Arrangements<span style="color:red">(<%=noOfSeats %> available)</span></a>
               <% } %>
            </div>
            
            <!--<div id="options" class="jumbotron collapse">
                <h1>Select option</h1>
                <select id="opt">
                    <option>select</option>
                    <option>multiple</option>
                    <option>single</option>
                </select>
                <button type="button" data-toggle="collapse" data-target="#seats" class="btn btn-success" onclick="seat_handle()">Select</button>
            </div>-->
            

            <div id="seats" class="jumbotron col-12 collapse">
                <h1>Select a Seat <span style="color:red" id="max"></span></h1>
            <% while (rs.next()) {
                int seat = rs.getInt("seat_num");
            %>
            <p id="demo" hidden="true"></p>
            <button type="button" id="<%=seat%>" class="btn btn-light" onclick="display(this.id)"><%=seat %></button>
            <% } %>
            <button type="button" id="confirm_seat" data-toggle="collapse" data-target="#customer" class="btn btn-success" onclick="displayCus()">Confirm</button>
            <p id="seat_array"></p>
            <input type="number" id="no_of_seats" value="">
            </div>
            
            
            
            <div id="customer" class="col-lg-12 collapse" style="border: 2px solid green">
                <a href="#customer" id="customer_payment" data-toggle="collapse" style="font-size: 20px">Customer & Payment Details</a>
                <div class="row">
                    <div id="part1" class="col-sm-6" style="border: 2px solid black">
                        <h1>Customer Details...</h1>
                        <form action="<%=request.getContextPath() %>/ReservationServelet" method="post">
                            <table>
                                <tr>
                                    <td>Customer Name : </td>
                                    <td><input type="text" name="fname" id="fname" value=""></td>
                                </tr>
                                <tr>
                                    <td>Phone : </td>
                                    <td><input type="text" name="phone"></td>
                                </tr>
                                <tr>
                                    <td>Email : </td>
                                    <td><input type="text" name="email"></td>
                                </tr>
                                <input type="hidden" id="show" name="seat_num" value="">
                                <input type="hidden" id="event" name="event" value="<%=event_id %>">
                                <p id="final_seat_array"></p>
                                <tr>
                                    <td><input type="submit" name="fname" value="submit" class="btn btn-info"></td>
                                </tr>
                            </table>
                        </form>
                    </div>

                    <div id="part2" class="col-sm-6" style="border: 2px solid black">
                        <h1>Payment Details...</h1>
                        <table>
                            <tr>
                                <td>Amount : </td>
                                <td><input type="text" name="fname"></td>
                            </tr>
                            <tr>
                                <td>Card  Number : </td>
                                <td><input type="text" name="phone"></td>
                            </tr>
                            <tr>
                                <td>Account Number : </td>
                                <td><input type="text" name="email"></td>
                            </tr>
                            <tr>
                                <td><input type="submit" name="fname" value="submit" class="btn btn-info"></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            
        </div>
        
        <script src="../External/Bootstrap/js/bootstrap.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="../External/Bootstrap/js/bootstrap.js"></script>
    </body>
</html>
