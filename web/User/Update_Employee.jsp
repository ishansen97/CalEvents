<!DOCTYPE html>
<html>
<head>
<title>Update Employee</title>
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
        <li class="breadcrumb-item">
            <a href="Employees">Employees</a>
        </li>
        <li class="breadcrumb-item active">Update Employee</li>
      </ol>

      <div class="container-fluid mb-3 bg-white">
        <form action="Process-Employee" method="POST" enctype="multipart/form-data">
            
        <div class="row">
            <div class="col-md-6"></div>
            <div class="col-md-6 bg-light">
                <button type="submit" name="action" value="update_employee" class="btn btn-outline-warning float-right rounded-0 mt-4 ml-3"><i class="fa fa-wrench"></i> Update</button>
                <button type="submit" name="action" value="delete_employee" class="btn btn-outline-danger float-right rounded-0 mt-4"><i class="fa fa-trash"></i> Remove</button>
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
                    <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='id' value="${id}" readonly >
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
                    <option>Facility Department</option>
                    <option>Kitchen Department</option>
                    <option>Gallery Department</option>
                    <option>Customer Department</option>
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
                  <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='privilege_mode' placeholder="Privilege mode" value="${privilege_mode}">
                </div>
              </div>
             </div> 
                
            <div class='form-row mb-2'>
              <div class='form-group col-lg-12'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-envelope'></i></div>
                  </div>
                  <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='username' placeholder="Mail address" value="${username}">
                </div>
              </div>
             </div> 
                
            <div class='form-row mb-2'>
              <div class='form-group col-lg-12'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-passport pr-1'></i></div>
                  </div>
                  <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='nic' placeholder="Passport / NIC" value="${nic}">
                </div>
              </div>
             </div>  

            <div class='form-row mb-2'>
              <div class='form-group col-lg-6'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-user pr-1'></i></div>
                  </div>
                    <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='first_name' placeholder="First name" value="${first_name}">
                </div>
              </div>
              <div class='form-group col-lg-6'>
                <input type='text' class='form-control rounded-0 form-control-lg' name='last_name' placeholder="Last name" value="${last_name}">
              </div>  
             </div>
                
            <div class='form-row mb-2'>
              <div class='form-group col-lg-12'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-male pr-2'></i></div>
                  </div>
                    <input type='text' class='form-control rounded-0 form-control-lg' name='gender' placeholder="Gender" value="${gender}">
                </div>
              </div>
             </div>  
                
            <div class='form-row mb-2'>
              <div class='form-group col-lg-12'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-home'></i></div>
                  </div>
                  <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='address_line_01' placeholder="Address line 01" value="${address_line_01}">
                </div>
              </div>
             </div>  
                
            <div class='form-row mb-2'>
              <div class='form-group col-lg-12'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-home'></i></div>
                  </div>
                    <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='address_line_02' placeholder="Address line 02" value="${address_line_02}">
                </div>
              </div>
             </div>  
                   
            <div class='form-row mb-2'>
              <div class='form-group col-lg-4'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-map-marker pr-1'></i></div>
                  </div>
                    <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='city' placeholder="City / Town" value="${city}">
                </div>
              </div>
              <div class='form-group col-lg-4'>
                  <input type='text' class='form-control rounded-0 form-control-lg' name='zip' placeholder="Postal Code" value="${zip}">
              </div>
              <div class='form-group col-lg-4'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-globe-asia'></i></div>
                  </div>
                    <input type='text' class='form-control rounded-0 form-control-lg' name='country' placeholder="Country" value="${country}">
                </div>
              </div>
             </div>  

            <div class='form-row mb-2'>
              <div class='form-group col-lg-12'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-phone'></i></div>
                  </div>
                    <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='contact_number' placeholder="Contact number" value="${contact_number}">
                </div>
              </div>
             </div>  
                
            </div>
            
            <div class="col-md-6 text-center pb-5 bg-light">
                <div class="row pt-5">
                    <div class="col-md-7 offset-md-2">
                        <img src="${avatar}" class="img-fluid px-5 pt-5">
                    </div>
                    <div class="offset-md-4 pt-2">
                        <input class='file-upload form-control rounded-0 border border-0' style="background-color: transparent" type='file' name='avatar' accept='image/x-png'>
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
