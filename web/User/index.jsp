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
            <div class="col-md-7 ">
                
            <div id="piechart"></div>

            <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

            <script type="text/javascript">
            // Load google charts
            google.charts.load('current', {'packages':['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            // Draw the chart and set the chart values
            function drawChart() {
              var data = google.visualization.arrayToDataTable([
              ['Task', 'Hours per Day'],
              ['Event', <% out.print(Data.getDepartmentCount("Event Department")); %>],
              ['Menu', <% out.print(Data.getDepartmentCount("Menu Department")); %>],
              ['Payment', <% out.print(Data.getDepartmentCount("Payment Department")); %>],
              ['Facility', <% out.print(Data.getDepartmentCount("Facility Department")); %>],
              ['Kitchen', <% out.print(Data.getDepartmentCount("Kitchen Department")); %>],
              ['Gallery', <% out.print(Data.getDepartmentCount("Gallery Department")); %>],
              ['Customer', <% out.print(Data.getDepartmentCount("Customer Department")); %>],
              ['Employee', <% out.print(Data.getDepartmentCount("Employee Department")); %>]
            ]);

              // Optional; add a title and set the width and height of the chart
              var options = {'title':'Department Employees', 'height':600};

              // Display the chart inside the <div> element with id="piechart"
              var chart = new google.visualization.PieChart(document.getElementById('piechart'));
              chart.draw(data, options);
            }
            </script>
            </div>
            <div class="col pr-5 pt-5">
                <h5 class="pb-3">Feeds</h5>
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
                  </table>
            </div>
        </div>
  
    </div>
      
  </div>

<!-- End page content -->
</div>
<%@ include file="Layouts/Scripts.jsp" %>
</body>
</html>
