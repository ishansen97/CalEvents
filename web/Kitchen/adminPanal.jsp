<%-- 
    Document   : adminPanal
    Created on : Aug 31, 2018, 10:12:02 PM
    Author     : Lini Eisha
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="javax.persistence.criteria.Fetch"%>
<%@page import="test.fetch"%>
<!DOCTYPE html>
<html>
    <title>Kitchen</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <%@ include file="Layouts/Styles.jsp" %>

    <body class="w3-light-grey">

        <%@ include file="Layouts/Navigation.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">




            <style>
                .button {
                    background-color:#009688;
                    border: none;
                    color: white;
                    padding: 10px 25px;
                    text-align: center;
                    text-decoration: none;
                    display: inline-block;
                    font-size: px;
                    margin: 5px 7px;
                    cursor: pointer;
                    align-items: right;
                }
            </style>

            <div>
                <center><h1 style="color:#10707f" > KITCHEN ADMIN </h1></center>
            </div>
            <hr><hr>
            <center><h1 style="color:#10707f" >Raw Materials </h1></center>

            <form class="form-inline my-2 my-lg-0" action="..//SearchInsert ">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-info my-2 my-sm-0" id="insertsearch" type="submit">Search</button>
            </form>

            <hr>


            <div class="card-body text-primary">
                <div class="col-lg-8" style="overflow-y:scroll; height:400px;">
                    <div class="">
                        <table class="table" border="5" width="35%" cellspacing="2" >
                            <thead>
                                <tr>
                                    <th class="table-dark">Raw Materials Name</th>
                                    <th class="table-dark">Quantity</th>
                                    <th class="table-dark">Quantity Type</th>
                                    <th class="table-dark">Unit Price</th>

                                </tr>
                            </thead>

                            <tbody>

                                <%
                                    fetch name = new fetch();
                                    ResultSet data1 = name.fetchData();
                                %>

                                <%while (data1.next()) {%>
                                <tr>
                                    <td class="table-info"><%=data1.getString("name")%></td>
                                    <td class="table-info"><%=data1.getString("quantity")%></td>
                                    <td class="table-info"><%=data1.getString("qType")%></td>
                                    <td class="table-info" style="text-align:right;"><%=data1.getDouble("unit_price")%></td>
                                    <%}%>
                                </tr>
                            </tbody>
                        </table>
                    </div>


                </div>

            </div>




    </body>
</html>