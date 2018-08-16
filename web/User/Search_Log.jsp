<%@page import="java.sql.*,Log.Activity" %>
  
<%  
String s=request.getParameter("val");  
if(s==null || s.trim().equals("")){  
out.print("Please enter a date");  
}else{  
out.print("<input type='text' value='read_Employee' name='action' hidden>");
out.print("<tr class='w3-blue-gray'>"
        + "<td>Actor</td>"
        + "<td>Activity</td>"
        + "<td>Date</td>"
        + "<td>Time</td>"
        + "</tr>");
try{  
ResultSet res = Activity.searchActivity(s);
while(res.next()){
out.print("<tr style='font-family: 'Quicksand', sans-serif; font-size: 17px' class='w3-hover-light-gray'>"
        + "<td style='width: 150px'><button class='btn btn-link' type='submit' name='empId' value='"+res.getString("actor")+"'>"+res.getString("actor")+"</button></td>"
        + "<td>"+res.getString("activity")+"</td>"
        + "<td style='width: 150px'>"+res.getDate("occurred_on")+"</td>"
        + "<td style='width: 120px'>"+res.getTime("occurred_on")+"</td>"
        + "</tr>");
}   
}catch(Exception e){e.printStackTrace();}  
}  
%>  

