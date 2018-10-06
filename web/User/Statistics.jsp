<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Employee.Analysis"%>
<%@page import="java.sql.*" %>
<%
ResultSet rs;
String department;
if(request.getParameter("d_name") != null){
    department = request.getParameter("d_name");
}else{
    department = "Employee";
}
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

                <div class="container-fluid mb-3 bg-light pb-5">
                    
                    <div class="row">
                        <div class="col-md-12">
                            <form action="" method="POST">
                                <div class="row pr-3 pt-4">
                                    <div class="col-md-2 offset-md-9 pr-0">
                                        <select class="form-control border rounded-0" name="d_name">
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
                                        <button class="btn btn-primary btn-block rounded-0" type="submit">Search</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8 mt-3">
                            <canvas class="w3-card p-2 bg-white" id="myChart02" width="200" height="80"></canvas>
                        </div>
                        <div class="col mt-3 ">
                            <div class="w3-card bg-white pt-3 px-3 pb-2 mb-3">
                                <div class="w3-card bg-white pt-3 pl-4 pb-2 mb-3">
                                <p><% 
                                    int noOfEmployees = Analysis.getDepartmentEmployment(department);
                                        out.print("<i class='fas fa-users fa-2x text-primary'> "+noOfEmployees+"</i> <span style='font-size: 18px'> no of employees employeed<span>");
                                    %></p>
                                </div>
                                <div class="w3-card bg-white pt-3 pl-4 pb-2 mb-3">
                                    <p><% 
                                        double employeeStat = Analysis.getYearStatDepartmentAttendance(department);
                                        DecimalFormat numberFormat = new DecimalFormat("#.00");
                                        if (employeeStat >= 0) {
                                            out.print("<i class='fas fa-arrow-up fa-2x text-success'> " + numberFormat.format(employeeStat) + "%</i> <span style='font-size: 18px'>rise in employment rate from last to this year<span>");
                                        } else {
                                            out.print("<i class='fas fa-arrow-down fa-2x text-danger'> " + numberFormat.format(employeeStat) + "%</i> <span style='font-size: 18px'>fall in employment rate from last to this year<span>");
                                        }
                                        %></p>
                                </div>
                                <div class="w3-card bg-white pt-3 pl-4 pb-2 mb-3">
                                    <p><%                                    
                                        Double noOfLeaves = Analysis.getDepartmentLeaveCount(department);
                                        if (noOfLeaves > 0.1) {
                                            out.print("<i class='fas fa-arrow-up fa-2x text-danger'> " + numberFormat.format(noOfLeaves) + "%</i> <span style='font-size: 18px'>rise in scheduled leaves rate this year<span>");
                                        } else {
                                            out.print("<i class='fas fa-arrow-down fa-2x text-success'> " + numberFormat.format(noOfLeaves) + "%</i> <span style='font-size: 18px'>fall in scheduled leaves rate this year<span>");
                                        }
                                        %></p>
                                </div>
                                <div class="w3-card bg-white pt-3 pl-4 pb-2 mb-3">
                                    <p><%
                                        int noOfNewEmployees = Analysis.getYearStatDepartmentEmployment(department);
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
        </div> 

    </div> 

    <!-- End page content -->
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
                pointHoverRadius:5,
                pointHoverBackgroundColor: "rgba(75,192,192,1)",
                pointHoverBorderColor:"rgba(75,192,192,192,1)",
                pointHoverBorderWidth: 2,
                pointRadius: 1,
                pointHitRadius:10,
                <% 
                    ArrayList<String> currentDepartmentAttendancelist = new ArrayList<String>();
                    rs = Analysis.getMonthlyDepartmentAttendance("YEAR(CURDATE())",department);
                        while(rs.next()){
                        currentDepartmentAttendancelist.add("{x:"+rs.getString("Month")+", y:"+rs.getString("Attendance_Count")+"}");
                        }
                    out.print("data : "+currentDepartmentAttendancelist); 
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
                pointHoverRadius:5,
                pointHoverBackgroundColor: "rgb(102, 0, 204, 1)",
                pointHoverBorderColor:"rgb(102, 0, 204, 1)",
                pointHoverBorderWidth: 2,
                pointRadius: 1,
                pointHitRadius:10,
                <% 
                    ArrayList<String> previousDepartmentAttendancelist = new ArrayList<String>();
                    rs = Analysis.getMonthlyDepartmentAttendance("YEAR(CURDATE())-1",department);
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