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
        
        <link href="../External/Bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../External/Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
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
                document.getElementById("show").value = obj;
                    
            }
            
            function displayCus() {
                var seat_number = document.getElementById("show").value;
                
                if (seat_number === "") {
                    alert("Please select a seat number");
                }
                else {
                    var val = document.getElementById("customer");
                    val.style.display = "block";
                }
            }
            
        </script>
    </head>
    <body>
        
        <% String event_id = request.getParameter("id");
            
           EventViewer ev = new EventViewer(event_id);
           ResultSet rs = ev.getSeats();
           ResultSet event = ev.getEventDetails();
           
        %>
 
        <div class="container" style="border: 2px solid blue">
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
                <a href="#seats" data-toggle="collapse" style="font-size:20px">Seat Arrangements</a>
            </div>

            <div id="seats" class="jumbotron collapse">
                <h1>Select a Seat</h1>
            <% while (rs.next()) {
                int seat = rs.getInt("seat_num");
            %>
            <button type="button" id="<%=seat%>" class="btn btn alert-danger" onclick="display(this.id)"><%=seat %></button>
            <% } %>
            <button type="button" id="confirm_seat" data-toggle="collapse" data-target="#customer" class="btn btn-success" onclick="displayCus()">Confirm</button>
            </div>
            
            <div id="customer" class="col-lg-12 collapse" style="border: 2px solid green">
                <div class="row">
                    <div id="part1" class="col-sm-6" style="border: 2px solid black">
                        <h1>Customer Details...</h1>
                        <table>
                            <tr>
                                <td>Customer Name : </td>
                                <td><input type="text" name="fname"></td>
                            </tr>
                            <tr>
                                <td>Phone : </td>
                                <td><input type="text" name="phone"></td>
                            </tr>
                            <tr>
                                <td>Email : </td>
                                <td><input type="text" name="email"></td>
                            </tr>
                            <tr>
                                <td><input type="submit" name="fname" value="submit" class="btn btn-info"></td>
                            </tr>
                        </table>
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
            <input type="hidden" id="show" value="">
        </div>
        
        <script src="../External/Bootstrap/js/bootstrap.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="../External/Bootstrap/js/bootstrap.js"></script>
    </body>
</html>
