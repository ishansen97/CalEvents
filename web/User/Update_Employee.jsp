<%@page import="java.sql.*,Employee.Employee" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Update Employee</title>
        <link rel="icon" href="../External/Images/icon.jpeg">
        <%@ include file="Layouts/Styles.jsp" %>
        <style type="text/css">
            .modal-confirm {
                margin-top: 10%;
                color: #636363;
                width: 400px;
            }
            .modal-confirm .modal-content {
                padding: 20px;
                border-radius: 5px;
                border: none;
                text-align: center;
                font-size: 14px;
            }
            .modal-confirm .modal-header {
                border-bottom: none;   
                position: relative;
            }
            .modal-confirm h4 {
                text-align: center;
                font-size: 26px;
                margin: 30px 0 -10px;
            }
            .modal-confirm .close {
                position: absolute;
                top: -5px;
                right: -2px;
            }
            .modal-confirm .modal-body {
                color: #999;
            }
            .modal-confirm .modal-footer {
                border: none;	
                border-radius: 5px;
                font-size: 13px;
                padding: 10px 15px 25px;
            }
            .modal-confirm .modal-footer a {
                color: #999;
            }		
            .modal-confirm .icon-box {
                width: 80px;
                height: 80px;
                margin: 0 0 0 0;
                border-radius: 50%;
                z-index: 9;
                text-align: center;
                border: 3px solid #ffc107!important;
            }
            .modal-confirm .icon-box i {
                color: #f15e5e;
                font-size: 46px;
                display: inline-block;
                margin-top: 13px;
            }

            .modal-confirm .btn {
                color: #fff;
                border-radius: 4px;
                background: #60c7c1;
                text-decoration: none;
                transition: all 0.4s;
                line-height: normal;
                border: none;
                border-radius: 3px;
                outline: none !important;
            }
            .modal-confirm .btn-info {
                background: #c1c1c1;
            }
            .modal-confirm .btn-info:hover, .modal-confirm .btn-info:focus {
                background: #a8a8a8;
            }
            .modal-confirm .btn-danger {
                background: #f15e5e;
            }
            .modal-confirm .btn-danger:hover, .modal-confirm .btn-danger:focus {
                background: #ee3535;
            }
            .trigger-btn {
                display: inline-block;
                margin: 100px auto;
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
                    <li class="breadcrumb-item">
                        <a href="Dashboard">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item active">Update Employee</li>
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
                            <div class="col-md-4 bg-light">
                                <button type="submit" name="action" value="update_employee" class="btn btn-outline-warning float-right rounded-0 mt-4 ml-3"><i class="fa fa-wrench"></i> Update</button>
                                <button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-outline-danger float-right rounded-0 mt-4 ml-3"><i class="fa fa-trash"></i> Remove</button>
                                <button type="submit" name="action" value="reset_password" class="btn btn-outline-secondary float-right rounded-0 mt-4"><i class="fa fa-exclamation-triangle"></i></button>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-5 px-5 pb-5">

                                <div class="collapse multi-collapse" id="multiCollapseExample1">    

                                    <p class="w3-text-blue w3-xlarge">Department info</p>
                                    <hr class="bg-light mb-5">

                                    <div class='form-row mb-4 mt-4'>
                                        <div class='form-group col-lg-4'>
                                            <label>Employee ID</label>
                                            <div class='input-group'>
                                                <div class='input-group-prepend'>
                                                    <div class='input-group-text rounded-0'><i class='fa fa-id-card'></i></div>
                                                </div>
                                                <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='id' value="${id}" readonly>
                                            </div>
                                        </div>
                                        <div class='form-group col-lg-8'>
                                            <i class="fa fa-asterisk fa-1x text-danger"></i><label>&nbsp&nbsp Department</label>
                                            <div class='input-group'>
                                                <div class='input-group-prepend'>
                                                    <div class='input-group-text rounded-0'><i class='fa fa-building'></i></div>
                                                </div>
                                                <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name="department" value="${department}" required>
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
                                                <input type='number' class='form-control rounded-0 border border-left-0 form-control-lg' name='privilege_mode' value="${privilege_mode}" required>
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
                                                    <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='nic' value="${nic}" required>
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
                                                    <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='first_name' value="${first_name}" required>
                                                </div>
                                            </div>
                                            <div class='form-group col-lg-6'>
                                                <i class="fa fa-asterisk fa-1x text-danger"></i><label>&nbsp&nbsp Last Name</label>
                                                <input type='text' class='form-control rounded-0 form-control-lg' name='last_name' value="${last_name}" required>
                                            </div>  
                                        </div>

                                        <div class='form-row mb-2'>
                                            <div class='form-group col-lg-12'>
                                                <i class="fa fa-asterisk fa-1x text-danger"></i><label>&nbsp&nbsp Gender</label>
                                                <div class='input-group'>
                                                    <div class='input-group-prepend'>
                                                        <div class='input-group-text rounded-0'><i class='fa fa-male pr-2'></i></div>
                                                    </div>
                                                    <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='gender' value="${gender}" required>
                                                </div>
                                            </div>
                                        </div>  
                                    </div>

                                    <div class="multi-collapse" id="multiCollapseExample3">
                                        <p class="w3-text-blue w3-xlarge mt-5">Contact info</p>
                                        <hr class="bg-light mb-5">

                                        <div class='form-row mb-4'>
                                            <div class='form-group col-lg-12'>
                                                <i class="fa fa-asterisk fa-1x text-danger"></i><label>&nbsp&nbsp E-Mail Address</label>
                                                <div class='input-group'>
                                                    <div class='input-group-prepend'>
                                                        <div class='input-group-text rounded-0'><i class='fa fa-envelope'></i></div>
                                                    </div>
                                                    <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='username' value="${username}" required>
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
                                                    <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='address_line_01' value="${address_line_01}" required>
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
                                                    <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='address_line_02' value="${address_line_02}" required>
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
                                                    <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='city' value="${city}" required>
                                                </div>
                                            </div>
                                            <div class='form-group col-lg-4'>
                                                <i class="fa fa-asterisk fa-1x text-danger"></i><label>&nbsp&nbsp Postal Code</label>
                                                <input type='text' class='form-control rounded-0 form-control-lg' name='zip' value="${zip}" required>
                                            </div>
                                            <div class='form-group col-lg-4'>
                                                <i class="fa fa-asterisk fa-1x text-danger"></i><label>&nbsp&nbsp Country</label>
                                                <div class='input-group'>
                                                    <div class='input-group-prepend'>
                                                        <div class='input-group-text rounded-0'><i class='fa fa-globe-asia'></i></div>
                                                    </div>
                                                    <input type='text' class='form-control rounded-0 form-control-lg' name='country' value="${country}" required>
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
                                                    <input type='text' class='form-control rounded-0 border border-left-0 form-control-lg' name='contact_number' value="${contact_number}" required>
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
                                            <p><span class="fa fa-angle-right"></span> &nbsp Password reset on right side top corner will reset <br> &nbsp &nbsp &nbspthe password to employee's <span style="font-weight: 600">NIC / Passport.</span></p>
                                            <p><span class="fa fa-angle-right"></span> &nbsp All employee profile updates will be tracked <br> &nbsp &nbsp &nbspthrough the logging system.</p>
                                        </div>
                                    </div>
                                </div>



                                <div class="col-md-4 text-center pb-5 bg-light">
                                    <div class="row pt-5">
                                        <div class="col-md-7 offset-md-2">
                                            <img src="${avatar}" class="img-fluid px-5 pt-5">
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

            <div id="myModal" class="modal fade">
                <div class="modal-dialog modal-confirm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="col-md-2 float-right">
                                <div class="icon-box">
                                    <i class="fa fa-exclamation text-warning"></i>
                                </div>
                            </div>
                            <div class="col-md-9 pl-5">
                                <h4 class="modal-title">Are you sure?</h4>
                            </div>
                            <div class="col">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                        </div>
                        <div class="modal-body">
                            <p>Do you really want to delete this employee? This process cannot be undone.</p>
                        </div>

                        <div class="modal-footer">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-3 offset-md-3"> <button type="button" class="btn btn-info p-3" data-dismiss="modal">Cancel</button></div>
                                    <form action="Process-Employee" method="POST">
                                        <div class="col-md-3">
                                            <input type='text' name='id' value="${id}" hidden>
                                            <button type="submit" name="action" value="delete_employee" class="btn btn-danger p-3">Delete</button>
                                        </div>
                                    </form>
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