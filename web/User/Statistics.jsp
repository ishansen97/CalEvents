<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Employee.Analysis"%>
<%@page import="java.sql.*" %>
<%! 
ResultSet rs;
%>
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

                <div class="container-fluid mb-3 bg-white pb-5">
                    
                    <div class="row">
                        <div class="col-md-5 mt-5 mb-5">
                            <p class="text-center pb-3">Yearly Employment Attendance Count </p>
                            <canvas id="myChart" width="200" height="100"></canvas>
                        </div>
                        <div class="col-md-5 mt-5 mb-5">
                            
                            <p class="text-center pb-3">Yearly Employment Attendance Count </p>
                            <canvas id="myChart02" width="200" height="110"></canvas>
                        </div>
                    </div>

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
        type: 'bar',
        data: {
            labels: ["Event", "Facility", "Gallery", "HR", "Kitchen", "Menu", "Payment"],
            datasets: [{
                    <% 
                        ArrayList<Integer> currentYearlist = new ArrayList<Integer>();
                        rs = Analysis.getYearlyAttendanceCount("YEAR(CURDATE())");
                            while(rs.next()){
                                currentYearlist.add(rs.getInt("Attendance_Count"));
                            }
                        out.print("data : "+currentYearlist); 
                    %>,
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
                    borderWidth: 2
                },
                {
                    <% 
                        ArrayList<Integer> pastYearList = new ArrayList<Integer>();
                        rs = Analysis.getYearlyAttendanceCount("YEAR(CURDATE())-1");
                            while(rs.next()){
                                pastYearList.add(rs.getInt("Attendance_Count"));
                            }
                        out.print("data : "+pastYearList); 
                    %>,
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
                        'rgba(102, 0, 204, 0.6)',
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
                        'rgba(102, 0, 204, 1)',
                        'rgba(204, 0, 204, 1)',
                        'rgba(255, 0, 0, 1)',
                        'rgba(255, 204, 0, 1)',
                        'rgba(51, 153, 255, 1)',
                        'rgba(255, 102, 0, 1)',
                        'rgba(0, 204, 0, 1)'
                    ],
                    hoverBorderWidth: 3,
                    borderWidth: 2
                }
            ]
        },
        options: {
            legend: {
                display: false,
                position: 'right',
            }
        }
    });
</script>
<script>
    var ctx01 = document.getElementById("myChart02").getContext('2d');
    var myChart = new Chart(ctx01, {
        type: 'line',
        data: {
            labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
        datasets: [
            {
                label: "Current Year",
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
                pointHoverRadius:5,
                pointHoverBackgroundColor: "rgba(75,192,192,1)",
                pointHoverBorderColor:"rgba(75,192,192,192,1)",
                pointHoverBorderWidth: 2,
                pointRadius: 1,
                pointHitRadius:10,
                <% 
                    ArrayList<String> currentDepartmentAttendancelist = new ArrayList<String>();
                    rs = Analysis.getMonthlyDepartmentAttendance("YEAR(CURDATE())","Employee");
                        while(rs.next()){
                        currentDepartmentAttendancelist.add("{x:"+rs.getString("Month")+", y:"+rs.getString("Attendance_Count")+"}");
                        }
                    out.print("data : "+currentDepartmentAttendancelist); 
                %>   
            },
            {
                label: "Previous Year",
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
                pointHoverRadius:5,
                pointHoverBackgroundColor: "rgb(102, 0, 204, 1)",
                pointHoverBorderColor:"rgb(102, 0, 204, 1)",
                pointHoverBorderWidth: 2,
                pointRadius: 1,
                pointHitRadius:10,
                <% 
                    ArrayList<String> previousDepartmentAttendancelist = new ArrayList<String>();
                    rs = Analysis.getMonthlyDepartmentAttendance("YEAR(CURDATE())-1","Employee");
                        while(rs.next()){
                        previousDepartmentAttendancelist.add("{x:"+rs.getString("Month")+", y:"+rs.getString("Attendance_Count")+"}");
                        }
                    out.print("data : "+previousDepartmentAttendancelist); 
                %>
            }
        ]
        },
        options: {
            responsive: true,
        legend: {
            display: true,
            position: "bottom",
            labels: {
                fontColor: "#333",
                fontSize: 16
            }
        }
        }
    });
</script>
</body>
</html>