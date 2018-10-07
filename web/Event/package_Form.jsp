<%-- 
    Document   : package form
    Created on : Sep 13, 2018, 10:58:35 PM
    Author     : User
--%>

<%@page import="Event.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <h3 class="">Select your event type</h3>
    <hr>
    <div class="form-group font-weight-bold">
        <div class="form-group">
            <label for="in" class="form-check-label mr-3 alert-info p-2 rounded-1">
                <input class="mr-2" type="radio" name="inout" value="indoor" id='in'/> Indoor
            </label>
            <label for="out" class="form-check-label alert-info p-2 rounded-1">
                <input class="mr-2" type="radio" name="inout" value="outdoor" id='out'/> Outdoor
            </label>
        </div>
    </div>
    <div class="form-group">
        <div id="indoorStuff" style="display:none;">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>
                            <h5>Select Facilities</h5>
                        </th>
                    </tr>
                </thead>
                
                <tbody>
                    <tr>
                        <td>
                            <div class="mb-2">Select Entertainment Package</div>
                            <div class="ml-4">
                                <%

                                    DBConnect db = DBConnect.getInstance();
                                    ResultSet fetchPackagesforCustomer = null;
                                    PreparedStatement queryFetchPackages = null;

                                    try {
                                        if (db.isConnected()) {
                                            Connection con = db.getCon();
                                            queryFetchPackages = con.prepareStatement("SELECT * FROM `facility_packages`");
                                            fetchPackagesforCustomer = queryFetchPackages.executeQuery();
                                            while (fetchPackagesforCustomer.next()) {


                                %>
                                <div class="form-group mt-1">
                                    <label for="<%= fetchPackagesforCustomer.getString("packageID")%>" class="form-check-label">
                                        <input class="mr-2" type="radio" name="packageselected" id="<%= fetchPackagesforCustomer.getString("packageID")%>" value="<%=fetchPackagesforCustomer.getString("packageName")%>">
                                        <%=fetchPackagesforCustomer.getString("packageName")%>
                                    </label>
                                </div>
                                <%}%>

                                <%}
                                    } catch (Exception e) {
                                        out.print(e);
                                    }%>
                            </div>
                        </td>
                    </tr>
                    <tr class="p-2">
                        <td>
                            <div class="mr-2">
                                <input type="checkbox" name="chairs" id="chairs"  value="ON" />
                                <label class="ml-2" for="chairs">Chairs</label>
                                <span id="chairsOpt" style="display:none;">  
                                    <input class="form-control form-control-inline mb-2 d-inline-block" type="number" name="requiredChairs" id="requiredChairs" placeholder="Number of chairs"/>
                                </span>
                            </div>
                        </td>
                        </td>
                    </tr>
                    <tr class="p-2" style="display:none;" id="tentsOption">
                        <td>
                            <div class="mr-2">
                                <input type="checkbox" name="tents" id="tents"  value="ON" />
                                <label class="ml-2"  for="tents">Party tent</label>
                            </div>
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("#sounds").click(function () {
            $("#soundsOpt").toggle();
            $("#lightsOpt").toggle();
        });
    });
    $(document).ready(function () {
        $("#mics").click(function () {
            $("#micOpt").toggle();
        });
    });
    $(document).ready(function () {
        $("#chairs").click(function () {
            $("#chairsOpt").toggle();
        });
    });
    $(document).ready(function () {
        $("#in").click(function () {
            $("#indoorStuff").show();
            $("#tentsOption").hide();
        });
    });
    $(document).ready(function () {
        $("#out").click(function () {
            $("#indoorStuff").show();
            $("#tentsOption").show();
        });
    });
</script>

</html>
