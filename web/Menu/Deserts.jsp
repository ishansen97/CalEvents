<!DOCTYPE html>

<title>Desert</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ include file="Layouts/Styles.jsp" %>


<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <style>
  .fakeimg {
      height: 200px;
      background: #aaa;
  }
  </style>
  
    <script type="text/javascript">
      function formValidate() {
          var price = document.getElementById("deserts_Price").value;
          
          var exp = /^[0-9]+$/;
          if (price.toString().match(exp)) {
              return true;
          }
          else {
              alert("Please Enter Numbers Only.");
              return false;
          }

      }
      
      

  </script>



<body class="w3-light-grey">
 
<%@ include file="Layouts/Navigation.jsp" %>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">
    
    <!-- Type your code Here -->
    <div class="container">
       <center> <h3> Add Your Desert </h3> </center>
       <form action ="<%=request.getContextPath() %>/DesertServlet" onsubmit="return formValidate()">
           <div class="form-group">
               <lable> Desert Name : </lable>
               <input type="text" class="form-control" placeholder="Enter Desert " name="desert_name">
           </div>
           
           <div class="form-group">
            <label> Ingredients : </label>
            <input type="text" class="form-control" placeholder="Enter Ingredients Name " name="deserts_Ingredients_name" >
        </div>  
        
        <div class="form-group">
            <label> Price (in $) : </label>
            <input type="text" class="form-control" placeholder="Enter Price " name="deserts_Price" id="deserts_Price">
        </div>
           
           <div></div>
           
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
          <button type="submit" class="btn btn-primary float-right" align="left"> <a class="text-white" href="UpdateDeserts.jsp"> Update </a></button>
      </div>    
           

    <%@ include file="Layouts/Footer.jsp" %>
<!-- End page content -->
</div>

<%@ include file="Layouts/Scripts.jsp" %>
</body>
