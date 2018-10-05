<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Payment</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ include file="./Layouts/Styles.jsp" %>
    <script src="scripts/validation.js" type="text/javascript"></script>
  </head>
  <body class="w3-light-grey">
    <%@ include file="./Layouts/Navigation.jsp" %>
    <!-- !PAGE CONTENT! -->
    <div class="w3-main" style="margin-left:300px;margin-top:43px;">
      <br>
      <div class="container" style="max-width: 800px">
        <form action="add_expense" class="form" name="expenses" onsubmit="return validateExpense()">
          <div class="card">
            <div class="card-header">Add Expenses</div>
            <div class="card-body">
              <div class="form-row">
                <div class="col-md form-group">
                  <label for="dept">Department</label>
                  <select name="dept" id="dept" class="form-control" required>
                    <option value="" disabled selected>Select Department...</option>
                    <option value="kitchen">Kitchen</option>
                    <option value="inventory">Inventory</option>
                  </select>
                </div>
              </div>
              <div class="form-row">
                <div class="col-md form-group">
                  <label for="desc">Description</label>
                  <textarea name="desc" id="desc" rows="5" class="form-control" placeholder="Payment Details" required></textarea>
                </div>
              </div>
              <div class="form-row">
                <div class="col-md form-group">
                  <label for="method">Method</label>
                  <select name="method" id="method" class="form-control" required>
                    <option value="" disabled selected>Select Method...</option>
                    <option value="cash">Cash</option>
                    <option value="credit">Credit</option>
                  </select>
                </div>
                <div class="col-md form-group">
                  <label for="amount">Amount</label>
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text">$</span>
                    </div>
                    <input name="amount" type="number" step="any" class="form-control" placeholder="100.00" required>
                  </div>
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