<!DOCTYPE html>

<title>Appetizer</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ include file="Layouts/Styles.jsp" %>


<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <style>
  .fakeimg {
      height: 200px;
      background: #aaa;
  }
  </style>



<body class="w3-light-grey">
 
<%@ include file="Layouts/Navigation.jsp" %>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">
    
    <!-- Type your code Here -->
    
    <div class="container">
        <center><h2>Add your Appetizer</h2></center>
            <form action="<%=request.getContextPath()%>/AppertizerServlet" >
        <!--<div class="form-group">
            <label for="email"> Appetizer ID : </label>
            <input type="text" class="form-control" placeholder=" Enter ID " name="email">
        </div>-->
        <div class="form-group">
            <label> Appetizer Name : </label>
            <input type="text" class="form-control" placeholder="Enter Appetizer Name " name="app_name" required=" ">
        </div>
        <div class="form-group">
            <label> Ingredients : </label>
            <input type="text" class="form-control" placeholder="Enter Ingredients Name " name="appertizer_Ingredients_name" >
        </div>  
        
        <div class="form-group">
            <label> Price (in $): </label>
            <input type="text" class="form-control" placeholder="Enter Price " name="appertizer_Price" >
        </div> 
        
        <div class="row">
               <div class="col-md-6">
                   <button type="submit" class="btn btn-primary float-left"> Submit </button>
               </div>
            
             <div class="col-md-6">
                <button type="submit" class="btn btn-primary float-right" align="left"> <a class="text-white" href="index.jsp"> Main-Menu </a></button>
             </div>
               
         </div>
            </form>
    </div>
      <div class="col-md-6">
          <button type="submit" class="btn btn-primary float-right" align="left"> <a class="text-white" href="UpdateAppertizer.jsp"> Update </a></button>
      </div>


    <%@ include file="Layouts/Footer.jsp" %>
<!-- End page content -->
</div>

<%@ include file="Layouts/Scripts.jsp" %>
</body>
