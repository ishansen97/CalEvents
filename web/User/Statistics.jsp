<%@page import="Employee.Performance"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Employee.Analysis"%>
<%@page import="java.sql.*" %>
<%
    ResultSet rs;
    String department;
    if (request.getParameter("d_name") != null) {
        department = request.getParameter("d_name");
    } else {
        department = "Employee";
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Statistics</title>
        <link rel="icon" href="../External/Images/icon.jpeg">
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

                    <div class="row pb-2">
                        <div class="col-md-12">
                            <form action="" method="POST">
                                <div class="row pr-3 pt-4">
                                    <div class="col-md-2 offset-md-9 pr-0">
                                        <select class="form-control form-control-lg border rounded-0" name="d_name">
                                            <option>Event</option>
                                            <option>Menu</option>
                                            <option>Payment</option>
                                            <option>Facility</option>
                                            <option>Kitchen</option>
                                            <option>Gallery</option>
                                            <option>Customer</option>
                                            <option>Employee</option>
                                        </select>
                                    </div>
                                    <div class="col-md-1 pr-1 pl-0">
                                        <button class="btn btn-primary btn-lg btn-block rounded-0" type="submit">Search</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-8">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="w3-card bg-white text-center">
                                        <div class="card-header bg-secondary text-white">
                                            <% out.print(department); %> Department Attendance Statistics
                                            <% out.print(Analysis.getDepartmentEmploymentStat(department)); %>
                                            
                                        </div>
                                        <div class="card-body p-3">
                                            <canvas id="Chart01" width="200" height="80"></canvas>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="w3-card bg-white mt-3 pb-4 mb-3">
                                        <div class="card-header bg-secondary text-white text-center">
                                            <% out.print(department); %> Department Yearly Statistics
                                        </div>
                                        <div class="card-body p-3">
                                            <div class="w3-card bg-white pt-3 pl-4 pb-2 mb-3">
                                                <p><%
                                                    int noOfEmployees = Analysis.getDepartmentEmployment(department);
                                                    out.print("<i class='fas fa-users fa-2x text-primary'> " + noOfEmployees + "</i> <span style='font-size: 18px'> no of employees employeed<span>");
                                                    %></p>
                                            </div>
                                            <div class="w3-card bg-white pt-3 pl-4 pb-2 mb-3">
                                                <p><%
                                                    double employeeStat = Analysis.getYearStatDepartmentAttendance(department);
                                                    DecimalFormat numberFormat = new DecimalFormat("#.00");
                                                    double newAttendanceStat;
                                                    if (employeeStat >= 0) {
                                                        newAttendanceStat = employeeStat*100;
                                                        out.print("<i class='fas fa-arrow-up fa-2x text-success'> " + numberFormat.format(newAttendanceStat) + "%</i> <span style='font-size: 18px'>rise in employment rate<span>");
                                                    } else {
                                                        newAttendanceStat = employeeStat*-100;
                                                        out.print("<i class='fas fa-arrow-down fa-2x text-danger'> " + numberFormat.format(newAttendanceStat) + "%</i> <span style='font-size: 18px'>fall in employment rate<span>");
                                                    }
                                                    %></p>
                                            </div>
                                            <div class="w3-card bg-white pt-3 pl-4 pb-2 mb-3">
                                                <p><%
                                                    Double noOfLeaves = Analysis.getDepartmentLeaveCount(department);
                                                    double newLeaveCount;
                                                    if (noOfLeaves >= 0) {
                                                        newLeaveCount = noOfLeaves*100;
                                                         out.print("<i class='fas fa-arrow-up fa-2x text-danger'> " + numberFormat.format(newLeaveCount) + "%</i> <span style='font-size: 18px'>rise in scheduled leaves rate this year<span>");
                                                    } else {
                                                        newLeaveCount = noOfLeaves*-100;
                                                        out.print("<i class='fas fa-arrow-down fa-2x text-success'> " + numberFormat.format(newLeaveCount) + "%</i> <span style='font-size: 18px'>fall in scheduled leaves rate this year<span>");
                                                    }
                                                    %></p>
                                            </div>
                                            <div class="w3-card bg-white pt-3 pl-4 pb-2 mb-3">
                                                <p><%
                                                    int noOfNewEmployees = Analysis.getDepartmentEmployment(department);
                                                    if (noOfNewEmployees >= 0) {
                                                        out.print("<i class='fas fa-arrow-up fa-2x text-success'> " + noOfNewEmployees + "</i> <span style='font-size: 18px'> no of employee(s) recruited<span>");
                                                    }
                                                    %></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">

                            <div class="w3-card bg-white text-center mb-3">
                                <div class="card-header text-center bg-secondary text-white">
                                    <% out.print(department); %> Department Annual Scheduled Leaves
                                </div>
                                <div class="card-body p-2">
                                    <canvas class="pt-2" id="Chart02" width="200" height="110"></canvas>
                                </div>
                            </div>

                            <div class="w3-card bg-white text-center mb-3">
                                <div class="card-header text-center bg-secondary text-white">
                                    <% out.print(department); %> Department Annual Employment
                                </div>
                                <div class="card-body p-2">
                                    <canvas class="pt-2" id="Chart03" width="200" height="110"></canvas>
                                </div>
                            </div>

                            <div class="w3-card bg-white text-center mb-3">
                                <div class="card-header text-center bg-secondary text-white">
                                    <% out.print(department);
                                    %> Department Employment Ratio
                                </div>
                                <div class="card-body p-2">
                                    <canvas class="pt-2" id="Chart04" width="200" height="110"></canvas>
                                </div>
                            </div>

                        </div>
                    </div>          
                </div>
            </div>
        </div> 
        <%@ include file="Layouts/Scripts.jsp" %>
        <script>
            //Chart 01
            var ctx01 = document.getElementById("Chart01").getContext('2d');
            var myChart = new Chart(ctx01, {
                type: 'line',
                data: {
                    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                    datasets: [
                        {
                            label: "Current",
                            fill: false,
                            lineTension: 0.1,
                            backgroundColor: "rgba(75, 192, 192, 0.4)",
                            borderColor: "rgba(75,192,192,1)",
                            borderCapStyle: 'butt',
                            borderDash: [],
                            borderDashOffset: 0.0,
                            borderJoinStyle: 'mitter',
                            pointBorderColor: "rgba(75,192,192,1)",
                            pointBackgroundColor: "#fff",
                            pointBorderWidth: 1,
                            pointHoverRadius: 5,
                            pointHoverBackgroundColor: "rgba(75,192,192,1)",
                            pointHoverBorderColor: "rgba(75,192,192,192,1)",
                            pointHoverBorderWidth: 2,
                            pointRadius: 1,
                            pointHitRadius: 10,
            <%
                ArrayList<String> currentDepartmentAttendancelist = new ArrayList<String>();
                rs = Analysis.getMonthlyDepartmentAttendance("YEAR(CURDATE())", department);
                while (rs.next()) {
                    currentDepartmentAttendancelist.add("{x:" + rs.getString("Month") + ", y:" + rs.getString("Attendance_Count") + "}");
                }
                out.print("data : " + currentDepartmentAttendancelist);
            %>
                        },
                        {
                            label: "Previous",
                            fill: false,
                            lineTension: 0.1,
                            backgroundColor: "rgb(102, 0, 204, 0.4)",
                            borderColor: "rgb(102, 0, 204, 1)",
                            borderCapStyle: 'butt',
                            borderDash: [],
                            borderDashOffset: 0.0,
                            borderJoinStyle: 'mitter',
                            pointBorderColor: "rgb(102, 0, 204, 1)",
                            pointBackgroundColor: "#fff",
                            pointBorderWidth: 1,
                            pointHoverRadius: 5,
                            pointHoverBackgroundColor: "rgb(102, 0, 204, 1)",
                            pointHoverBorderColor: "rgb(102, 0, 204, 1)",
                            pointHoverBorderWidth: 2,
                            pointRadius: 1,
                            pointHitRadius: 10,
            <%
                ArrayList<String> previousDepartmentAttendancelist = new ArrayList<String>();
                rs = Analysis.getMonthlyDepartmentAttendance("YEAR(CURDATE())-1", "Employee");
                while (rs.next()) {
                    previousDepartmentAttendancelist.add("{x:" + rs.getString("Month") + ", y:" + rs.getString("Attendance_Count") + "}");
                }
                out.print("data : " + previousDepartmentAttendancelist);
            %>
                        }
                    ]
                },
                options: {
                    legend: {
                        display: true,
                        position: "top",
                        labels: {
                            fontColor: "#333",
                            fontSize: 16
                        }
                    },
                    scales: {
                        yAxes: [{
                                scaleLabel: {
                                    display: true,
                                    labelString: 'No of Employees',
                                    fontSize: 15
                                }
                            }],
                        xAxes: [{
                                scaleLabel: {
                                    display: true,
                                    labelString: 'Months in Year',
                                    fontSize: 15
                                }
                            }]
                    }
                }
            });
            //End of chart 01


            //Chart 02
            var ctx01 = document.getElementById("Chart02").getContext('2d');
            var myChart = new Chart(ctx01, {
                type: 'doughnut',
                data: {
                    labels: ["Current Year", "Last Year"],
                    datasets: [
                        {
                            data: [<% out.print(Analysis.getDepartmentLeaveStat(department)); %>],
                            backgroundColor: [
                                'rgb(255, 0, 0, 0.7)',
                                'rgb(255, 204, 0, 0.7)'
                            ],
                            borderColor: [
                                'rgb(255, 0, 0, 1)',
                                'rgb(255, 204, 0, 1)'
                            ],
                            hoverBackgroundColor: [
                                'rgb(255, 0, 0, 1)',
                                'rgb(255, 204, 0, 1)'
                            ],
                            hoverBorderColor: [
                                'rgb(255, 0, 0, 1)',
                                'rgb(255, 204, 0, 1)'
                            ],
                            hoverBorderWidth: 3,
                            label: 'Employment Count',
                            borderWidth: 2
                        }
                    ]
                },
                options: {
                    responsive: true,
                    legend: {
                        display: true,
                        position: "top",
                        labels: {
                            fontColor: "#333",
                            fontSize: 16
                        }
                    }
                }
            });
            //End of chart 02



            //Chart 03
            var ctx01 = document.getElementById("Chart03").getContext('2d');
            var myChart = new Chart(ctx01, {
                type: 'doughnut',
                data: {
                    labels: ["Employeed", "Terminated"],
                    datasets: [
                        {
                            data: [<% out.print(Analysis.getYearStatDepartmentEmployment(department)); %>],
                            backgroundColor: [
                                'rgb(105,180,255, 0.8)',
                                'rgb(255,105,180, 0.8)'
                            ],
                            borderColor: [
                                'rgb(105,180,255, 1)',
                                'rgb(255,105,180, 1)'
                            ],
                            hoverBackgroundColor: [
                                'rgb(105,180,255, 1)',
                                'rgb(255,105,180, 1)'
                            ],
                            hoverBorderColor: [
                                'rgb(105,180,255, 1)',
                                'rgb(255,105,180, 1)'
                            ],
                            hoverBorderWidth: 3,
                            label: 'Employment Count',
                            borderWidth: 2
                        }
                    ]
                },
                options: {
                    responsive: true,
                    legend: {
                        display: true,
                        position: "top",
                        labels: {
                            fontColor: "#333",
                            fontSize: 16
                        }
                    }
                }
            });
            //End of chart 03


            //Chart 04
            var ctx01 = document.getElementById("Chart04").getContext('2d');
            var myChart = new Chart(ctx01, {
                type: 'doughnut',
                data: {
                    labels: ["Male", "Female"],
                    datasets: [
                        {
                            data: [<% out.print(Analysis.getDepartmentGenderStat(department)); %>],
                            backgroundColor: [
                                'rgb(16,169,244, 0.7)',
                                'rgb(173,244,16, 0.7)'
                            ],
                            borderColor: [
                                'rgb(16,169,244, 1)',
                                'rgb(173,244,16, 1)'
                            ],
                            hoverBackgroundColor: [
                                'rgb(16,169,244, 1)',
                                'rgb(173,244,16, 1)'
                            ],
                            hoverBorderColor: [
                                'rgb(16,169,244, 1)',
                                'rgb(173,244,16, 1)'
                            ],
                            hoverBorderWidth: 3,
                            label: 'Employment Count',
                            borderWidth: 2
                        }
                    ]
                },
                options: {
                    responsive: true,
                    legend: {
                        display: true,
                        position: "top",
                        labels: {
                            fontColor: "#333",
                            fontSize: 16
                        }
                    }
                }
            });
            //End of chart 04
        </script>
    </body>
</html>
