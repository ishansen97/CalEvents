<%@page import="java.sql.*,Employee.Employee" %>

<%
    String s = request.getParameter("val");
    if (s == null || s.trim().equals("")) {
        out.print("Please enter a valid employee id");
    } else {
        out.print("<input type='text' value='read_Employee' name='action' hidden>"
                + "<input type='text' value='mini_Profile' name='redirectPath' hidden>");
        out.print("<tr class='w3-blue-gray'>"
                + "<td>EMPID</td>"
                + "<td>Department</td>"
                + "<td>First Name</td>"
                + "<td>Last Name</td>"
                + "<td></td>"
                + "</tr>");
        try {
            String logged_user = session.getAttribute("p_id").toString();
            ResultSet res = Employee.readEmployee(s, logged_user);
            while (res.next()) {
                out.print("<tr style='font-family: 'Quicksand', sans-serif; font-size: 19px; cursor: default' class='w3-hover-dark-gray'>"
                        + "<td>" + res.getString("id") + "</td>"
                        + "<td>" + res.getString("department") + "</td>"
                        + "<td>" + res.getString("first_name") + "</td>"
                        + "<td>" + res.getString("last_name") + "</td>"
                        + "<td style='width:120px'><button class='btn btn-info btn-sm' type='submit' name='empId' value='" + res.getString("id") + "'><i class='fa fa-spinner'></i> View</button></td>"
                        + "</tr>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>  

