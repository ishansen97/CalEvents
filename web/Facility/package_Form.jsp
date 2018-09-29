<%-- 
    Document   : package form
    Created on : Sep 13, 2018, 10:58:35 PM
    Author     : User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="faciliyPackages.operations.Facility_Packages"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>



        </style>
        <title>Facility Form</title>
    </head>
    <body>

        <h2>Select you event type :</h2>
        Indoor : <input type="radio" name="inout" value="indoor" id='in'/>
        Outdoor :<input type="radio" name="inout" value="outdoor" id='out'/> 

        <h2>Select packages</h2>


        <hr><div class="container-fluid">

            <table>
                <tbody>
                    <tr>
                        <td><input type="checkbox" name="sounds" value="ON" /></td>
                        <td><h4 class="alert-danger">Sounds</h4></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="lighting" value="ON" /></td>
                        <td><h4 class="alert-danger">Lighting</h4></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="Mics" value="ON" /></td>
                        <td><h4 class="alert-danger">Microphones</h4></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="chairs" value="ON" /></td>
                        <td><h4 class="alert-danger">Chairs</h4></td>
                    </tr>
                </tbody>
            </table>

        </div>
        <script>
            $(document).ready(function () {
                $("p").click(function () {
                    $(this).hide();
                });
            });
        </script>

    </body>
</html>
