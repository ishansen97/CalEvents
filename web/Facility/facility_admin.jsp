<%@page import="java.sql.ResultSet"%>
<%@page import="supporting.Fetch"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Facility</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <%@ include file="Layouts/Styles.jsp" %>
    </head>
    <body class="w3-light-grey">

        <%@ include file="Layouts/Navigation.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">
            <%
                Fetch privateEvents = new Fetch();
                ResultSet privateUpcomings = privateEvents.fetchEvents();
                String name = "";
            %>
            <div class="container">
                <div class="card">
                    <div class="card-body">
                        <%while (privateUpcomings.next()) {%>
                        <h2 class="alert-dark"><%= privateUpcomings.getString("event_Name")%></h2>
                        <h2 class="alert-danger"><%= privateUpcomings.getString("Date")%></h2>
                        <h2><%= privateUpcomings.getString("start_time")%></h2>
                        <h2><%= privateUpcomings.getString("end_time")%></h2>
                        <h2><%= privateUpcomings.getString("location_ID")%></h2>
                        <%
                            Fetch fetchPackages = new Fetch();
                            ResultSet pacakges = fetchPackages.fetch_FPackages_forE(privateUpcomings.getString("event_ID"));
                        %>
                        <%while (pacakges.next()) {%>
                        <h2 class="alert-primary"><%= pacakges.getString("required")%></h2>
                        <%  name = pacakges.getString("required"); %>
                        <p class="btn btn-success">check availability</p>
                        <%}%>

                        <br><br>
                        <%}%>
                        <div class="card">
                            <div id="content" class="card-body">

                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <script>
                $(document).ready(function () {
                    $("p").click(function () {
                        $("#content").text("fuck");
                    });
                });
            </script>


            <%@ include file="Layouts/Footer.jsp" %>
            <!-- End page content -->
        </div>

        <%@ include file="Layouts/Scripts.jsp" %>
    </body>
</html>
