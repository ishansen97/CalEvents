
<%@page import="Event.Statistics"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Dashboard</title>
        <%@ include file="Layouts/Styles.jsp" %>
        <style>
            a{
                text-decoration: none !important;
            }

            .custom-red-hover:hover{
                background-color: rgb(167, 0, 0) !important;
                transition: 0.5s !important;
            }

            .custom-blue-hover:hover{
                background-color: rgb(0, 0, 167) !important;
                transition: 0.5s !important;
            }

            .custom-green-hover:hover{
                background-color: rgb(1, 127, 44) !important;
                transition: 0.5s !important;
            }

            .custom-yellow-hover:hover{
                background-color: rgb(210, 155, 2) !important;
                transition: 0.5s !important;
            }
        </style>
    </head>

    <body class="bg-secondary">

        <%@ include file="Layouts/Navigation.jsp" %>



        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">


            <div class="container-fluid"  style="padding-top:22px">
                <!-- Breadcrumbs-->
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active">Dashboard</li>
                </ol>

                <div class="container-fluid mb-3 bg-white">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="w3-row-padding w3-margin-bottom w3-margin-top">
                                <div class="w3-half">
                                    <a href="insertEvent.jsp">
                                        <div class="w3-container w3-red w3-padding-16 custom-red-hover">
                                            <div class="w3-left"><i class="fa fa-calendar-plus w3-xxxlarge"></i></div>
                                            <div class="w3-right">
                                            </div>
                                            <div class="w3-clear"></div>
                                            <h4 class="pt-3">Insert Public Events</h4>
                                        </div>
                                    </a>
                                </div>
                                <div class="w3-half">
                                    <a href="eventListP.jsp">
                                        <div class="w3-container w3-red w3-text-white w3-padding-16 custom-red-hover">
                                            <div class="w3-left"><i class="fa fa-list-alt w3-xxxlarge"></i></div>
                                            <div class="w3-right">
                                            </div>
                                            <div class="w3-clear"></div>
                                            <h4 class="pt-3">Public Event List</h4>
                                        </div>
                                    </a>

                                </div>
                            </div>
                            <div class="w3-row-padding w3-margin-bottom w3-margin-top">           
                                <div class="w3-half">
                                    <a href="insert_B_events.jsp">
                                        <div class="w3-container w3-blue w3-padding-16 custom-blue-hover">
                                            <div class="w3-left"><i class="fa fa-calendar-plus w3-xxxlarge"></i></div>
                                            <div class="w3-right">
                                            </div>
                                            <div class="w3-clear"></div>
                                            <h4 class="pt-3">Insert Booked Events</h4>
                                        </div>
                                    </a>
                                </div>

                                <div class="w3-half">
                                    <a href="eventListB.jsp">
                                        <div class="w3-container w3-blue w3-text-white w3-padding-16 custom-blue-hover">
                                            <div class="w3-left"><i class="fa fa-list-alt w3-xxxlarge"></i></div>
                                            <div class="w3-right">
                                            </div>
                                            <div class="w3-clear"></div>
                                            <h4 class="pt-3">Booked Event List</h4>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="w3-row-padding w3-margin-bottom w3-margin-top">           
                                <div class="w3-half">
                                    <a href="eventListRequest.jsp">
                                        <div class="w3-container w3-green w3-text-white w3-padding-16 custom-green-hover">
                                            <div class="w3-left"><i class="fa fa-list-ol w3-xxxlarge"></i></div>
                                            <div class="w3-right">
                                            </div>
                                            <div class="w3-clear"></div>
                                            <h4 class="pt-3">Private Event Requests</h4>
                                        </div>
                                    </a>
                                </div>

                                <div class="w3-half">
                                    <a href="calendarview.jsp">
                                        <div class="w3-container w3-green w3-text-white w3-padding-16 custom-green-hover">
                                            <div class="w3-left"><i class="fa fa-calendar-check-o w3-xxxlarge"></i></div>
                                            <div class="w3-right">
                                            </div>
                                            <div class="w3-clear"></div>
                                            <h4 class="pt-3">Calendar view</h4>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="w3-row-padding w3-margin-bottom w3-margin-top">           
                                <div class="w3-half">
                                    <a href="Stats.jsp">
                                        <div class="w3-container w3-orange w3-text-white w3-padding-16 custom-yellow-hover">
                                            <div class="w3-left"><i class="fa fa-pie-chart w3-xxxlarge"></i></div>
                                            <div class="w3-right">
                                            </div>
                                            <div class="w3-clear"></div>
                                            <h4 class="pt-3">Event Statistics</h4>
                                        </div>
                                    </a>
                                </div>

                                <div class="w3-half">
                                    <a href="reports.jsp">
                                        <div class="w3-container w3-orange w3-text-white w3-padding-16 custom-yellow-hover">
                                            <div class="w3-left"><i class="fa fa-paperclip  w3-xxxlarge"></i></div>
                                            <div class="w3-right">
                                            </div>
                                            <div class="w3-clear"></div>
                                            <h4 class="pt-3">Report Generation </h4>
                                        </div>
                                    </a>
                                </div>
                            </div>

                        </div>
                        <div class="col-md-6 pt-3">
                            <canvas class="w3-card p-2 bg-white" id="myChart02" width="200" height="170"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- End page content -->

        <%@ include file="Layouts/Scripts.jsp" %>
        <script>
            var ctx01 = document.getElementById("myChart02").getContext('2d');
            var myChart = new Chart(ctx01, {
                type: 'pie',
                data: {
                    labels: ["Public Events", "Private Events", "Booked Events"],
                    datasets: [
                        {
                            label: "Current Year",
                            backgroundColor: [
                                'rgba(249,5,9,0.6)',
                                'rgba(12,31,237,0.6)',
                                'rgba(37, 235, 34,0.6)'

                            ],
                            borderColor: "rgba(255,255,255)",
                            data: [<% out.print(Statistics.getCount()); %>]
                        },
                        {
                            label: "Previous Year",
                            backgroundColor: [
                                'rgba(250, 20, 20,0.6)',
                                'rgba(2,19,104,0.6)',
                                'rgba(108, 250, 20,0.6)'

                            ],
                            borderColor: "rgba(255,255,255,1)",
                            data: [<% out.print(Statistics.getCountForLastYear());%>]
                        }

                    ]
                }
            });
        </script>
    </body>

</html>
