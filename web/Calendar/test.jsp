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
<!--        <script src="../External/Jquery/jquery.min.js" type="text/javascript"></script>
        <link href="../External/Bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="../External/Bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <link href="../External/Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../External/Bootstrap/js/bootstrap.min.js" type="text/javascript"></script>-->
        <%@include file="./Layouts/Styles.jsp" %>
        <%@include file="./Layouts/Scripts.jsp" %>
        <style>
            #seats {
                margin-top: 50px;
                font-size: 20px;
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
                var payAmount = 1000;
               
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
                        return false;
                    }
                    else {
                        switch (no_of_seats) {
                            case "1" : payAmount = payAmount * 1;
                                     break;
                                     
                            case "11" : payAmount = payAmount * 2;
                                      break;
                                     
                            case "111" : payAmount = payAmount * 3;
                                       break;
                                     
                            case "1111" : payAmount = payAmount * 4;
                                        break;
                                        
                            default : alert("nothing");
                                      break;
                        }
                        document.getElementById("show").value = seat_arr;
                        document.getElementById("amount").value = payAmount;
                        return true;
                    }
                    
                }
            }
            
            
            function showSeats() {
                var seats = document.getElementById('seats');
                //seats.classList.toggle('collapse');
            }
            
            $(document).on("show.bs.collapse", function(e){
                console.log(e);
                e.target.scrollIntoView();
            });
            
            $(document).ready(function() {
                $("#email_address").keyup(function() {
                    var email = $(this).val();
                    email = email.toString();      

                      $.post("<%=request.getContextPath() %>/CheckEmailAvailability", {email : email}, function(data) { 
                          $(".status").html(data);
                      }, "text");
                });
            });            
            
            function validate() {
                var seats = document.getElementById("show").value;
                
                if (seats === "") {
                    alert("Please select your seats (maximum 4)");
                    return false;
                }
                else
                    return true;
            }
            
            function undo_seats() {
                var seat_arr = document.getElementById("seat_array").innerHTML;
                var array = [seat_arr];
                var seat = array.pop();
                var i;
                document.getElementById("seat_array").innerHTML = array;
                document.getElementById("no_of_seats").value = "";
                alert("the seats has been unselected");
                
                for (i = 1; i < 20; i++) {
                    var selected = document.getElementById(i).checked;
                    if (selected === true)
                        document.getElementById(i).checked = false;
                }
            }
            
            function customerDemo() {
                document.getElementById("fname").value = "Henry";
                document.getElementById("address").value = "No.123,Colombo";
                document.getElementById("phone").value = "0777129625";
                document.getElementById("email").value = "henry123@gmail.com";
                
            }
            
            function paymentDemo() {
                document.getElementById("card_name").value = "H.H Andrews";
                document.getElementById("expiryM").value = 09;
                document.getElementById("expiryY").value = 20;
                document.getElementById("card_number").value = "4111 1111 1111 1111";
                document.getElementById("card_ccv").value = 123;
            }
            
            function retrieveSeatArrangement() {
                var event_id = document.getElementById("event").value;
                var columns = document.getElementById("columns").value;
                var sub_rows = document.getElementById("sub_rows").value;
                var sub_columns = document.getElementById("sub_columns").value;
                
                $.post("reservation_seat_arrangement.jsp", {columns : columns, x : sub_columns, y : sub_rows}, function(data) {
                    $(".modal-body").html(data);
                    $("#seat_arrangement").modal({show:true});
                });
            }
                
            
            function validatePhone() {
                var phone = document.getElementById("phoneNum").value;
                var phoneNum = phone.toString();
                var exp = /^[0-9]+$/;
                
                if (phoneNum.match(exp)) {
                    return true;
                }
                else {
                    alert("Enter numbers only for the phone number");
                    return false;
                }
            }
            
            function validateInput(input, match) {
                if (match === true || input.value.match(match)) {
                    input.classList.remove('is-invalid');
                    return true;
                }
                input.classList.add('is-invalid');
                input.value = '';
                return false;
            }

            function validatePayment() {
                var ccNo = document.forms["payment"]["cardNumber"];
                var ccCCV = document.forms["payment"]["cardCCV"];
                var ccName = document.forms["payment"]["cardName"];
                var expMM = document.forms["payment"]["expiryMonth"];
                var expYY = document.forms["payment"]["expiryYear"];
                var dateMM = Number(expMM.value);
                var dateYY = Number(expYY.value);

                // validate CardNo and CCV
                var validCCNo = validateInput(ccNo,  /^(\d{4}(\s|-)?){3}(\d{2,4})$/);
                var validCCV  = validateInput(ccCCV, /^\d{3}$/);
                var validName = validateInput(ccCCV, /^\w+/);
                var validExMM = validateInput(expMM, (dateMM > 0 && dateMM <= 12));
                var validExYY = validateInput(expYY, (dateYY >= new Date().getFullYear() % 100));
                var seat_validate = validate();
                var validPhone = validatePhone();
                
//                alert("Card num " + validCCNo);
//                alert("CCV " + validCCV);
//                alert("seat_validate " + seat_validate);
//                alert("Name " + validName);
//                alert("exp month " + validExMM);
//                alert("exp year " + validExYY);
//                alert("Phone " + validPhone);
                
                //return false;

                return validCCNo && validCCV && validExMM && validExYY && seat_validate && validPhone;
            }
            
        </script>
    </head>
    <body style="background-color: darkslategrey; font-family: verdana">
        
        <% 
            try {
                String event_id = request.getParameter("id");
                int columns = 0;
                int sub_rows = 0;
                int sub_columns = 0;

                EventViewer ev = new EventViewer(event_id);
                ResultSet rs = ev.getSeats();
                int noOfSeats = ev.getNoOfSeats();
                ResultSet event = ev.getEventDetails();
                ResultSet seat_arrangement = ev.getSeatArrangement();
                
                while (seat_arrangement.next()) {
                    columns = seat_arrangement.getInt("columns");
                    sub_rows = seat_arrangement.getInt("y_columns");
                    sub_columns = seat_arrangement.getInt("x_columns");
                }
           
        %>
 
        <div class="container">
            <a href="calendar.jsp" class="btn btn-success">Go To Calendar View</a>
                <div id="event" class="card bg-light">
                    <div class="card-header">
                        <h1>Event Details</h1>
                    </div>
                    <div class="card-body bg-primary" style="color: white; font-size: 25px">    
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
                </div>
            <div id="div1">
                <% if (noOfSeats == 0) { %>
                    <p style="color: red">No Seats are available</p>
                <% } else { %>
                <input type="hidden" id="columns" value="<%=columns %>">
                <input type="hidden" id="sub_rows" value="<%=sub_rows %>">
                <input type="hidden" id="sub_columns" value="<%=sub_columns %>">
                <a href="#row_collapse" data-toggle="collapse" data-target="#row_collapse" style="font-size:25px; color: white">Seat Reservation<span style="color:red">(<%=noOfSeats %> available)</span></a>
               <% } %>
            </div>
            
            <div class="row collapse" id="row_collapse">
                <div id="seats" class="card-group col-12 collapse">
                    <div class="card col-12">
                        <h1>Select a Seat <span style="color:red">(Maximum 4 seats)</span></h1>
                        <form>
                        <% while (rs.next()) {
                            int seat = rs.getInt("seat_num");
                        %>
                        <input type="checkbox" id="<%=seat %>" value="<%=seat %>" onclick="display(this.id)" style="font-size: 30px"><%=seat %>
                        <% } %>
                        <button type="button" id="confirm_seat" data-toggle="collapse" data-target="#customer" class="btn btn-success" onclick="return displayCus()">Confirm</button>
                        <button type="reset" id="undo" class="btn btn-info" onclick="undo_seats()">Reset</button>
                        <button type="button" class="btn btn-secondary" onclick="retrieveSeatArrangement()">View Seat Arrangement</button>
                        <p id="seat_array"></p>
                        <input type="hidden" id="no_of_seats" value="">
                            </form>
                    </div>
                </div>
            </div>
            
            
            
            <div id="customer" class="col-lg-12 collapse">
                <a href="#customer" id="customer_payment" data-toggle="collapse" style="font-size: 20px">Customer & Payment Details</a>
                <div class="row">
                    <div id="part1" class="card col-sm-12" style="border: 2px solid black">
                        <div class="card-header">
                            <h1>Customer Details...</h1>
                        </div>
                        <form action="<%=request.getContextPath() %>/ReservationServelet" method="post" onsubmit="return validatePayment()" id="payment">
                            <table>
                                <tr>
                                    <td>Customer Name : </td>
                                    <td><input type="text" name="fname" id="fname" value="" required></td>
                                </tr>
                                <tr>
                                    <td>Address : </td>
                                    <td><textarea name="address" cols="42" rows="5" id="address" value="" required></textarea></td>
                                </tr>
                                <tr>
                                    <td>Phone : </td>
                                    <td><input type="text" id="phone" name="phone" value="" required></td>
                                </tr>
                                <tr>
                                    <td>Email : </td>
                                    <td><input type="email" name="email" id="email" value="" required></td>
                                    <td><div class="status"></div></td>
                                    <td><p id="demo"></p></td>
                                </tr>
                                <tr>
                                    <td><button type="button" class="btn btn-success" onclick="customerDemo()">Show Demo</button></td>
                                </tr>
                            </table>
                            
                    </div>
                </div>
                <div id="part2" class="card bg-light col-sm-12">
                        <div class="card-header">
                            <h1>Payment Details...</h1>
                        </div>
                        <table>
                            <tr>
                                <td>Seats selected</td>
                                <td><input type="text" id="show" name="seat_num" readonly></td>
                            </tr>
                            <tr>
                                <td><input type="hidden" id="event" name="event" value="<%=event_id %>"></td>
                            </tr>
                            <tr>
                                <td>Amount</td>
                                <td><input type="text" id="amount" name="paymentAmount" readonly></td>
                                <td><p id="final_seat_array"></p></td>
                            </tr>
                        </table>
                        <div class="card">
                          <div class="card-header">
                            <h1>Payment</h1>
                            <span class="card-text" style="float:right">
                              <i class="fa fa-credit-card"></i>
                            </span>
                          </div>
                          <div class="card-body">
                            <div class="form-row">
                              <div class="col-md-8 form-group">
                                <label for="cardName">Full Name on Card</label>
                                 PAYMENT CARD NAME 
                                <input type="text" class="form-control" name="cardName" placeholder="Full name" id="card_name" required>
                              </div>
                              <div class="col-md-4 form-group">
                                <label for="">Expiry</label>
                                <div class="input-group">
                                   PAYMENT EXPIRY DATE
                                  <input type="number" min="1" max="12" class="form-control" name="expiryMonth" placeholder="MM" id="expiryM" required>
                                  <input type="number" min="18" class="form-control" name="expiryYear" placeholder="YY" id="expiryY" required>
                                </div>
                              </div>
                            </div>
                            <div class="form-row">
                              <div class="col-md-8 form-group">
                                 PAYMENT CARD NUMBER
                                <label for="cardNumber">Credit Card Number <small class="text-muted">(spaces or dashes are allowed)</small></label>
                                <input type="text" class="form-control" name="cardNumber" id="card_number" placeholder="xxxx xxxx xxxx xxxx" required>
                              </div>
                              <div class="col-md-4 form-group">
                                <label for="">CCV</label>
                                 PAYMENT CCV
                                 <input type="text" class="form-control" name="cardCCV" id="card_ccv" placeholder="CCV" required>
                              </div>
                            </div>
                          </div>
                          <div class="card-footer">
                              <button type="button" class="btn btn-success" onclick="paymentDemo()">Show Demo</button>
                                <button type="submit" class="btn btn-primary btn-block btn-lg">Continue</button>
                          </div>
                        </div>
                      </form>
                    </div>
            </div>
            
        </div>
                            
        <!--Modal body-->
        <div id="seat_arrangement" class="modal fade">
            <div class="modal-dialog bg-white" style="width: 1200px">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title">Seat Arrangement</h1>
                    </div>
                    <div class="modal-body">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">close</button>
                    </div>
                </div>
            </div>
        </div>
          
        <% } catch(Exception ex) {
                response.sendRedirect("404.jsp");
           }
        %>
        
        <script src="../External/Bootstrap/js/bootstrap.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="../External/Bootstrap/js/bootstrap.js"></script>
        
    
    </body>
</html>
