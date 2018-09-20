<%@page import="java.sql.*,Employee.Assignment" %>
<!DOCTYPE html>
<html>
<head>
<title>Update Task</title>
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
        <li class="breadcrumb-item"><a href="Tasks">Event Assignments</a></li>
        <li class="breadcrumb-item active">Update Task</li>
      </ol>

      <div class="container-fluid mb-3 bg-white">

          <div class="row">
              
                <div class="col-lg-6">
                  
                <div class='form-row mb-2 mt-4'>
                    <div class='form-group col-lg-12'>
                    <div class='input-group'>
                      <div class='input-group-prepend'>
                          <div class='input-group-text rounded-0'><i class='fa fa-hashtag'></i></div>
                      </div>
                        <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' readonly value="P101">
                    </div>
                    </div>
                </div>
                    
                <div>
                        
                </div>
                
              </div>
              
              <div class="col-lg-6 pr-lg-5">

                <div class='form-row mb-2 mt-4'>
                    <div class='form-group col-lg-4'>
                    <div class='input-group'>
                      <div class='input-group-prepend'>
                          <div class='input-group-text rounded-0'><i class='fa fa-truck-loading border border-right-0'></i>&nbsp;&nbsp;&nbsp; Facility</div>
                      </div>
                        <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' readonly>
                    </div>
                    </div>
                    <div class='form-group col-lg-8'>
                    <div class='input-group'>
                      <select class="form-control form-control-lg rounded-0" name="department">
                      <% ResultSet res =  Assignment.viewAssignee("Event"); %>
                         <%while (res.next()) { %>
                         <option><%=res.getString("id") %> -  <%=res.getString("first_name") %> <%=res.getString("last_name") %></option>
                      <% } %>
                      </select>
                    </div>
                    </div>
                </div>
                  
                  
                <div class='form-row mb-2 mt-4'>
                    <div class='form-group col-lg-4'>
                    <div class='input-group'>
                      <div class='input-group-prepend border border-right-0 '>
                          <div class='input-group-text rounded-0'><i class='fa fa-utensils border border-right-0'></i>&nbsp;&nbsp;&nbsp; Kitchen</div>
                      </div>
                        <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' readonly>
                    </div>
                    </div>
                    <div class='form-group col-lg-8'>
                    <div class='input-group'>
                      <select class="form-control form-control-lg rounded-0" name="department">
                      <% ResultSet res01 =  Assignment.viewAssignee("Kitchen"); %>
                         <%while (res01.next()) { %>
                         <option><%=res01.getString("id") %> -  <%=res01.getString("first_name") %> <%=res01.getString("last_name") %></option>
                      <% } %>
                      </select>
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
</body>
</html>