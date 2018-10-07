<%@page import="Employee.Data"%>
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
                        <div class="col-md-12">
                            <div class="w3-row-padding w3-margin-bottom w3-margin-top">


                                <div class="w3-quarter">
                                    <a href="Tasks">
                                        <div class="w3-container w3-red w3-padding-16 custom-red-hover">
                                            <div class="w3-left"><i class="fa fa-calendar-alt w3-xxxlarge"></i></div>
                                            <div class="w3-right">
                                            </div>
                                            <div class="w3-clear"></div>
                                            <h4 class="pt-3">Events</h4>
                                        </div>
                                    </a>
                                </div>


                                <div class="w3-quarter">
                                    <a href="Employees">
                                        <div class="w3-container w3-blue w3-padding-16 custom-blue-hover">
                                            <div class="w3-left"><i class="fa fa-comment w3-xxxlarge"></i></div>
                                            <div class="w3-right">
                                            </div>
                                            <div class="w3-clear"></div>
                                            <h4 class="pt-3">Feedback</h4>
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
                        <div class="col-md-5 mt-5 mb-5">
                            <p class="text-center pb-3">Employment Count </p>
                            <canvas id="myChart" width="200" height="100"></canvas>

                        </div>
                        <div class="col-3 pr-5 pl-1 pt-5 offset-md-4">
                            <div class="card">
                                <div class="card-header">Business Operating Hours</div>
                                <div class="card-body">
                                    <form action="Update-Hours" method="POST">
                                    <div class="form-group">
                                        <label>Opening Hour</label>
                                        <input type="time" name="openingTime" class="form-control form-control-lg" value="<% out.print(Business.getBusinessOpeningTime()); %>">
                                    </div>
                                    <div class="form-group">
                                        <label>Closing Hour</label>
                                        <input type="time" name="closingTime" class="form-control form-control-lg" value="<% out.print(Business.getBusinessClosingTime()); %>">
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
            var ctx = document.getElementById("myChart").getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'polarArea',
                data: {
                    labels: ["Event", "Menu", "Payment", "Facility", "Human Resource", "Kitchen", "Gallery"],
                    datasets: [{
                            data: [<% out.print(Data.getDepartmentCount("Event Department")); %>,
                                    <% out.print(Data.getDepartmentCount("Menu Department")); %>,
                                    <% out.print(Data.getDepartmentCount("Payment Department")); %>,
                                    <% out.print(Data.getDepartmentCount("Facility Department")); %>,
                                    <% out.print(Data.getDepartmentCount("Employee Department")); %>,
                                    <% out.print(Data.getDepartmentCount("Kitchen Department")); %>,
                                    <% out.print(Data.getDepartmentCount("Gallery Department"));%>],
                            backgroundColor: [
                                'rgb(102, 0, 204, 0.4)',
                                'rgb(204, 0, 204, 0.4)',
                                'rgb(255, 0, 0, 0.4)',
                                'rgb(255, 204, 0, 0.4)',
                                'rgba(51, 153, 255, 0.4)',
                                'rgba(255, 102, 0, 0.4)',
                                'rgba(0, 204, 0, 0.4)'
                            ],
                            borderColor: [
                                'rgba(102, 0, 204, 255, 0.6)',
                                'rgba(204, 0, 204, 0.6)',
                                'rgba(255, 0, 0, 0.6)',
                                'rgba(255, 204, 0, 0.6)',
                                'rgba(51, 153, 255, 0.6)',
                                'rgba(255, 102, 0, 0.6)',
                                'rgba(0, 204, 0, 0.6)'
                            ],
                            hoverBackgroundColor: [
                                'rgb(102, 0, 204, 0.8)',
                                'rgb(204, 0, 204, 0.8)',
                                'rgb(255, 0, 0, 0.8)',
                                'rgb(255, 204, 0, 0.8)',
                                'rgba(51, 153, 255, 0.8)',
                                'rgba(255, 102, 0, 0.8)',
                                'rgba(0, 204, 0, 0.8)'
                            ],
                            hoverBorderColor: [
                                'rgba(102, 0, 204, 255, 1)',
                                'rgba(204, 0, 204, 1)',
                                'rgba(255, 0, 0, 1)',
                                'rgba(255, 204, 0, 1)',
                                'rgba(51, 153, 255, 1)',
                                'rgba(255, 102, 0, 1)',
                                'rgba(0, 204, 0, 1)'
                            ],
                            hoverBorderWidth: 3,
                            label: 'Employment Count',
                            borderWidth: 2
                        }]
                },
                options: {
                    legend: {
                        display: true,
                        position: 'right',
                    }
                }
            });
        </script>
    </body>
</html>
