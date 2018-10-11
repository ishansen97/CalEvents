<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.payment.Payment"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Payment</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <%@ include file="Layouts/Styles.jsp" %>
  <body class="w3-light-grey">
    <%@ include file="Layouts/Navigation.jsp" %>
    <div class="w3-main" style="margin-left:300px;margin-top:43px;">
      <br>
      <!-- !PAGE CONTENT! -->
      <div class="container">
        <%@ include file="payment.jsp" %>
      </div>
      <!--PAGE CONTENT END-->
    </div>
    <%@ include file="Layouts/Footer.jsp" %>
    <%@ include file="Layouts/Scripts.jsp" %>
  </body>
</html>
