<%@page import="java.sql.*,Employee.Employee" %>
<!DOCTYPE html>
<html>
<head>
<title>New Employee</title>
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
          <a href="../Lecturer">Dashboard</a>
        </li>
        <li class="breadcrumb-item">Employee</li>
        <li class="breadcrumb-item active">New Employee</li>
      </ol>

      <div class="container-fluid mb-3 bg-white">
        <form action="Process-Employee" method="POST" enctype="multipart/form-data">
            
        <div class="row">
            <div class="col-md-6"></div>
            <div class="col-md-6 bg-light"><button type="submit" name="action" value="add_employee" class="btn btn-lg btn-outline-success float-right rounded-0 mt-4">Add employee</button>
            </div>
        </div>
          
        <div class="row">
            
            <div class="col-md-6 px-5 pb-5">
                
            <div class='form-row mb-2 mt-4'>
                <div class='form-group col-lg-4'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-id-card'></i></div>
                  </div>
                    <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='id' value="${empId}" readonly >
                </div>
                </div>
                <div class='form-group col-lg-8'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-building'></i></div>
                  </div>
                  <select class="form-control border border-left-0 form-control-lg rounded-0" name="department" >
                    <option>Choose a Department</option>
                    <option>Event Department</option>
                    <option>Menu Department</option>
                    <option>Payment Department</option>
                    <option>Facility Department</option>
                    <option>Kitchen Department</option>
                    <option>Gallery Department</option>
                    <option>Customer Department</option>
                    <option>Employee Department</option>
                  </select>
                </div>
                </div>
             </div>
                
            <div class='form-row mb-2'>
              <div class='form-group col-lg-12'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-unlock-alt'></i></div>
                  </div>
                  <select class="form-control border border-left-0 form-control-lg rounded-0" name="privilege_mode" >
                    <option>Choose Privilege Mode</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                  </select>
                </div>
              </div>
             </div> 
                
            <div class='form-row mb-2'>
              <div class='form-group col-lg-12'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-envelope'></i></div>
                  </div>
                  <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='username' placeholder="Mail address" >
                </div>
              </div>
             </div> 
                
            <div class='form-row mb-2'>
              <div class='form-group col-lg-12'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-passport pr-1'></i></div>
                  </div>
                  <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='nic' placeholder="Passport / NIC" >
                </div>
              </div>
             </div>  

            <div class='form-row mb-2'>
              <div class='form-group col-lg-6'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-user pr-1'></i></div>
                  </div>
                    <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='first_name' placeholder="First name" >
                </div>
              </div>
              <div class='form-group col-lg-6'>
                <input type='text' class='form-control rounded-0 form-control-lg' name='last_name' placeholder="Last name" >
              </div>  
             </div>
                
            <div class='form-row mb-2'>
              <div class='form-group col-lg-12'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-male pr-2'></i></div>
                  </div>
                    <select class="form-control border border-left-0 form-control-lg rounded-0" name="gender" >
                    <option>Choose Gender</option>
                    <option>Male</option>
                    <option>Female</option>
                  </select>
                </div>
              </div>
             </div>  
                
            <div class='form-row mb-2'>
              <div class='form-group col-lg-12'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-home'></i></div>
                  </div>
                  <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='address_line_01' placeholder="Address line 01" >
                </div>
              </div>
             </div>  
                
            <div class='form-row mb-2'>
              <div class='form-group col-lg-12'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-home'></i></div>
                  </div>
                    <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='address_line_02' placeholder="Address line 02" >
                </div>
              </div>
             </div>  
                   
            <div class='form-row mb-2'>
              <div class='form-group col-lg-4'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-map-marker pr-1'></i></div>
                  </div>
                    <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='city' placeholder="City / Town" >
                </div>
              </div>
              <div class='form-group col-lg-4'>
                  <input type='text' class='form-control rounded-0 form-control-lg' name='zip' placeholder="Postal Code" >
              </div>
              <div class='form-group col-lg-4'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-globe-asia'></i></div>
                  </div>
                    <select class="form-control border border-left-0 form-control-lg rounded-0" name="country" >
                    <option>Choose Country</option>
                    <option>Canada</option>
                    <option>Sri Lanka</option>
                  </select>
                </div>
              </div>
             </div>  

            <div class='form-row mb-2'>
              <div class='form-group col-lg-12'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-phone'></i></div>
                  </div>
                    <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='contact_number' placeholder="Contact number" >
                </div>
              </div>
             </div>  
                
            </div>
            
            <div class="col-md-6 text-center pb-5 bg-light">
                
            <script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
            <div class="file-upload">

              <div class="image-upload-wrap px-5">
                <input class="file-upload-input" onchange="readURL(this);" type="file" name="avatar" size="4000000" accept="image/x-png,image/jpg,image/jpeg">
                <div class="drag-text py-5">
                    <img src="../External/Images/avatar_1.png" alt="avatar" class="img-fluid pb-5" style="max-height: 400px">
                  <h3>choose avatar to upload</h3>
                  <h3>Or</h3>
                  <h3>Drag and drop</h3>
                </div>
              </div>
              <div class="file-upload-content">
                <img class="file-upload-image" alt="your image">
                <div class="image-title-wrap">
                  <button type="button" onclick="removeUpload()" class="remove-image">Remove Image</button>
                </div>
              </div>
            </div>
            </div>

        </div>
                
        <div class="row">
            <div class="col-md-6"></div>
            <div class="col-md-6 bg-light py-2"></div>
        </div>
                
        </form>
      </div> 
  </div>

<!-- End page content -->
</div>
<%@ include file="Layouts/Scripts.jsp" %>
</body>
</html>