<!DOCTYPE html>
<html>
<title>Customer</title>
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
    <center>
           
        <table>
        <tr><h1 class="pt-3"> Main Menu </h1></tr>
    </table>
       
    </center>
    
    
    <div class="container-fluid pt-5">
        <div class="row">
 
            <!--Beginning of card-->
            <div class="col-md-4 col-sm-6 offset-md-2 offset-0">
<!--            <h3 class="bg-success"> Appertizer. </h3>
            <a href="../Appertizer.jsp"><img src="../Starter 1.jpg" class="img-fluid" style="height:200px"></a>
            <p> Description. </p>-->

            <!-- This where the actual card stars. This in Bootstrap 4 -->

            <div class="card">
                <div class="card-header bg-success"> <h3> Appetizer. </h3> </div>
                    <div class="card-body p-0">
                    <a href="Appertizer.jsp"><img src="Starter 1.jpg" class="img-fluid" style="height:200px"></a>
                </div>
            </div>
            </div>
            <!--End of card-->
            
            <!--Beginning of card-->
         <!--   <div class="col-md-4 col-sm-6 offset-md-2 offset-0"> -->
            <div class="card">
                <div class="card-header bg-primary"> <h3> Main-Dish. </h3> </div>
                <div class="card-body p-0">
                    <a href="MainDish.jsp"><img src="MainDish3.jpg" class="img-fluid" style="height:220px"></a>
                    
                </div>
            </div>
            </div>
            <!--End of card-->
            
       
        
        <div class="row">  
 
            <!--Beginning of card-->
         <div class="col-md-4 col-sm-6 offset-md-2 offset-0"> 
            <div class="card">
                <div class="card-header bg-danger"> <h3> Deserts. </h3> </div>
                <div class="card-body p-0">
                    <a href="Deserts.jsp"><img src="Deserts1.jpg" class="img fluid" style="height:174.5px"></a>
            
                </div>        
            </div>
        </div>     
            <!--End of card-->
            
            <!--Beginning of card-->
        <!--    <div class="col-md-4 col-sm-6">   -->
        <div class="card">
            <div class="card-header bg-success"> <h3> Refreshments. </h3> </div>
            <div class="card-body p-0">
                <a href="Refreshments.jsp"><img src="Refreshments1.jpg" class="img-fluid" style="height:200px"></a>
                
            </div>
            
        </div>   

            </div>
            <!--End of card-->
            
        </div>
    </div>

    
        


    <%@ include file="Layouts/Footer.jsp" %>
<!-- End page content -->
</div>

<%@ include file="Layouts/Scripts.jsp" %>
</body>
</html>