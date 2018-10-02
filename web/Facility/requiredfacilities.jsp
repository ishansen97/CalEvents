<%-- 
    Document   : requiredfacilities
    Created on : Oct 2, 2018, 11:22:47 PM
    Author     : User
--%>

<%@page import="java.sql.Connection"%>
<%@page import="facilities.event.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="jquery-3.3.1.min.js"></script>
         <style>
            div.scrollselectfacilities{
                background-color: white;
                width: 200px;
                height: 110px;
                overflow-y: scroll;
                margin-left: 10%;
            }

            .button {
                background-color: #4CAF50; /* Green */
                border: none;
                color: white;
                padding: 16px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                -webkit-transition-duration: 0.4s; /* Safari */
                transition-duration: 0.4s;
                cursor: pointer;
            }

            .button5 {
                background-color: white;
                color: black;
                border: 2px solid #555555;
            }
            .button5:hover {
                background-color: #555555;
                color: white;
            }

            input[type=text], select {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }


        </style>
    </head>
    <body>
        
        <script>
                    function displayModal(obj) {
                        var item_id = obj;
                        //alert(item_id);

                        $.post("determine.jsp", {event_id: item_id}, function (data) {
                            $("#allocateModal .modal-body").html(data);
                        });
                        $("#allocateModal").modal();
                    }
                </script>
    <center>
        <form action="../determinefacilities" method ="POST">
        <div class="container" style="overflow-y:scroll; height: 20%;">
            <div class="row">
                <div class="col-md-8">
                <table class="table table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th><h4>Event Name</h4></th>
                            <th><h4>Package Requested</h4></th>
                            <th><h4>No Of Chairs</h4></th>
                            <th><h4>Tent Required</h4></th>
                            <th><h4>Crowd Expected</h4></th>
                        </tr>
                    </thead>
        
        <%
            ResultSet privateRequired = null;
            PreparedStatement queryPrivateRequired = null;
            DBConnect dball = DBConnect.getInstance();
            
            if(dball.isConnected()){
                Connection con = dball.getCon();
                queryPrivateRequired = con.prepareStatement("SELECT * FROM `event_details`");
                privateRequired = queryPrivateRequired.executeQuery();
                
                while(privateRequired.next()){
                %>
                
                    <tr>
                        <td><h4><%=privateRequired.getString("event_Name")%></h4></td>
                        <td><h4><%=privateRequired.getString("package")%></h4></td>
                        <td><h4><%=privateRequired.getString("chairs")%></h4></td>
                        <% String yn = "";
                           int tentrequired = privateRequired.getInt("tent");
                           if(tentrequired==1){
                               yn = "yes";
                           }
                           else yn = "no";
                        %>
                        <td><h4><%=yn%></h4></td>
                        <td class="danger"><h4><%=privateRequired.getString("crowd_expected")%></h4></td>
                        <td><button type="button" name="privatePackageName" class="btn btn-success" id="<%=privateRequired.getString("package")%>" onclick="displayModal(this.id)">Allocate</button></td>
                    </tr>
                </table>
                
                <%
                }
                
            }
            

        %>

                <div class="modal fade" id="allocateModal">
                    <div class="modal-dialog" style="width: 1200px">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title">Allocate Facilities</h1>
                            </div>
                            <div class="modal-body">

                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
            
        </form>
        
        </center>
        
    </body>
</html>
