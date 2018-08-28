<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">

<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
</head>			
	

<body>
<div class="container">	
<article>
 <aside>         	        
<!-- Side bar -->
  <h3>
	<ul>
		<li> <a href="homePage1.jsp" class="button4">Home</a></li><br><br><br><br> 
		<li><a href="#" class="button4">Add Export </a></li><br><br><br><br>
		<li><a href="viewExpo.jsp" class="button4">View Export </a></li><br><br><br><br>
		<li><a href="ViewShipment.jsp" class="button4">View Shipment</a></li><br><br><br><br>
		<li> <a href="AboutUs1.jsp" class="button4">About Us</a></li><br><br><br><br>
 		<li><a href="ContactUs1.jsp" class="button4">Contact Us</a></li><br><br><br><br>
 	</ul>
	</h3>
</aside>

 <aside class="h">

<br><br>

	<h><b>Update your feedback</b></h>
	<br><br>
 	 <%
		
 		String fid = request.getParameter("fid");
	
			Connection connection = null;
			Statement statement = null;
			ResultSet resultSet = null;
		%>
		
			<%
			try{ 
				connection = DBConnection.createConnection();
					statement=connection.createStatement();
					String sql ="SELECT *  FROM  feedback where fid="+fid;

					resultSet = statement.executeQuery(sql);
					while(resultSet.next()){
					%>

	<form method="post" action="updateFeedbackServlet">
			
		<br>
		FID :<br>
			<input type="text" name="fid"  value="<%=resultSet.getString("fid") %>"readonly>
		<br>
		Name : <br>
		<input type="text" name="uname"  value="<%=resultSet.getString("username") %>" readonly>
		<br>
		User id: <br>
		<input type="text" name="userid" value="<%=resultSet.getString("userid") %>"readonly>
		<br>
		Email :<br>
		<label for="transpType">
		<input type="text" name="email" value="<%=resultSet.getString("email") %>" readonly>
		</label>
		<br>
		Subject :<br>
		<input type="text" name="subject" value="<%=resultSet.getString("subject") %>">
		<br>
		Comments :<br>
                <input type="text" name="comments" value="<%=resultSet.getString("comments") %>">
		<br><br>
		
		<input type="submit" value="Update">
	</form>
	<%
			}
		connection.close();
		} catch (Exception e) {
		
			e.printStackTrace();
		}
	%>
<br><br><br>

</aside>
</article>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	
 </body>
 </html>
