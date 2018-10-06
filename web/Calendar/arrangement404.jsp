<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%@include file="./Layouts/Scripts.jsp" %>
<%@include file="./Layouts/Styles.jsp" %>
        <style type="text/css">
            @import url('https://fonts.googleapis.com/css?family=Roboto');
        </style>
    </head>
    <body style="font-family: 'Roboto', sans-serif;">


        <div class="col-sm-12">
            <div class="container mt-5">
                <div class="row" style="margin-top: 20%">
                    <div class="col-sm-5 offset-1">
                        <img src="FireFitness.png" class="img-fluid">
                    </div>
                    <div class="col-sm-6 mt-5">
                        <h3>Something went wrong <i class="far fa-frown"></i></h3>
                        <p class="mt-3">Sorry, something wrong with deleting the seat arrangement. Please try again later</p>
                        <p>Our status page is currently reporting a status of <span style="color: green;"> ALL Systems Operational.</span></p>
                        <button class="btn btn-outline-primary btn-lg mt-3" style="border-radius: 25px" onclick="window.location = 'seat_arrangement_table.jsp';"><i class="fas fa-chevron-left"></i> GO BACK</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
