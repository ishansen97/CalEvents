<%@page import="java.sql.*,Log.Activity, java.util.Date;" %>
<!DOCTYPE html>
<html>
<head>
<title>Activity Log</title>
<link rel="icon" href="../External/Images/icon.jpeg">
<%@ include file="Layouts/Styles.jsp" %>
<style>
    .custom-text a{
        color: black !important;
    }

            /* width */
            div::-webkit-scrollbar {
                width: 10px;
            }

            /* Track */
            div::-webkit-scrollbar-track {
                background: rgb(241,241,241); 
            }

            /* Handle */
            div::-webkit-scrollbar-thumb {
                background: rgb(168,168,168);
            }

            /* Handle on hover */
            div::-webkit-scrollbar-thumb:hover {
                background: #888; 
            }
            ::-webkit-scrollbar-button {
                background: #888;
            }
        </style>
<script>  
var request;  
function sendInfo()  
{  
var v=document.log.search.value;  
var url="/${p_nam}/User/Search_Log.jsp?val="+v;  
  
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
          
          <form name="log">
          <div class="row pr-3 pt-4">
              <div class="col-md-2 offset-md-9 pr-0">
                  <input class="form-control rounded-0" type="date" placeholder="Search" name="search">
              </div>
              <div class="col-md-1 pr-1 pl-0">
                  <button class="btn btn-primary btn-block rounded-0" type="button" onclick="sendInfo();">Search</button>
              </div>
          </div>
          </form>
          
          
          
        <div class="row pt-4 pb-5">
            
            <div class="col-md-12 text-center py-md-3">
            <form action="Update-Employee" method="POST">
                <table class="w3-table" id="amit">
                </table>
            </form>
            </div>
  
            <div class="col-md-12 text-center pb-5 py-2" style="height: 71vh; overflow: scroll; overflow-x: hidden">
            <form action="Update-Employee" method="POST">
            <input type="text" value="read_Employee" name="action" hidden>
            
            <table class="w3-table">
              <tr class='w3-blue-gray'>
                <td>Actor</td>
                <td>Activity</td>
                <td>Date</td>
                <td>Time</td>
              </tr>
               

              <% ResultSet res = Activity.readActivity(); %>

              <%while (res.next()) { %>
              
              <tr style="font-family: 'Quicksand', sans-serif; font-size: 19px" class="w3-hover-light-gray custom-text">
                <td style="width: 150px"><button class="btn btn-link" type="submit" name='empId' value="<%=res.getString("actor") %>"><%= res.getString("actor") %></button></td>
                <td><a data-toggle="collapse" style="text-decoration: none" href="#<%= res.getString("id") %>" role="button" aria-expanded="false" aria-controls="collapseExample"><%= res.getString("activity") %></a></td>
                <td style="width: 150px"><%= res.getDate("occurred_on") %></td>
                <td style="width: 120px"><%= res.getTime("occurred_on") %></td>
              </tr>
              <tr style="font-family: 'Quicksand', sans-serif; font-size: 19px;" class="w3-light-gray">
                  <td></td>
                  <td colspan="3">
                    <div class="collapse" id="<%= res.getString("id") %>"><br>
                        <p><%= res.getString("descripition")%></p>
                    </div>
                  </td>
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