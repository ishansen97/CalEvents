<%@page import="com.payment.PaymentDetails"%>
<%@page import="com.payment.utils.Fmt"%>
<%@page import="com.payment.PaymentDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.payment.Payment"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Invoice</title>
        <%@ include file="Layouts/Styles.jsp" %>
    </head>
    <body>
        <br>
        <%
            String id = request.getParameter("id");
            try {
                Payment rs = PaymentDao.getPaymentById(id);
                SimpleDateFormat datefmt = new SimpleDateFormat("MMMM dd, yyyy");
                if (rs != null) {
                    double amount_paid = rs.getAmount();
                    String amountPaidStr = Fmt.toDec(rs.getAmount());
                    PaymentDetails cus = PaymentDao.getCustomerDetails(rs.getEvent().getCusId());
        %>
        <div class="container">
            <div class="d-flex justify-content-between align-items-center">
                <h3>Invoice #<%= String.format("%05d", rs.getId())%></h3>
                <date><%= Fmt.toDetailedDate(rs.getDate())%></date>
            </div>
            <hr>
            <br>
            <div class="d-flex justify-content-between align-items-top">
                <% if (cus != null) {%>
                <table class="table-sm">
                    <tr><th colspan="2"><%= cus.getCusName()%></th></tr>
                    <tr>
                        <td><i class="fa fa-envelope mr-2"></i></td>
                        <td><%= cus.getCusEmail()%></td>
                    </tr>
                    <tr>
                        <td width="2"><i class="fa fa-phone mr-2"></i></td>
                        <td><%= cus.getCusContact()%></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><%= cus.getCusAddress()%></td>
                    </tr>
                </table>
                <% }%>
                <table class="table-sm" style="width: 300px">
                    <tr>
                        <th class="text-right pr-2">Reservation ID</th>
                        <th class="pl-3"><%= rs.getId()%></th>
                    </tr>
                    <tr>
                        <th class="text-right pr-2">Booked Date</th>
                        <td class="pl-3"><%= Fmt.toLongDate(rs.getEvent().getResDate())%></td>
                    </tr>
                    <tr>
                        <th class="text-right pr-2">Paid Date</th>
                        <td class="pl-3"><%= Fmt.toLongDate(rs.getDate())%></td>
                    </tr>
                    <tr>
                        <th class="text-right pr-2">Payment Method</th>
                        <td class="pl-3"><%= rs.getMethod()%></td>
                    </tr>
                    <tr>
                        <th class="text-right pr-2">Amount Paid</th>
                        <td class="pl-3">$<%= amountPaidStr%></td>
                    </tr>
                </table>
            </div>
            <br>
            <table class="table border">
                <thead class="table-active">
                <th class="border-right-0" width="80%">Reservation</th>
                <th class="border-left-0" width="0"></th>
                <th class="text-center">Seats</th>
                <th class="text-right">Price</th>
                <th class="text-right">Total</th>
                </thead>
                <tr>
                    <td class="border-right-0">
                        <b><%=rs.getEvent().getEventName()%></b>
                        <small class="text-small">
                            -- <%= rs.getEvent().getEventId()%>
                        </small>
                    </td>
                    <td class="border-left-0"></td>
                    <td class="text-center">1</td>
                    <td class="text-right">$<%= amountPaidStr%></td>
                    <td class="text-right">$<%= amountPaidStr%></td>
                </tr>
                <!--Payment Details-->
                <tr class="border-top">
                    <!--SubTotal-->
                    <td class="border-0" colspan="2"></td>
                    <td class="text-secondary text-right border-top-0 border-bottom-0" colspan="2">Sub Total: </td>
                    <th class="text-right no-border-top" style="border-width: 0 1px">$<%= amountPaidStr%></th>
                </tr>
                <tr class="">
                    <!--Tax-->
                    <td class="border-0" colspan="2"></td>
                    <td class="text-secondary text-right border-top-0 border-bottom-0" colspan="2">Tax (10%): </td>
                    <th class="text-right border-top-0 border-bottom-0">$<%= String.format("%.2f", (amount_paid * 0.10))%></th>
                </tr>
                <tr class="">
                    <!--Total-->
                    <td class="border-0" colspan="2"></td>
                    <td class="text-secondary text-right border-bottom-0" colspan="2">Total: </td>
                    <th class="text-right border-bottom-0" style="font-size: 120%">$<%= amountPaidStr%></th>
                </tr>
            </table>
            <br>
            <footer class="d-print-none">
                <hr>
                <div class="d-flex justify-content-end">
                    <a class="btn btn-sm btn-primary mr-2" href="#" onclick="window.print()">Print</a>
                    <!-- ADMIN ONLY -->
                    <a class="btn btn-sm btn-danger" href="#" onclick="confirmDelete('<%= rs.getId()%>')">Delete</a>
                </div>
            </footer>
        </div>
        <%}
        } catch (Exception e) {
            e.printStackTrace();
        %>
        <%= e%>
        <%}%>
    </body>
</html>
