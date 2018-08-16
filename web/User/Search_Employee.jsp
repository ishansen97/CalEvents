<%@page import="java.sql.*,Employee.Employee" %>
  
<%  
String s=request.getParameter("val");  
if(s==null || s.trim().equals("")){  
out.print("Please enter employee id");  
}else{  
int id=Integer.parseInt(s);
out.print("<input type='text' value='read_Employee' name='action' hidden>");
out.print("<tr class='w3-blue-gray'>"
        + "<td>EMPID</td>"
        + "<td>Department</td>"
        + "<td>Last name</td>"
        + "<td></td>"
        + "</tr>");
try{  
String logged_user = session.getAttribute("p_id").toString();
ResultSet res = Employee.readEmployee(s, logged_user);
while(res.next()){
out.print("<tr style='font-family: 'Quicksand', sans-serif; font-size: 17px; cursor: default' class='w3-hover-dark-gray'>"
        + "<td>"+res.getString(1)+"</td>"
        + "<td>"+res.getString(14)+"</td>"
        + "<td>"+res.getString(5)+"</td>"
        + "<td style='width:120px'><button class='btn btn-warning btn-sm' type='submit' name='empId' value='"+res.getString(1)+"'><i class='fa fa-edit'></i> Update</button></td>"
        + "</tr>");
}   
}catch(Exception e){e.printStackTrace();}  
}  
%>  

