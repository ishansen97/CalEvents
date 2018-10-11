<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Payment - Generate reports</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ include file="./Layouts/Styles.jsp" %>
    <script src="scripts/Chart.bundle.min.js" type="text/javascript"></script>
  </head>
  <body class="w3-light-grey">
    <%@ include file="./Layouts/Navigation.jsp" %>
    <!-- !PAGE CONTENT! -->
    <div class="w3-main" style="margin-left:300px;margin-top:43px;">
      <br>
      <div class="container">
        <h2>Generate Reports</h2>
        <hr>
        <br>
        <div class="row">
          <div class="col">
            <div class="card">
              <div class="card-header"><h5>Generate reports for Payments</h5></div>
              <div class="card-body">
                <form action="generate_reports">
                  <label for="">Month</label>
                  <div class="input-group">
                    <input type="month" class="form-control" name="month" required>
                    <div class="input-group-append">
                      <button class="btn btn-primary" name="payments">Generate</button>
                    </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card">
            <div class="card-header"><h5>Generate reports for Expenses</h5></div>
            <div class="card-body">
              <label for="">Month</label>
              <form action="generate_reports">
                <div class="input-group">
                  <input type="month" class="form-control" name="month" required>
                  <div class="input-group-append">
                    <button class="btn btn-primary" name="expenses">Generate</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>

    </div>
    <br>
  </div>
  <%@ include file="./Layouts/Footer.jsp" %>
  <%@ include file="./Layouts/Scripts.jsp" %>
</body>
</html>