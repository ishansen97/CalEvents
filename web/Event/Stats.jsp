<%@page import="Event.Statistics"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Activity Log</title>
        <%@ include file="Layouts/Styles.jsp" %> 
    </head>
    <body class="bg-secondary">

        <%@ include file="Layouts/Navigation.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">


            <div class="container-fluid"  style="padding-top:22px">
                <!-- Breadcrumbs-->
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="Dashboard">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item active">Statistics</li>
                </ol>

                <div class="container-fluid mb-3 bg-light pb-5">

                    <div class="row">
                        <div class="col-md-12 mt-3">
  <canvas class="w3-card p-2 bg-white" id="myChart02" width="170" height="75"></canvas>
                        </div>
                    </div>

                </div>
            </div>
        </div> 
<%@ include file="Layouts/Scripts.jsp" %>
<script>
    var ctx01 = document.getElementById("myChart02").getContext('2d');
    var myChart = new Chart(ctx01, {
        type: 'bar',
        data: {
            labels: ["Public Events", "Private Events", "Booked Events"],
            fontSize: 20,
        datasets: [
            {
                label: "Current Year",
                backgroundColor: "rgba(75, 192, 192, 0.6)",
                borderColor: "rgba(75,192,192,1)",
                data:[<% out.print(Statistics.getCount()); %>] 
            },
            {
                label: "Previous Year",
                backgroundColor: "rgb(102, 0, 204, 0.6)",
                borderColor: "rgb(102, 0, 204, 1)",
                data:[<% out.print(Statistics.getCountForLastYear()); %>] 
            }
        ]
        },
        options: {
            responsive: true,
        legend: {
            display: true,
            position: "right",
            labels: {
                fontColor: "#333",
                fontSize: 18
            }
        },
        scales: {
            yAxes: [{
                scaleLabel: {
                display: true,
                labelString: 'No of Events',
                fontSize: 18
              }
            }],
             xAxes: [{
                scaleLabel: {
                display: true,
                labelString: 'Types of Events',
                fontSize: 18
              }
            }]
        }
        }
    });
</script>
</body>
</html>