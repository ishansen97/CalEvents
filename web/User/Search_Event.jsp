<%@page import="java.sql.*,Employee.Assignment" %>
  
<%  
String s=request.getParameter("val");  
if(s==null || s.trim().equals("")){  
out.print("Please enter event id");  
}else{  
out.print("<input type='text' value='read_Employee' name='action' hidden>");
out.print("<tr class='w3-blue-gray'>"
        + "<td>EID</td>"
        + "<td>Name</td>"
        + "<td>Location</td>"
        + "<td>Date</td>"
        + "<td></td>"
        + "</tr>");
try{  
ResultSet res = Assignment.viewEvent(s);
while(res.next()){
out.print("<tr style='font-family: 'Quicksand', sans-serif; font-size: 17px; cursor: default' class='w3-hover-dark-gray'>"
        + "<td>"+res.getString("event_ID")+"</td>"
        + "<td>"+res.getString("event_Name")+"</td>"
        + "<td>"+res.getString("location_ID")+"</td>"
        + "<td>"+res.getString("Date")+"</td>"        
        + "<td style='width:120px'><button class='btn btn-warning btn-sm' type='submit' name='empId' value='"+res.getString("event_ID")+"'><i class='fa fa-edit'></i> Update</button></td>"
        + "</tr>");
}   
}catch(Exception e){e.printStackTrace();}  
}  
%>  

