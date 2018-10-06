<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Payment</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="External/w3/all.css" rel="stylesheet">
        <link href="External/Bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="External/Font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">

        <style>
            html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
        </style>
        <script src="Payment/scripts/validation.js" type="text/javascript"></script>

        <%
            String type = request.getAttribute("type").toString();
            String desc = request.getAttribute("desc").toString();
            String notes = request.getAttribute("notes").toString();
            String amount = request.getAttribute("amount").toString();
        %>
    </head>
    <body class="w3-light-grey">
        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin: 0 auto; margin-top:43px;">
            <br>
            <div class="container" style="max-width: 800px">
                <form action="" class="form" name="expenses" onsubmit="return validateExpense()">
                    <div class="card">
                        <div class="card-header">Add Expenses</div>
                        <div class="card-body">
                            <div class="form-row">
                                <div class="col-md form-group">
                                    <label for="dept">Department</label>
                                    <input name="dept" id="dept" class="form-control" required readonly value="Facility">
                                </div>
                                <div class="col-md form-group">
                                    <label for="dept">Type</label>
                                    <input name="type" id="type" class="form-control" required readonly value="<%= type%>">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md form-group">
                                    <label for="desc">Description</label>
                                    <textarea name="desc" id="desc" rows="5" class="form-control" placeholder="Item details" required readonly><%= desc%></textarea>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md form-group">
                                    <label for="notes">Notes</label>
                                    <textarea name="notes" id="notes" rows="1" class="form-control" placeholder="Extra details" required readonly value="<%= notes%>"></textarea>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md form-group">
                                    <label for="amount">Amount</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">$</span>
                                        </div>
                                        <input name="amount" type="number" step="any" class="form-control" placeholder="100.00" required readonly value="<%= amount%>">
                                    </div>
                                </div>
                                <div class="col-md form-group">
                                    <label for="method">Method</label>
                                    <select name="method" id="method" class="form-control" required>
                                        <option value="" disabled selected>Select Method...</option>
                                        <option value="cash">Cash</option>
                                        <option value="credit">Credit</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer" style="padding:0">
                            <button class="btn btn-primary btn-block btn-lg rounded-0">Pay</button>
                        </div>
                    </div>
                </form>
            </div>
            <br>
        </div>
        <%@ include file="./Layouts/Footer.jsp" %>
        <%@ include file="./Layouts/Scripts.jsp" %>
    </body>
</html>