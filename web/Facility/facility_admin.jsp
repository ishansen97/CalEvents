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
            
            <div id="packages"></div>


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
