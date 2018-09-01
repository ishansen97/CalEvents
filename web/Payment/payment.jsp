<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <body>
    <script src="validation.js" type="text/javascript"></script>
    <div class="container container-small">
      <form id="payment" action="${pageContext.request.contextPath}/ProcessPayment" onsubmit="return validatePayment()" method="POST">
        <input name="reservationId" value="R001">
        <input name="paymentAmount" value="10000">
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
