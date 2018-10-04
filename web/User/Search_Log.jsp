<%@page import="java.sql.*,Log.Activity" %>
<html>
    <body>

        <%
            String s = request.getParameter("val");
            if (s == null || s.trim().equals("")) {
                out.print("Please enter a date");
            } else {
                out.print("<input type='text' value='read_Employee' name='action' hidden>");
                out.print("<tr class='w3-blue-gray'>"
                        + "<td>Actor</td>"
                        + "<td>Activity</td>"
                        + "<td>Date</td>"
                        + "<td>Time</td>"
                        + "</tr>");
                try {
                    ResultSet res = Activity.searchActivity(s);
                    while (res.next()) {%>

    <tr style="font-family: 'Quicksand', sans-serif; font-size: 19px" class="w3-hover-light-gray custom-text">
        <td style="width: 150px"><button class="btn btn-link" type="submit" name='empId' value="<%=res.getString("actor")%>"><%= res.getString("actor")%></button></td>
        <td><a data-toggle="collapse" style="text-decoration: none" href="#<%= res.getString("id")%>" role="button" aria-expanded="false" aria-controls="collapseExample"><%= res.getString("activity")%></a></td>
        <td style="width: 150px"><%= res.getDate("occurred_on")%></td>
        <td style="width: 120px"><%= res.getTime("occurred_on")%></td>
    </tr>
    <tr style="font-family: 'Quicksand', sans-serif; font-size: 19px;" class="w3-light-gray">
        <td></td>
        <td colspan="3">
            <div class="collapse" id="<%= res.getString("id")%>"><br>
                <p><%= res.getString("descripition")%></p>
            </div>
        </td>
    </tr>

    <%

                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    %>  
</body>
</html>
