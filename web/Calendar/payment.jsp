<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <%@ include file="Layouts/Styles.jsp" %>
    <%@ include file="Layouts/Scripts.jsp" %>
  </head>
  <body>
        <style>
      .container-small {
        max-width: 640px;
      }
    </style>
    <script type="text/javascript">

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

        return validCCNo && validCCV && validExMM && validExYY;
      }
    </script>
    <div class="container container-small">
      <form id="payment" action="${pageContext.request.contextPath}/Payment" onsubmit="return validatePayment()" method="POST">
        <div class="card">
          <div class="card-header">
            <span>Payment</span>
            <span class="card-text" style="float:right">
              <i class="fa fa-credit-card"></i>
            </span>
          </div>
          <div class="card-body">
            <div class="form-row">
              <div class="col-md-8 form-group">
                <label for="cardName">Full Name on Card</label>
                <!-- PAYMENT CARD NAME -->
                <input type="text" class="form-control" name="cardName" placeholder="Full name" required>
              </div>
              <div class="col-md-4 form-group">
                <label for="">Expiry</label>
                <div class="input-group">
                  <!-- PAYMENT EXPIRY DATE-->
                  <input type="number" min="1" max="12" class="form-control" name="expiryMonth" placeholder="MM" required>
                  <input type="number" min="18" class="form-control" name="expiryYear" placeholder="YY" required>
                </div>
              </div>
            </div>
            <div class="form-row">
              <div class="col-md-8 form-group">
                <!-- PAYMENT CARD NUMBER-->
                <label for="cardNumber">Credit Card Number <small class="text-muted">(spaces or dashes are allowed)</small></label>
                <input type="text" class="form-control" name="cardNumber" placeholder="xxxx xxxx xxxx xxxx" required>
              </div>
              <div class="col-md-4 form-group">
                <label for="">CCV</label>
                <!-- PAYMENT CCV-->
                <input type="text" class="form-control" name="cardCCV" placeholder="CCV" required>
              </div>
            </div>
          </div>
          <div class="card-footer">
            <button class="btn btn-primary btn-block btn-lg">Continue</button>
          </div>
        </div>
      </form>
    </div>
  </body>
</html>
