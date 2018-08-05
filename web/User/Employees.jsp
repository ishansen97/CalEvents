<%@page import="java.sql.*,Employee.Employee" %>
<!DOCTYPE html>
<html>
<head>
<title>Employees</title>
<%@ include file="Layouts/Styles.jsp" %>
</head>
    
<script>  
var request;  
function sendInfo()  
{  
var v=document.employees.search.value;  
var url="/CalEvents/User/Search.jsp?val="+v;  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('amit').innerHTML=val;  
}  
}  
  
</script> 

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
        <li class="breadcrumb-item active">Employees</li>
      </ol>

      <div class="container-fluid mb-3 bg-white">

        <div class="row">
            <div class="col-md-3 offset-md-9 pt-md-4 pb-md-0">
            <form name="employees">
                <input class="form-control mr-sm-2" type="number" placeholder="Search" name="search" onkeyup="sendInfo()">
            </form>
            </div>
        </div>
          
        <div class="row">
            
            <div class="col-md-12 text-center py-md-3">
            <form action="Update-Employee" method="POST">
                <table class="w3-table w3-striped" id="amit">
                </table>
            </form>
            </div>

            
            <div class="col-md-12 text-center pb-5 py-2">
            <form action="Update-Employee" method="POST">
            <table class="w3-table w3-striped">
                <tr class='w3-blue-gray'>
                <td>EMPID</td>
                <td>Department</td>
                <td>Last Name</td>
                <td></td>
              </tr>
              <input type="text" value="read_Employee" name="action" hidden>
              
              <% ResultSet res = Employee.readEmployees(); %>

              <%while (res.next()) { %>
              
              <tr style="font-family: 'Quicksand', sans-serif; font-size: 17px" class="w3-hover-light-gray">
                <td><%=res.getString(1) %></td>
                <td><%=res.getString("department") %></td>
                <td><%=res.getString("last_name") %></td>
                <td style='width:120px'>
                    <button class='btn btn-warning btn-sm' type='submit' name='empId' value="<%=res.getString("id") %>"><i class='fa fa-edit'></i> Update</button>
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