<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Dashboard</title>

<%@ include file="../Layouts/Styles.jsp" %>

</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
    
<%@ include file="../Layouts/Navigation.jsp" %>

<div class="content-wrapper">
    <div class="container-fluid">
        <!-- Bread crumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="index.jsp">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Blank Page</li>
        </ol>
        <div class="row">
          <div class="col-12">
                
              <form action="<%=request.getContextPath()%>/MyServletBook" method="post">
                Event name:<input type="text" name="B_eventName"><br>
                Category:<input type="text" name="B_category"><br>
                Event Description:<input type="text" name="B_description"><br>
                Date:<input type="date" name="B_start"><br>
                Start time:<input type="time" name="B_start_time"><br>
                End time:<input type="time" name="B_end_time"><br>
                Location:<input type="text" name="B_location"><br> 
                Seats Allocation:<input type="number" name="seats"><br>
                <input type="submit" name="submit" value="submit">
            </form>
              
              
          </div>
        </div>
    </div>
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
    
    <%@ include file="../Layouts/Footer.jsp" %>
    <%@ include file="../Layouts/Scripts.jsp" %>

</div>
</body>

</html>
