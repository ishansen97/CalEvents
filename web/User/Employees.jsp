<%@page import="java.sql.*,Employee.Employee" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Employees</title>
        <link rel="icon" href="../External/Images/icon.jpeg">
        <%@ include file="Layouts/Styles.jsp" %>
        <style>
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
                var v = document.employees.search.value;
                var url = "/${p_nam}/User/Search_Employee.jsp?val=" + v;

                if (window.XMLHttpRequest) {
                    request = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }

                try {
                    request.onreadystatechange = getInfo;
                    request.open("GET", url, true);
                    request.send();
                } catch (e) {
                    alert("Unable to connect to server");
                }
            }

            function getInfo() {
                if (request.readyState == 4) {
                    var val = request.responseText;
                    document.getElementById('amit').innerHTML = val;
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
                    <li class="breadcrumb-item active">Employees</li>
                </ol>

                <div class="col-md-12 mb-3 bg-white">

                    <div class="row pb-4">

                        <div class="col-md-9">
                            
                            <form name="employees">
                                <div class="row pr-3 pt-4">
                                    <div class="col-md-2 offset-md-9 pr-0">
                                        <input class="form-control rounded-0" type="text" placeholder="Enter Employee ID" name="search" onkeyup="sendInfo();">
                                    </div>
                                    <div class="col-md-1 pr-1 pl-0">
                                        <button class="btn btn-primary btn-block rounded-0" type="button" onclick="sendInfo();">Search</button>
                                    </div>
                                </div>
                            </form>

                            <div class="row">

                                <div class="col-md-12 text-center py-3">
                                    <form action="Update-Employee" method="POST">
                                        <table class="w3-table w3-striped" id="amit">
                                        </table>
                                    </form>
                                </div>


                                <div class="col-md-12 text-center pb-5 py-2" style="height: 75vh; overflow: scroll; overflow-x: hidden">
                                    <form action="Update-Employee" method="POST">
                                        <table class="w3-table w3-striped">
                                            <tr class='w3-blue-gray'>
                                                <td>EMPID</td>
                                                <td>Department</td>
                                                <td>First Name</td>
                                                <td>Last Name</td>
                                                <td></td>
                                            </tr>
                                            <input type="text" value="read_Employee" name="action" hidden>
                                            <input type="text" value="mini_Profile" name="redirectPath" hidden>

                                            <%		 String logged_user = session.getAttribute("p_id").toString();
                                                ResultSet res = Employee.readEmployees(logged_user);
                                            %>

                                            <%while (res.next()) {%>

                                            <tr style="font-family: 'Quicksand', sans-serif; font-size: 19px; cursor: default" class="w3-hover-dark-gray">
                                                <td><%=res.getString("id")%></td>
                                                <td><%=res.getString("department")%></td>
                                                <td><%=res.getString("first_name")%></td>
                                                <td><%=res.getString("last_name")%></td>
                                                <td style='width:120px'>
                                                    <button class='btn btn-info btn-sm' type='submit' name='empId' value="<%=res.getString("id")%>"><i class='fa fa-spinner'></i> View</button>
                                                </td>
                                            </tr>

                                            <% }
                                            %>

                                        </table>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 mt-4 px-4">
                            <div class="card rounded-0 mb-2">
                                <div class="card-header bg-light">
                                    <h6 class="text-center">Employee : ${id}</h6>
                                </div>
                                <div class="card-body">

                                    <form action="Update-Employee" method="POST">
                                        
                                        <input type="text" value="read_Employee" name="action" hidden>
                                        <input type="text" value="${id}" name="empId" hidden>
                                        
                                        <div class="row mb-1">
                                            <%
                                                Object avatar = request.getSession(false).getAttribute("avatar");

                                                if (avatar != null) {
                                            %>
                                            <button class="btn col btn-warning btn-md rounded-0 mr-1 ml-3" type="submit" name="redirectPath" value="updateProfile"><i class="fa fa-wrench"></i>  Update</button>
                                            <button class="btn col btn-secondary btn-md rounded-0 mr-3 " type="submit" name="redirectPath" value="resetMiniProfile"><i class="fa fa-exclamation-triangle"></i>  Reset</button>
                                            <% } %>
                                        </div>
                                    </form>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <%
                                                try {
                                                    if (avatar != null) {
                                                        out.println("<img src='" + avatar + "' class='img-fluid'>");
                                                    } else {
                                                        out.println("<img src='https://cdn0.iconfinder.com/data/icons/user-pictures/100/malecostume-512.png' class='img-fluid'>");
                                                    }

                                                } catch (Exception e) {
                                                    out.println(e);
                                                }
                                            %>

                                            <!--<img src="https://cdn0.iconfinder.com/data/icons/user-pictures/100/malecostume-512.png" class="img-fluid">-->
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 pl-3 pb-2" style="font-size: 17px">
                                            <table class="mt-3 w3-table">
                                                <tr class="w3-light-grey">
                                                    <td class="pl-3 py-2">Full name </td>
                                                    <td class="pl-2">: ${first_name} ${last_name}</td>
                                                </tr>
                                                <tr>
                                                    <td class="pl-3 py-2">Department </td>
                                                    <td class="pl-2">: ${department}</td>
                                                </tr>
                                                <tr class="w3-light-grey">
                                                    <td class="pl-3 py-2">DOE </td>
                                                    <td class="pl-2">: ${doe}</td>
                                                </tr>
                                                <tr>
                                                    <td class="pl-3 py-2">Country </td>
                                                    <td class="pl-2">: ${country}</td>
                                                </tr>
                                                <tr class="w3-light-grey">
                                                    <td class="pl-3 py-2">Contact </td>
                                                    <td class="pl-2">: ${contact_number}</td>
                                                </tr>
                                                <%
                                                    if (avatar != null) {
                                                %>
                                                <tr>
                                                    <td colspan="2" class=" pt-4 pl-1 pr-1 text-center">
                                                        <form action="Employee-Performance" method="POST">
                                                            <input type="text" name="empid" value="${id}" hidden>
                                                            <button type="submit" class="btn btn-block btn-primary rounded-0">View Performance</button>
                                                        </form>
                                                    </td>
                                                </tr>
                                                <% } %>
                                            </table>
                                        </div>
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