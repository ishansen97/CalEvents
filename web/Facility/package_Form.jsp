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
        <title>Facility Form</title>
    </head>
    <body>

        <h2>Select you event type :</h2>
        Indoor : <input type="radio" name="inout" value="indoor" id='in'/>
        Outdoor :<input type="radio" name="inout" value="outdoor" id='out'/> 

        <h2>We recommend you these facility packages</h2>
        <hr>

        <table border='1'>
            <thead>
                <tr>
                    <th>Package Name</th>
                    <th>Facilities</th>
                    <th>Price($)</th>
                </tr>
            </thead>
            <tbody><%  Facility_Packages fetch = new Facility_Packages();
                ResultSet packages = fetch.fetch_Packages();
                %>
                <%while (packages.next()) {%>
                <tr>
                    <td id="packName"><%=packages.getString("packageName")%></td>
                    <td><%=packages.getString("facilities")%></td>
                    <td><%=packages.getString("price")%></td>
                    <td></td>
                </tr><%}%>
            </tbody>
        </table>

        <h2>Have found the package from above packages ?</h2>
        yes : <input type="radio" name="packyesno" value="packyes" id='packyes'/>
        no :<input type="radio" name="packyesno" value="packno" id='packno' onclick="showtents()"/> 

        <div id='tentsyesnodiv' style="display: none;">
            <h2>Do you require tents ? : </h2> 
            yes : <input type="radio" name="tentsyesno" value="tentsyes" id='tentsyes' onclick="showsounds()"/>
            no :<input type="radio" name="tentsyesno" value="tentsno" id='tentsno' onclick="showsounds()"/> 
        </div>

        <select name="tentspackages">
            <option></option>
        </select>
        
        <div id='soundsyesnodiv' style="display: none;">
            <h2>Do you require sounds ? : </h2> 
            yes : <input type="radio" name="soundsyesno" value="soundsyes" id='soundsyes'/>
            No :<input type="radio" name="soundsyesno" value="soundsno" id='soundsno'/> 
        </div>

        <script>

            function showtents() {
                document.getElementById('tentsyesnodiv').style.display = '';
            }
            
            function showsounds() {
                document.getElementById('soundsyesnodiv').style.display = '';
            }
        </script>

    </body>
</html>
