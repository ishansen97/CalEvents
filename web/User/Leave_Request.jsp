<%@page import="java.sql.*,Employee.Assignment" %>
<!DOCTYPE html>
<html>
<head>
<title>Event Assignment</title>
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
        <li class="breadcrumb-item active">Schedule Leaves</li>
      </ol>

      <div class="container-fluid mb-3 bg-white">
          
        <div class="row py-5">

            
            <div class="col-md-12 text-center pb-5 py-2">
            <form action="Process-Leave" method="POST">
            <input type="text" name="action" value="confirmRequest" hidden>
            <table class="w3-table w3-striped">
                <tr class='w3-blue-gray'>
                <td>EID</td>
                <td>Date</td>
                <td>Type</td>
                <td></td>
              </tr>
             <% 
             ResultSet res =  Attendance.viewUnconfirmedLeaveRequests();
             %>

              <%while (res.next()) { %>
              
              <tr style="font-family: 'Quicksand', sans-serif; font-size: 17px; cursor: default" class="w3-hover-dark-gray">
                <td><%=res.getString("employee_id") %></td>
                <td><%=res.getString("date") %></td>
                <td><%=res.getString("leave_type") %></td>
                <td style='width:120px'>
                    <input type="text" value="<%=res.getString("employee_id")%>" name="empId" hidden>
                    <input type="text" value="<%=res.getString("date")%>" name="date" hidden>
                    <input type="text" value="<%=res.getString("leave_type")%>" name="type" hidden>
                    <button class='btn btn-success btn-sm' type='submit'><i class='fa fa-calendar-check'></i> Confirm</button>
                </td>
              </tr>
             
              <% } %>
               
            </table>
            </form>
            </div>
        </div>
    </div> 
                    
      </div> 
  </div>

<!-- End page content -->
</div>
<%@ include file="Layouts/Scripts.jsp" %>
</body>
</html>