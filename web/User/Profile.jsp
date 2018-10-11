<!DOCTYPE html>
<html>
<head>
<title>Profile</title>
<link rel="icon" href="../External/Images/icon.jpeg">
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
        <li class="breadcrumb-item active">Profile</li>
      </ol>

      <div class="container-fluid mb-3 bg-white">
        <form action="Process-Profile" method="POST" enctype="multipart/form-data">
            
        <div class="row">
            <div class="col-md-6"></div>
            <div class="col-md-6 bg-light">
                <button type="submit" name="action" value="update_employee" class="btn btn-outline-warning float-right rounded-0 mt-4"><i class="fa fa-wrench"></i> Update</button>
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
                    <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='id' value="${p_id}" readonly >
                </div>
                </div>
                <div class='form-group col-lg-8'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-building'></i></div>
                  </div>
                  <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='department' placeholder="Department" value="${p_department}" readonly>
                </div>
                </div>
             </div>
                
            <div class='form-row mb-2'>
              <div class='form-group col-lg-12'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-unlock-alt'></i></div>
                  </div>
                    <input type='text' name='privilege_mode' placeholder="Privilege mode" value="${p_privilege_mode}" hidden>
                    <input type='password' class='form-control rounded-0 border border-left-0 form-control-lg' name='password' placeholder="Pasword">
                </div>
              </div>
             </div> 
                
            <div class='form-row mb-2'>
              <div class='form-group col-lg-12'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-envelope'></i></div>
                  </div>
                  <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='username' placeholder="Mail address" value="${p_username}">
                </div>
              </div>
             </div> 
                
            <div class='form-row mb-2'>
              <div class='form-group col-lg-12'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-passport pr-1'></i></div>
                  </div>
                  <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='nic' placeholder="Passport / NIC" value="${p_nic}">
                </div>
              </div>
             </div>  

            <div class='form-row mb-2'>
              <div class='form-group col-lg-6'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-user pr-1'></i></div>
                  </div>
                    <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='first_name' placeholder="First name" value="${p_first_name}">
                </div>
              </div>
              <div class='form-group col-lg-6'>
                <input type='text' class='form-control rounded-0 form-control-lg' name='last_name' placeholder="Last name" value="${p_last_name}">
              </div>  
             </div>
                
            <div class='form-row mb-2'>
              <div class='form-group col-lg-12'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-male pr-2'></i></div>
                  </div>
                    <input type='text' class='form-control rounded-0 form-control-lg' name='gender' placeholder="Gender" value="${p_gender}">
                </div>
              </div>
             </div>  
                
            <div class='form-row mb-2'>
              <div class='form-group col-lg-12'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-home'></i></div>
                  </div>
                  <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='address_line_01' placeholder="Address line 01" value="${p_address_line_1}">
                </div>
              </div>
             </div>  
                
            <div class='form-row mb-2'>
              <div class='form-group col-lg-12'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-home'></i></div>
                  </div>
                    <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='address_line_02' placeholder="Address line 02" value="${p_address_line_2}">
                </div>
              </div>
             </div>  
                   
            <div class='form-row mb-2'>
              <div class='form-group col-lg-4'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-map-marker pr-1'></i></div>
                  </div>
                    <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='city' placeholder="City / Town" value="${p_city}">
                </div>
              </div>
              <div class='form-group col-lg-4'>
                  <input type='text' class='form-control rounded-0 form-control-lg' name='zip' placeholder="Postal Code" value="${p_zip}">
              </div>
              <div class='form-group col-lg-4'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-globe-asia'></i></div>
                  </div>
                    <input type='text' class='form-control rounded-0 form-control-lg' name='country' placeholder="Country" value="${p_country}">
                </div>
              </div>
             </div>  

            <div class='form-row mb-2'>
              <div class='form-group col-lg-12'>
                <div class='input-group'>
                  <div class='input-group-prepend'>
                    <div class='input-group-text rounded-0'><i class='fa fa-phone'></i></div>
                  </div>
                    <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='contact_number' placeholder="Contact number" value="${p_contact_number}">
                </div>
              </div>
             </div>  
                
            </div>
            
            <div class="col-md-6 text-center pb-5 bg-light">
                <div class="row pt-5">
                    <div class="col-md-7 offset-md-2">
                        <img src="${p_avatar}" class="img-fluid px-5 pt-5">
                    </div>
                    <div class="offset-md-4 pt-2">
                        <input class='file-upload form-control rounded-0 border border-0' style="background-color: transparent" type='file' name='avatar' accept="image/x-png,image/jpg,image/jpeg">
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
