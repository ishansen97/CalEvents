<%-- 
    Document   : allocate
    Created on : Sep 29, 2018, 10:27:30 PM
    Author     : User
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="facilities.allocation.Allocation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Facility</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="jquery-3.3.1.min.js"></script>
        <%@ include file="Layouts/Styles.jsp" %>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="jquery-3.3.1.min.js"></script>
    </head>

    <body class="w3-light-grey">

        <%@ include file="Layouts/Navigation.jsp" %>

        <!-- !PAGE CONTENT! -->


        <div class="w3-main" style="margin-left:600px;margin-top:100px;">
            <% String requestedChairQuantity = (String) session.getAttribute("requestedChairQuantity");
                String eventsId = (String) session.getAttribute("eventsId");
                String availableChairQuantity = (String) session.getAttribute("availableChairQuantity");
                String tentwithsize = (String) session.getAttribute("tentwithsize");
                String tentID = (String) session.getAttribute("tentID");
                String availableTentQuantity = (String) session.getAttribute("availableTentQuantity");
                String[] package_item_names = (String[]) session.getAttribute("package_item_names");
                String[] package_items_quantities = (String[]) session.getAttribute("package_items_quantities");
                String[] ids = (String[]) session.getAttribute("ids");
                String[] itemids = (String[]) session.getAttribute("itemids");

                String message = (String) session.getAttribute("result");
                if (message != null) {
            %>
            <script type="text/javascript">
                var msg = "<%=message%>";
                if (msg.localeCompare("done")) {
                    alert(msg);
                } else {
                    document.getElementById("tentAll").style.visibility = "hidden";
                }

            </script><%
                    session.removeAttribute("result");
                }%>
            <center>
                <div class="container-fluid">
                    <!--<button class="btn btn-danger" id="openAddPackages">Add Packages</button>-->
                    <div class="row">
                        <hr>
                        <div class="row">
                            <div class="packagestabs" id="addPack">
                                <div class="container-fluid">
                                    <div class="col-md-12">
                                        <div class="packagestabs" id="allocateTab">
                                            <h1 class="alert alert-info">Allocation Confirmation</h1>
                                            <table class="table table-hover">
                                                <tbody>
                                                    <tr>
                                                        <td class="info"><h3>Chairs Requested </h3></td>
                                                        <td class="warning"><h3><%=requestedChairQuantity%></h3></td>
                                                        <td class="info"><h3>Available Chairs Quantity :</h3></td>
                                                        <td class="danger" id="availableC"><h3><%=availableChairQuantity%></h3></td>
                                                        <td><a href="finalAllocate.jsp?item_ID=C005&rq=<%=requestedChairQuantity%>&aq=<%=availableChairQuantity%>&itemName=Event Chairs&eventID=<%=eventsId%>" class="btn btn-success"><h4 id="tentAll">Allocate</h4></a></td>
                                                        <td><button id="C005" class="btn btn-danger"><h4>Request</h4></button></td>


                                                    </tr>
                                                    <tr>
                                                        <td class="info"><h3><%=tentwithsize%>  Tent</h3></td>
                                                        <td class="warning"><h3>1</h3></td>
                                                        <td class="info"><h3>Available Tents Quantity :</h3></td>
                                                        <td class="danger" id="availableC"><h3><%=availableTentQuantity%></h3></td>
                                                        <td><a href="finalAllocate.jsp?item_ID=<%=tentID%>&rq=1&aq=<%=availableTentQuantity%>&itemName=<%=tentwithsize%>&eventID=<%=eventsId%>" class="btn btn-success"><h4>Allocate</h4></a></td>
                                                        <td><button id="tentID" class="btn btn-danger"><h4>Request</h4></button></td>
                                                    </tr>
                                                    <%for (int i = 0; i < package_item_names.length; i++) {%>
                                                    <tr>
                                                        <td class="info"><h3><%=package_item_names[i]%></h3></td>
                                                        <td class="warning"><h3><%=package_items_quantities[i]%></h3></td>
                                                        <td class="info"><h3>Available Quantity :</h3></td>
                                                        <td class="danger" id="availableC"><h3><%=ids[i]%></h3></td>
                                                                <%String item = itemids[i];
                                                                    String rq = package_items_quantities[i];
                                                                    String aq = ids[i];
                                                                    String name = package_item_names[i];
                                                                %>
                                                        <td><a href="finalAllocate.jsp?item_ID=<%=item%>&rq=<%=rq%>&aq=<%=aq%>&itemName=<%=name%>&eventID=<%=eventsId%>" class="btn btn-success"><h4>Allocate</h4></a></td>
                                                        <td><button id="package_item_names[i]" class="btn btn-danger"><h4>Request</h4></button></td><%}%>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <input type="hidden" id="hiddententrq" value="1"/>
                                            <input type="hidden" id="hiddententaq" value="<%=availableTentQuantity%>"/>

                                        </div>     
                                        <br>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>

                </div>
            </center>




            <%--<%@ include file="Layouts/Footer.jsp" %>--%>
            <!-- End page content -->
        </div>

        <%@ include file="Layouts/Scripts.jsp" %>
    </body>
</html>