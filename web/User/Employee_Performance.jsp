<%@page import="java.sql.ResultSet"%>
<%@page import="Employee.Analysis"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Employee.Performance"%>
<%@page import="Employee.Data"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Dashboard</title>
        <link rel="icon" href="../External/Images/icon.jpeg">
        <%@ include file="Layouts/Styles.jsp" %>
    </head>

    <body class="bg-secondary">
        <%
        ResultSet rs = null;
        %>

        <%@ include file="Layouts/Navigation.jsp" %>
        <%            String empid = request.getParameter("empid");
        %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">


            <div class="container-fluid"  style="padding-top:22px">
                <!-- Breadcrumbs-->
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="Dashboard">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item active">Employee Performance</li>
                </ol>

                <div class="container-fluid mb-3 bg-white">
                    <div class="row pl-3">
                        <div class="col-md-6 my-4">
                            <div class="w3-card bg-white pt-4 pl-4 pb-5 mb-3">
                                <%
                                    Object avatar = request.getSession(false).getAttribute("avatar").toString();
                                %>
                                <div class="row">
                                    <div class="col-md-4 pt-4">
                                        <img src="${avatar}" class="img-fluid">
                                    </div>
                                    <div class="col-md-8">
                                        <table class="mt-3 w3-table" style="font-size:17px">
                                            <tr>
                                                <td class="py-2">Employee Identification </td>
                                                <td>: ${id}</td>
                                            </tr>

                                            <tr>
                                                <td class="py-2">Full name </td>
                                                <td>: ${first_name} ${last_name}</td>
                                            </tr>
                                            <tr>
                                                <td class="py-2">Department </td>
                                                <td>: ${department}</td>
                                            </tr>
                                            <tr>
                                                <td class="py-2">DOE </td>
                                                <td>: ${doe}</td>
                                            </tr>
                                            <tr>
                                                <td class="py-2">Country </td>
                                                <td>: ${country}</td>
                                            </tr>
                                            <tr>
                                                <td class="py-2">Contact </td>
                                                <td>: ${contact_number}</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 my-4">
                            <div class="w3-card bg-white pt-3 pb-3 mb-3 pl-4">
                                <p style="font-size:19px" class="text-center">Employee Attendance Statistics</p>
                                <table class="mt-3 w3-table" style="font-size:18px">


                                    <tr>
                                        <td class="py-2">No of days reported this year</td>
                                        <td>: 
                                            <%
                                                out.print(Performance.getEmployeeThisYearAttendanceCount(empid)+" days");
                                            %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="py-2">No of days reported last year</td>
                                        <td>: 
                                            <%
                                                out.print(Performance.getEmployeeLastYearAttendanceCount(empid)+" days");
                                            %>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="py-2">Percentage in reported days</td>
                                        <td>: 
                                            <%                                                
                                                DecimalFormat numberFormat = new DecimalFormat("#.00");
                                                Double attendanceStat = Performance.getEmployeeYearlyAttendanceStat(empid);
                                                double newAttCount;
                                                if (attendanceStat >= 0) {
                                                    newAttCount = attendanceStat*100;
                                                    out.print("<i class='fas fa-arrow-up text-success'> " + numberFormat.format(newAttCount) + "%</i>");
                                                } else {
                                                    newAttCount = attendanceStat*-100;
                                                    out.print("<i class='fas fa-arrow-down text-danger'> " + numberFormat.format(newAttCount) + "%</i>");
                                                }
                                            %></td>
                                    </tr>
                                    <tr>
                                        <td class="py-2">No of scheduled leaves this year</td>
                                        <td>: 
                                            <%
                                                out.print(Performance.getEmployeeThisYearLeaveCount(empid)+" day(s)");
                                            %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="py-2">No of scheduled leaves last year</td>
                                        <td>: 
                                            <%
                                                out.print(Performance.getEmployeeLastYearLeaveCount(empid)+" day(s)");
                                            %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="py-2">Recorded percentage in leaves</td>
                                        <td>: 
                                            <%
                                                Double leaveStat = Performance.getEmployeeLeaveStat(empid);
                                                if (leaveStat <= 0) {
                                                    out.print("<i class='fas fa-arrow-up text-success'> " + numberFormat.format(leaveStat) + "%</i>");
                                                } else {
                                                    out.print("<i class='fas fa-arrow-down text-danger'> " + numberFormat.format(leaveStat) + "%</i>");
                                                }
                                            %></td>
                                    </tr>
                                </table>
                            </div>
                        </div>


                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="w3-card p-2 bg-white text-center">
                                <p>Attendance Statistics</p>
                                <canvas class="pt-2" id="myChart02" width="170" height="50"></canvas>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
            <%@ include file="Layouts/Scripts.jsp" %>
            <script>
    var ctx01 = document.getElementById("myChart02").getContext('2d');
    var myChart = new Chart(ctx01, {
        type: 'line',
        data: {
            labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
            datasets: [
                {
                    label: "Current",
                    fill: false,
                    lineTension: 0.1,
                    backgroundColor: "rgba(75, 192, 192, 0.6)",
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
        rs = Performance.getMonthlyEmployeeAttendance("YEAR(CURDATE())", empid);
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
                    backgroundColor: "rgb(102, 0, 204, 0.6)",
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
        rs = Performance.getMonthlyEmployeeAttendance("YEAR(CURDATE())-1", empid);
        while (rs.next()) {
            previousDepartmentAttendancelist.add("{x:" + rs.getString("Month") + ", y:" + rs.getString("Attendance_Count") + "}");
        }
        out.print("data : " + previousDepartmentAttendancelist);
    %>
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
</script>
    </body>
</html>
