<%-- 
    Document   : event_reservation
    Created on : Aug 9, 2018, 9:08:49 PM
    Author     : DELL
--%>

<%@page import="reservation.EventViewer,java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%--@include file="Layouts/Styles.jsp" %>
        <%@include file="Layouts/Scripts.jsp" --%>
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
            })
            
            function validate() {
                var seats = document.getElementById("show").value;
                
                if (seats === "") {
                    alert("Please select your seats (maximum 4)");
                    return false;
                }
//                else
//                    return true;
            }
            
            function undo_seats() {
//                var seat_arr = document.getElementById("seat_array").value;
//                var array = [seat_arr];
//                var seat = array.pop();
//                document.getElementById("seat_array").innerHTML = array;
//                document.getElementById("no_of_seats").value = "";
//                alert(seat);
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
            
            //payment validations
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
        
        var expDate = new Date("1/"+expMM.value + "/"+expYY.value);
        var isValidDate = new Date().getTime() < expDate.getTime();

        // validate CardNo and CCV
        var validCCNo = validateInput(ccNo,  /^(\d{4}(\s|-)?){3}(\d{2,4})$/);
        var validCCV  = validateInput(ccCCV, /^\d{3}$/);
        var validName = validateInput(ccCCV, /^\w+/);
        var validExYY = validateInput(expYY, isValidDate);
        var validExMM = validateInput(expMM, isValidDate);
        var seat_validate = validate();

        return validCCNo && validCCV && validExMM && validExYY && seat_validate;
      }
            
        </script>
    </head>
    <body>
        
        <% 
            try {
                String customer_id = session.getAttribute("customer_id").toString();
                String customer_name = session.getAttribute("customer_name").toString();
                String event_id = request.getParameter("id");
                
                if (customer_id != null) {
                    EventViewer ev = new EventViewer(event_id);
                    ResultSet rs = ev.getSeats();
                    int noOfSeats = ev.getNoOfSeats();
                    ResultSet event = ev.getEventDetails();
           
        %>
 
        <div class="container" style="border: 2px solid blue">
            <a href="calendar.jsp" class="btn btn-light">Go To Calendar View</a>
            <a href="handleReservation.jsp?customer_id=<%=customer_id %>" class="btn btn-light">My reservations</a>
            <a href="profile.jsp" style="float: right"><%=customer_name %></a>
            <div id="event" class="jumbotron">
                <h1>Event Details</h1>
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
                <% if (noOfSeats == 0) { %>
                    <p style="color: red">No Seats are available</p>
                <%} else if (ev.isBookedByCustomer(customer_id)) { %>
                <p style="color: red">You have already made a reservation for this event</p>
                <%} else { %>
                    <a href="#seats" data-toggle="collapse" data-target="#seats" style="font-size:20px">Seat Arrangements<span style="color:red">(<%=noOfSeats %> available)</span></a>
               <% } %>
            </div>
            
            

            <div id="seats" class="jumbotron col-12 collapse">
                <form>
                <h1>Select a Seat <span style="color:red">(Maximum 4 seats)</span></h1>
            <% while (rs.next()) {
                int seat = rs.getInt("seat_num");
            %>
            <!--<p id="demo"></p>-->
            <input type="checkbox" id="<%=seat %>" value="<%=seat %>" onclick="display(this.id)" style="font-size: 30px"><%=seat %>
            <% } %>
            <button type="button" id="confirm_seat" data-toggle="collapse" data-target="#customer" class="btn btn-success" onclick="return displayCus()">Confirm</button>
            <button type="reset" id="undo" class="btn btn-info" onclick="undo_seats()">Reset</button>
            <p id="seat_array"></p>
            <input type="hidden" id="no_of_seats">
                </form>
            </div>
            
            
            
          <div id="customer" class="col-lg-12 collapse" style="border: 2px solid green">
                <a href="#customer" id="customer_payment" data-toggle="collapse" style="font-size: 20px">Payment Details</a>


                <form action="${pageContext.request.contextPath}/ReservationServelet1" name="payment" onsubmit="return validatePayment()" method="POST">
          
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
                <input type="text" class="form-control" name="cardName" placeholder="Full name" required>
              </div>
              <div class="col-md-4 form-group">
                <label for="">Expiry</label>
                <div class="input-group">
                   PAYMENT EXPIRY DATE
                  <input type="number" min="1" max="12" class="form-control" name="expiryMonth" placeholder="MM" required>
                  <input type="number" min="18" class="form-control" name="expiryYear" placeholder="YY" required>
                </div>
              </div>
            </div>
            <div class="form-row">
              <div class="col-md-8 form-group">
                 PAYMENT CARD NUMBER
                <label for="cardNumber">Credit Card Number <small class="text-muted">(spaces or dashes are allowed)</small></label>
                <input type="text" class="form-control" name="cardNumber" placeholder="xxxx xxxx xxxx xxxx" required>
              </div>
              <div class="col-md-4 form-group">
                <label for="">CCV</label>
                 PAYMENT CCV
                <input type="text" class="form-control" name="cardCCV" placeholder="CCV" required>
              </div>
            </div>
          </div>
          <div class="card-footer">
              
                                <button type="submit" class="btn btn-primary btn-block btn-lg">Continue</button>
          </div>
        </div>
      </form>
    </div>
            </div>
                                
       <script src="../External/Bootstrap/js/bootstrap.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="../External/Bootstrap/js/bootstrap.js"></script>
        <% } else {
                String query = "id=" + event_id;
                response.sendRedirect("test.jsp?" + query);
        }
        %>
        <% } catch (Exception ex) {
                String event_id = request.getParameter("id");
                String query = "id=" + event_id;
                response.sendRedirect("test.jsp?" + query);
        }
        %>
    </body>
</html>

