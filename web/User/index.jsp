<%@page import="Employee.Analysis"%>
<%@page import="Employee.Data"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Dashboard</title>
        <link rel="icon" href="../External/Images/icon.jpeg">
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
                        <div class="col-md-12">
                            <div class="w3-row-padding w3-margin-bottom w3-margin-top">


                                <div class="w3-quarter">
                                    <a href="Profile">
                                        <div class="w3-container w3-red w3-padding-16 custom-red-hover">
                                            <div class="w3-left"><i class="fa fa-user w3-xxxlarge"></i></div>
                                            <div class="w3-right">
                                            </div>
                                            <div class="w3-clear"></div>
                                            <h4 class="pt-3">Profile</h4>
                                        </div>
                                    </a>
                                </div>


                                <div class="w3-quarter">
                                    <a href="Statistics">
                                        <div class="w3-container w3-blue w3-padding-16 custom-blue-hover">
                                            <div class="w3-left"><i class="fa fa-chart-line w3-xxxlarge"></i></div>
                                            <div class="w3-right">
                                            </div>
                                            <div class="w3-clear"></div>
                                            <h4 class="pt-3">Statistics</h4>
                                        </div>
                                    </a>
                                </div>



                                <div class="w3-quarter">
                                    <a href="Logs">
                                        <div class="w3-container w3-teal w3-padding-16 custom-green-hover">
                                            <div class="w3-left"><i class="fa fa-user-cog w3-xxxlarge"></i></div>
                                            <div class="w3-right">
                                            </div>
                                            <div class="w3-clear"></div>
                                            <h4 class="pt-3">Activity</h4>
                                        </div>
                                    </a>
                                </div>



                                <div class="w3-quarter">
                                    <a href="Employees">
                                        <div class="w3-container w3-orange w3-text-white w3-padding-16 custom-yellow-hover">
                                            <div class="w3-left"><i class="fa fa-users w3-xxxlarge"></i></div>
                                            <div class="w3-right">
                                            </div>
                                            <div class="w3-clear"></div>
                                            <h4 class="pt-3">Employees</h4>
                                        </div>
                                    </a>
                                </div>


                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-7 mt-5 mb-5">
                            <p class="text-center pb-3">Employment Count </p>
                            <script type="text/javascript" src="../External/Charts/loader.js"></script>
                            <div id="regions_div" style="width: 900px; height: 500px;"></div>

                        </div>
                        <div class="col-3 pr-5 pl-1 pt-5 offset-md-2">
                            <div class="card">
                                <div class="card-header bg-secondary text-white">Business Operating Hours</div>
                                <div class="card-body">
                                    <form action="Update-Hours" method="POST">
                                        <div class="form-group">
                                            <label>Opening Hour</label>
                                            <input type="time" name="openingTime" class="form-control form-control-lg" value="<% out.print(Business.getBusinessOpeningTime()); %>">
                                        </div>
                                        <div class="form-group">
                                            <label>Closing Hour</label>
                                            <input type="time" name="closingTime" class="form-control form-control-lg" value="<% out.print(Business.getBusinessClosingTime());
					   %>">
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-block btn-success btn-lg">Update Hours</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!--                            <h5 class="pb-3">Feeds</h5>
                                                        <table class="w3-table w3-striped w3-white">
                                                            <tr>
                                                                <td><i class="fa fa-bell w3-text-red w3-large"></i></td>
                                                                <td>System notifications</td>
                                                                <td><i>Fully functional</i></td>
                                                            </tr>
                                                            <tr>
                                                                <td><i class="fa fa-bell w3-text-red w3-large"></i></td>
                                                                <td>System notifications</td>
                                                                <td><i>Fully functional</i></td>
                                                            </tr>
                                                            <tr>
                                                                <td><i class="fa fa-bell w3-text-red w3-large"></i></td>
                                                                <td>System notifications</td>
                                                                <td><i>Fully functional</i></td>
                                                            </tr>
                                                            <tr>
                                                                <td><i class="fa fa-bell w3-text-red w3-large"></i></td>
                                                                <td>System notifications</td>
                                                                <td><i>Fully functional</i></td>
                                                            </tr>
                                                            <tr>
                                                                <td><i class="fa fa-bell w3-text-red w3-large"></i></td>
                                                                <td>System notifications</td>
                                                                <td><i>Fully functional</i></td>
                                                            </tr>
                                                            <tr>
                                                                <td><i class="fa fa-bell w3-text-red w3-large"></i></td>
                                                                <td>System notifications</td>
                                                                <td><i>Fully functional</i></td>
                                                            </tr>
                                                        </table>-->
                        </div>
                    </div>

                </div>

            </div>

            <!-- End page content -->
        </div>
        <%@ include file="Layouts/Scripts.jsp" %>
        <script>
            google.charts.load('current', {
                'packages': ['geochart'],
                // Note: you will need to get a mapsApiKey for your project.
                // See: https://developers.google.com/chart/interactive/docs/basic_load_libs#load-settings
                'mapsApiKey': 'AIzaSyD-9tSrke72PouQMnMX-a7eZSW0jkFMBWY'
            });
            google.charts.setOnLoadCallback(drawRegionsMap);

            function drawRegionsMap() {
                var data = google.visualization.arrayToDataTable([
                    ['Country', 'Employees'],
                    ['Sri Lanka', <% out.print(Analysis.getSriLankanResidenceStat()); %>],
                    ['Canada', <% out.print(Analysis.getCanadianResidenceStat()); %>]
                ]);

                var options = {};

                var chart = new google.visualization.GeoChart(document.getElementById('regions_div'));

                chart.draw(data, options);
            }
        </script>
    </body>
</html>
