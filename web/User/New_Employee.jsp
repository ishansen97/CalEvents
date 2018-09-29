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
                        <a href="Dashboard">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item active">New Employee</li>
                </ol>

                <div class="container-fluid mb-3 bg-white">
                    <form action="Process-Employee" method="POST" enctype="multipart/form-data">

                        <div class="row">
                            <div class="col-md-5 bg-white px-5">
                                <button class="btn btn-primary mt-3 rounded-0 float-right ml-1" type="button" data-toggle="collapse" data-target="#multiCollapseExample3" aria-expanded="false" aria-controls="multiCollapseExample3">Contact info</button>
                                <button class="btn btn-primary mt-3 rounded-0 float-right ml-1" type="button" data-toggle="collapse" data-target="#multiCollapseExample2" aria-expanded="false" aria-controls="multiCollapseExample2">Personal info</button>
                                <button class="btn btn-primary mt-3 rounded-0 float-right" type="button" data-toggle="collapse" data-target="#multiCollapseExample1" aria-expanded="true" aria-controls="multiCollapseExample1">Department info</button>
                            </div>
                            <div class="col-md-3 bg-white"></div>
                            <div class="col-md-4 bg-light"><button type="submit" name="action" value="add_employee" class="btn btn-lg btn-outline-success float-right rounded-0 mt-4">Add employee</button>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-5 px-5 pb-5">

                                <div class="multi-collapse" id="multiCollapseExample1">    

                                    <p class="w3-text-blue w3-xlarge">Department info</p>
                                    <hr class="bg-light mb-5">

                                    <div class='form-row mb-4 mt-4'>
                                        <div class='form-group col-lg-4'>
                                            <label>Employee ID</label>
                                            <div class='input-group'>
                                                <div class='input-group-prepend'>
                                                    <div class='input-group-text rounded-0'><i class='fa fa-id-card'></i></div>
                                                </div>
                                                <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='id' value="${empId}" readonly>
                                            </div>
                                        </div>
                                        <div class='form-group col-lg-8'>
                                            <i class="fa fa-asterisk fa-1x text-danger"></i><label>&nbsp&nbsp Department</label>
                                            <div class='input-group'>
                                                <div class='input-group-prepend'>
                                                    <div class='input-group-text rounded-0'><i class='fa fa-building'></i></div>
                                                </div>
                                                <select class="form-control border border-left-0 form-control-lg rounded-0" name="department">
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

                                    <div class='form-row mb-4'>
                                        <div class='form-group col-lg-12'>
                                            <i class="fa fa-asterisk fa-1x text-danger"></i><label>&nbsp&nbsp Privilege Mode</label>
                                            <div class='input-group'>
                                                <div class='input-group-prepend'>
                                                    <div class='input-group-text rounded-0'><i class='fa fa-unlock-alt'></i></div>
                                                </div>
                                                <select class="form-control border border-left-0 form-control-lg rounded-0" name="privilege_mode">
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                    <option>5</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div> 

                                    <div class='form-row mb-4'>
                                        <div class='form-group col-lg-6'>
                                            <i class="fa fa-asterisk fa-1x text-danger"></i><label>&nbsp&nbsp Employment Date</label>
                                            <div class='input-group'>
                                                <div class='input-group-prepend'>
                                                    <div class='input-group-text rounded-0'><i class='fa fa-unlock-alt'></i></div>
                                                </div>
                                                <input type='date' class='form-control rounded-0 border border-left-0 form-control-lg' name='doe' required>
                                            </div>
                                        </div>
                                    </div> 
                                </div>



                                <div class="collapse multi-collapse" id="multiCollapseExample2">    
                                    <p class="w3-text-blue w3-xlarge mt-5">Personal info</p>
                                    <hr class="bg-light mb-5">

                                    <div class='form-row mb-4'>
                                        <div class='form-group col-lg-12'>
                                            <i class="fa fa-asterisk fa-1x text-danger"></i><label>&nbsp&nbsp Passport / NIC</label>
                                            <div class='input-group'>
                                                <div class='input-group-prepend'>
                                                    <div class='input-group-text rounded-0'><i class='fa fa-passport pr-1'></i></div>
                                                </div>
                                                <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='nic' required>
                                            </div>
                                        </div>
                                    </div>  

                                    <div class='form-row mb-4'>
                                        <div class='form-group col-lg-6'>
                                            <i class="fa fa-asterisk fa-1x text-danger"></i><label>&nbsp&nbsp First Name</label>
                                            <div class='input-group'>
                                                <div class='input-group-prepend'>
                                                    <div class='input-group-text rounded-0'><i class='fa fa-user pr-1'></i></div>
                                                </div>
                                                <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='first_name' required>
                                            </div>
                                        </div>
                                        <div class='form-group col-lg-6'>
                                            <i class="fa fa-asterisk fa-1x text-danger"></i><label>&nbsp&nbsp Last Name</label>
                                            <input type='text' class='form-control rounded-0 form-control-lg' name='last_name' required>
                                        </div>  
                                    </div>

                                    <div class='form-row mb-2'>
                                        <div class='form-group col-lg-12'>
                                            <i class="fa fa-asterisk fa-1x text-danger"></i><label>&nbsp&nbsp Gender</label>
                                            <div class='input-group'>
                                                <div class='input-group-prepend'>
                                                    <div class='input-group-text rounded-0'><i class='fa fa-male pr-2'></i></div>
                                                </div>
                                                <select class="form-control border border-left-0 form-control-lg rounded-0" name="gender">
                                                    <option>Choose Gender</option>
                                                    <option>Male</option>
                                                    <option>Female</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>  
                                </div>

                                <div class="collapse multi-collapse" id="multiCollapseExample3">
                                    <p class="w3-text-blue w3-xlarge mt-5">Contact info</p>
                                    <hr class="bg-light mb-5">

                                    <div class='form-row mb-4'>
                                        <div class='form-group col-lg-12'>
                                            <i class="fa fa-asterisk fa-1x text-danger"></i><label>&nbsp&nbsp E-Mail Address</label>
                                            <div class='input-group'>
                                                <div class='input-group-prepend'>
                                                    <div class='input-group-text rounded-0'><i class='fa fa-envelope'></i></div>
                                                </div>
                                                <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='username' required>
                                            </div>
                                        </div>
                                    </div> 

                                    <div class='form-row mb-4'>
                                        <div class='form-group col-lg-12'>
                                            <i class="fa fa-asterisk fa-1x text-danger"></i><label>&nbsp&nbsp Address Line 01</label>
                                            <div class='input-group'>
                                                <div class='input-group-prepend'>
                                                    <div class='input-group-text rounded-0'><i class='fa fa-home'></i></div>
                                                </div>
                                                <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='address_line_01' required>
                                            </div>
                                        </div>
                                    </div>  

                                    <div class='form-row mb-4'>
                                        <div class='form-group col-lg-12'>
                                            <i class="fa fa-asterisk fa-1x text-danger"></i><label>&nbsp&nbsp Address Line 02</label>
                                            <div class='input-group'>
                                                <div class='input-group-prepend'>
                                                    <div class='input-group-text rounded-0'><i class='fa fa-home'></i></div>
                                                </div>
                                                <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='address_line_02' required>
                                            </div>
                                        </div>
                                    </div>  

                                    <div class='form-row mb-4'>
                                        <div class='form-group col-lg-4'>
                                            <i class="fa fa-asterisk fa-1x text-danger"></i><label>&nbsp&nbsp City / Town</label>
                                            <div class='input-group'>
                                                <div class='input-group-prepend'>
                                                    <div class='input-group-text rounded-0'><i class='fa fa-map-marker pr-1'></i></div>
                                                </div>
                                                <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='city' required>
                                            </div>
                                        </div>
                                        <div class='form-group col-lg-4'>
                                            <i class="fa fa-asterisk fa-1x text-danger"></i><label>&nbsp&nbsp Postal Code</label>
                                            <input type='text' class='form-control rounded-0 form-control-lg' name='zip' required>
                                        </div>
                                        <div class='form-group col-lg-4'>
                                            <i class="fa fa-asterisk fa-1x text-danger"></i><label>&nbsp&nbsp Country</label>
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

                                    <div class='form-row mb-4'>
                                        <div class='form-group col-lg-12'>
                                            <i class="fa fa-asterisk fa-1x text-danger"></i><label>&nbsp&nbsp Contact Number</label>
                                            <div class='input-group'>
                                                <div class='input-group-prepend'>
                                                    <div class='input-group-text rounded-0'><i class='fa fa-phone'></i></div>
                                                </div>
                                                <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='contact_number' required>
                                            </div>
                                        </div>
                                    </div> 
                                </div>

                            </div>



                            <div class="col-md-3">

                                <div class="card bg-light">
                                    <div class="card-body">
                                        <p class="text-success pb-3">How to create a new employee profile..</p>
                                        <p><span class="fa fa-angle-right"></span> &nbsp All fields marked with <span class="fa fa-asterisk fa-1x text-danger" ></span> are compulsory to be filled &nbsp &nbsp &nbspto complete employee profile.</p>
                                        <p><span class="fa fa-angle-right"></span> &nbsp Employee identification number will automatically <br>&nbsp &nbsp &nbspbe generated.</p>
                                        <p><span class="fa fa-angle-right"></span> &nbsp Privilege mode is to give different access levels.<br> &nbsp &nbsp &nbspselect 1 for departments other than <span style="font-weight: 600">Event, Kitchen, <br>&nbsp &nbsp &nbspFacility. </span> </p>
                                        <p><span class="fa fa-angle-right"></span> &nbsp Fill <span style="font-weight: 600">contact details</span> with updated and frequently <br>&nbsp &nbsp &nbspused details.</p>
                                        <p><span class="fa fa-angle-right"></span> &nbsp Select a <span style="font-weight: 600">recently</span> taken photo of the employee.</p>
                                        <p><span class="fa fa-angle-right"></span> &nbsp Once the profile has being created, employee login <br>&nbsp &nbsp &nbspwill be<span style="font-weight: 600"> Email for username, NIC/Passport for <br>&nbsp &nbsp &nbsppassword</span></p>
                                    </div>
                                </div>
                            </div>





                            <div class="col-md-4 text-center pb-5 bg-light">

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