<%-- 
    Document   : allocate
    Created on : Sep 29, 2018, 10:27:30 PM
    Author     : User
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="facilities.allocation.Allocation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Facility</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="jquery-3.3.1.min.js"></script>
        <%@ include file="Layouts/Styles.jsp" %>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="jquery-3.3.1.min.js"></script>
    </head>

    <body class="w3-light-grey">

        <%@ include file="Layouts/Navigation.jsp" %>

        <!-- !PAGE CONTENT! -->


        <div class="w3-main" style="margin-left:400px;margin-top:43px;">


            <div class="container-fluid">
                <!--<button class="btn btn-danger" id="openAddPackages">Add Packages</button>-->
                <div class="row">
                    <hr>
                    <div class="row">
                        <div class="packagestabs" id="addPack">
                            <div class="container-fluid">
                                <div class="col-md-6">
                                    <div class="packagestabs" id="allocateTab">
                                        <h1 class="alert alert-success">Upcoming Private Events</h1>
                                        <%@include file="requiredfacilities.jsp" %>
                                        <br>
                                    <button id="shothis" class="btn btn-danger">Package Operations</button>
                                    </div>     
                                    <br>
                                </div>
                    </div>
                                    <div class="row">
                                    <div id="showhide" style="display:none;">
                                    <div class="col-md-4">
                                        <h1 class="alert alert-info">Add Packages</h1>
                                        <%@include file="_test.jsp" %>
                                    </div>

                                    <div class="col-md-6">
                                        <h1 class="alert alert-info">Currently Available Packages</h1>
                                        <%@include file="newjsp.jsp"%>

                                    </div>

                                    </div>
                                        
                                </div>
                            </div>

                        </div>
                </div>

            </div>

            <script>
                $("#shothis").click(function () {
                    $("#showhide").toggle();
                    $(document).scrollTop($(document).height());
                });
            </script>




            <%--<%@ include file="Layouts/Footer.jsp" %>--%>
            <!-- End page content -->
        </div>

        <%@ include file="Layouts/Scripts.jsp" %>
    </body>
</html>