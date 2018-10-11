<%-- 
    Document   : nextTimeTest
    Created on : Sep 9, 2018, 1:35:22 PM
    Author     : hp
--%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.sql.*, Event.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            DBConnect connect = DBConnect.getInstance();
        String query = null;
//        ResultSet result = null;
        
        String location = "H001";
        LocalTime startTime = LocalTime.parse("01:00:00");
        LocalTime endTime =LocalTime.parse("04:00:00");
        String date = "2018-09-09";
        
        if(connect.isConnected()){
            Connection con = connect.getCon();
//            Statement st = con.createStatement();
//            query = "SELECT end_time" +
//                    "FROM public_events" +
//                    "WHERE date ='" +date+ "' AND location_ID = '" +location+
//                    "' ORDER BY end_time DESC LIMIT 1";

            query = "SELECT * FROM `public_events` "
                    + "WHERE location_ID = ? "
                    + "AND date=? ";
            
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, location);
            ps.setString(2, date);
            out.println(ps.toString());
            out.println("<br>");
            ResultSet rs = ps.executeQuery();
            
            Boolean dateValid = false;
            out.println("<h1>" + startTime + " - " + endTime + "</h1>");
            while(rs.next()) {
                out.println(rs.getString("start_time") + " to " + rs.getString("end_time"));
                out.println("::");
                LocalTime st = LocalTime.parse(rs.getString("start_time")).minus(2, ChronoUnit.HOURS);
                LocalTime et = LocalTime.parse(rs.getString("end_time")).plus(2, ChronoUnit.HOURS);
                
                out.println("RANGE: " + st + " to " + et + " === ");
                if(startTime.compareTo(et) > 0) {
                    out.println("new_start after end = true");
                    dateValid = true;
                } else if (endTime.isBefore(st)) {
                    out.println("new_end before start = true");
                    dateValid = true;
                } else {
                    dateValid = false;
                    out.println("<br>");
                    break;
                }
                out.println("<br>");
            }
            out.println("valid: "+ dateValid);
        }        
        %>
    </body>
</html>
