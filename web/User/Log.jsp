<%@page import="java.sql.*,Log.Activity, java.util.Date;" %>
<!DOCTYPE html>
<html>
<head>
<title>Activity Log</title>
<%@ include file="Layouts/Styles.jsp" %>
<script>  
var request;  
function sendInfo()  
{  
var v=document.employees.search.value;  
var url="/CalEvents/User/Search_Log.jsp?val="+v;  
  
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
        <li class="breadcrumb-item active">Activity Log</li>
      </ol>

      <div class="container-fluid mb-3 bg-white">
          
        <div class="row">
            <div class="col-md-3 offset-md-9 pt-md-4 pb-md-0">
            <form name="employees">
                <input class="form-control mr-sm-2" type="date" placeholder="Search" name="search" onkeyup="sendInfo()">
            </form>
            </div>
        </div>
          
        <div class="row pt-4">
            
            <div class="col-md-12 text-center py-md-3">
            <form action="Update-Employee" method="POST">
                <table class="w3-table w3-striped" id="amit">
                </table>
            </form>
            </div>
  
            <div class="col-md-12 text-center pb-5 py-2">
            <form action="Update-Employee" method="POST">
            <input type="text" value="read_Employee" name="action" hidden>
            
            <table class="w3-table w3-bordered w3-hoverable">
                <tr class='w3-blue-gray'>
                <td>Actor</td>
                <td>Activity</td>
                <td>Date</td>
                <td>Time</td>
              </tr>
               

              <% ResultSet res = Activity.readActivity(); %>

              <%while (res.next()) { %>
              
              <tr style="font-family: 'Quicksand', sans-serif; font-size: 17px" class="w3-hover-light-gray">
                <td style="width: 150px"><button class="btn btn-link" type="submit" name='empId' value="<%=res.getString("actor") %>"><%= res.getString("actor") %></button></td>
                <td><%= res.getString("activity") %></td>
                <td style="width: 150px"><%= res.getDate("occurred_on") %></td>
                <td style="width: 120px"><%= res.getTime("occurred_on") %></td>
              </tr>
             
              <% } %>
              
              
              
            </table> 
            </form>
            </div>
        </div>
    </div> 
                    
      </div> 

<!-- End page content -->
</div>
<%@ include file="Layouts/Scripts.jsp" %>
</body>
</html>