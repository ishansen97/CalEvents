<%-- 
    Document   : determine.jsp
    Created on : Oct 3, 2018, 1:28:11 AM
    Author     : User
--%>

<%@page import="facilities.event.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="facilities.event.DBConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            option{
                font-size: 20px;

            }
        </style>
    </head>
    <body>
        
        <form action="../determinefacilities">
            

        <%  String packageName = request.getParameter("event_id");

            PreparedStatement getfacilitiesforpackage = null;
            PreparedStatement getchairsandstuff = null;
            PreparedStatement getexpectedcrowdandstuff = null;

            DBConnect dbconnect = DBConnect.getInstance();

            ResultSet facilitiesforpackage = null;
            ResultSet getrequiredchairsandstuff = null;
            ResultSet expectedCrowd = null;
            String eventID = "";

            ArrayList<String> facilitiestoallocate = new ArrayList();

            int tentchecker = 0;
            String ExpectedCrowd = "";

            try {
                if (dbconnect.isConnected()) {
                    Connection con = dbconnect.getCon();
                    getfacilitiesforpackage = con.prepareStatement("SELECT `facilitiyName` FROM `packagesview` WHERE `packageName` = ?");
                    getfacilitiesforpackage.setString(1, packageName);

                    facilitiesforpackage = getfacilitiesforpackage.executeQuery();

                    while (facilitiesforpackage.next()) {

                        facilitiestoallocate.add(facilitiesforpackage.getString("facilitiyName"));

                    }

                    getchairsandstuff = con.prepareStatement("SELECT * FROM `requiredfacilities`");
                    getrequiredchairsandstuff = getchairsandstuff.executeQuery();

                    while (getrequiredchairsandstuff.next()) {

                        tentchecker = getrequiredchairsandstuff.getInt("tent");
                        eventID = getrequiredchairsandstuff.getString("eventID");

        %>  
        <table>
            <tr>
                <td><h3>Chairs Required : </h3></td>
                <td><h3><input type="text" id="quantityforallocation" name="quantityforallocat" placeholder="Enter Quantity" value="<%=getrequiredchairsandstuff.getString("chairs")%>"/></h3></td>
            </tr><%}%>



            <tr><% for (int i = 0; i < facilitiestoallocate.size(); i++) {%>
                <td><h3><%=facilitiestoallocate.get(i)%></h3></td>
                <td><input type="hidden" value="<%=facilitiestoallocate.get(i)%>" name="packageFacility"/></td>
                <td><input type="text" id="quantityforallocation" name="Facquantityforallocation" placeholder="Enter Quantity"/></td>
            </tr><%}%>
            <tr>
                <td></td>
                <td></td>
            </tr>
        </table>
        <%if (tentchecker == 1) {
                Facility facilitytoallocate = new Tents();
                getexpectedcrowdandstuff = con.prepareStatement("SELECT * FROM `event_details` WHERE `event_ID` = ?");
                getexpectedcrowdandstuff.setString(1, eventID);
                expectedCrowd = getexpectedcrowdandstuff.executeQuery();
                while (expectedCrowd.next()) {%>

        <h4 class="alert alert-danger">TENT SHOULD FIT <%=expectedCrowd.getString("crowd_expected")%> PEOPLE</h4>
        <%}%>  

        <h4>Select Tent </h4>
        <select name="tents">
            <option></option>

            <%

                ResultSet tentstoallocate = facilitytoallocate.fetch();
                while (tentstoallocate.next()) {%>
            <option style="text-size:50px;"><%=tentstoallocate.getString("facilitiyName")%>(<%=tentstoallocate.getString("tentSize")%>)</option>
            <%}%>
        </select>
        <input type="hidden" name="eventsID" value="<%=eventID%>" />


        <%
                    }

                }
            } catch (Exception e) {
                System.out.print(e);
            }
        %>

        <div style="margin-top:20px;">
            <center><button class="btn btn-success">Next</button></center>
        </div>

        </form>


    </body>
</html>
