<%@page import="java.sql.ResultSet"%>
<%@page import="com.payment.Payment"%>
<!DOCTYPE html>
<html>
<title>Payment</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ include file="Layouts/Styles.jsp" %>

<body class="w3-light-grey">

<%--<%@ include file="Layouts/Navigation.jsp" %>--%>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="max-width: 640px; margin: 0 auto">
  <br>
  <br>
  <%@include file="payment.jsp"%>

  <%--<%@ include file="Layouts/Footer.jsp" %>--%>
<!-- End page content -->
</div>

<%@ include file="Layouts/Scripts.jsp" %>
</body>
</html>
