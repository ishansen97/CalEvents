<%-- 
    Document   : testsearch
    Created on : Oct 6, 2018, 12:26:40 AM
    Author     : Lini Eisha
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Connection.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
     <%--  <form class="form-inline my-2 my-lg-0" action="" method="get">
              <input class="form-control" type="text" name="search" placeholder="Search" aria-label="Search">
        <%--  <button class="btn btn-outline-info my-2 my-sm-0" id="insertsearch" type="submit">Search</button> 
    </form>
    <div class="col-sm-6-" style="overflow-y:scroll; height:400px;">
        <div class="">
            <table class="table" border="3" width="35%" cellspacing="2" >
                <thead class="thead-dark">
                    <tr>
                        <th>Raw Materials Name</th>
                        <th>Quantity</th>
                        <th>Quantity Type</th>
                        <th>Unit Price</th>
                    </tr>
                </thead>
                <tbody>

                        <%
                            DBConnect db = DBConnect.getInstance();
                            Connection con = db.getCon();
                            Statement stat = null;
                            ResultSet data1 = null;

                            String query = request.getParameter("search");

                            stat = con.createStatement();
                            String data;
                            if (query != null) {
                                data = "SELECT * FROM `raw_materials` WHERE `name` LIKE '%" +query + "%' ";
                            } else {
                                data = "SELECT * FROM `raw_materials`";
                            }
                            data1 = stat.executeQuery(data);

                        %>
                        <%while (data1.next()) {%>
                        <tr>
                            <td><%=data1.getString("name")%></td>
                            <td><%=data1.getString("quantity")%></td>
                            <td><%=data1.getString("qType")%></td>
                            <td style="text-align:right;"><%=data1.getDouble("unit_price")%></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
        </div> --%>

        <%
            String name = request.getParameter("");
            try {
                DBConnect db = DBConnect.getInstance();
                            Connection con = db.getCon();
                            Statement sta = null;
                            ResultSet data1 = null;
                            
                            PreparedStatement stat = con.prepareStatement("SELECT * FROM `raw_materials` WHERE `name` LIKE '?'");
                            stat.setString(1, name+"%");
                             data1 = stat.executeQuery(name);
  
                        while (data1.next()) {
                            out.println(data1.getString("name"));
                        }             
            }
            catch (Exception ex){
                ex.getMessage();
            }


        %> 






    </body>
</html>
