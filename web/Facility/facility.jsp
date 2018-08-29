<!DOCTYPE html>
<html>
    <head>
    <title>Facility</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%@ include file="Layouts/Styles.jsp" %>
    </head>
<body class="w3-light-grey">
 
<%@ include file="Layouts/Navigation.jsp" %>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">
    
    
         <div class="container" style=" padding-bottom: 10px"><h2></h2> 
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active" >
        <img src="6_2.png" alt="Sounds" style="width:100%; ">
      </div>

      <div class="item">
        <img src="7.jpg" alt="Tents" style="width:100%;">
      </div>
    
      <div class="item">
        <img src="8.jpg" alt="Tables" style="width:100%;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
    <div class="container-fluid">
        <div class="col-md-auto" style="background-color: #0c5460"><h1>Facility Packages</h1></div>
    </div>

    <div class="container-fluid" style="padding-bottom: 100px">
        <div class="row">
        <div class="col-3.5" style="background-color: #138496 ;color: #ffffff; padding-right:0px; padding-bottom: 10px;margin-left: 15px; margin-right: 7px">
        <h2>Sound Packages</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>Package Name</th>
                    <th>Facilities</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Vocalist Package</td>
                    <td>Electric Guitar, FM-Mic</td>
                    <td>1200.00</td>
                </tr>     
                <tr>
                    <td>Announcer Package</td>
                    <td>Amplifier, Two Speakers, FM-Mic</td>
                    <td>10000.00</td>
                </tr>     
                <tr>
                    <td>E Party Package</td>
                    <td>Console, Amplifier, Two JBL</td>
                    <td>12000.00</td>
                </tr>     
                <tr>
                    <td>Classic Package</td>
                    <td>Organ, Drums, Guitar</td>
                    <td>10000.00</td>
                </tr>               
            </tbody>
        </table><br><br>
        <div class="col-md-4" style="background-color: #138496; color: black; text-align: center">
            <select name="packages">
                <option>No need</option>                
                <option>Vocalist Package</option>
                <option>Announcer Package</option>
                <option>E Party Package</option>
                <option>Classic Package</option>
            </select>
        </div>
        </div>
        
        <div class="col-3.5" style="background-color: #138496 ;color: #ffffff; padding-right:0px; padding-bottom: 10px;margin-left: 7px; margin-right: 7px">
        <h2>Tent Packages</h2>    
        <table border="1">
        <thead>
                <tr>
                    <th>Package Name</th>
                    <th>Facilities</th>
                    <th>Price</th>
                </tr>
        </thead>
        <tbody>            
                <tr>
                    <td>Tent Package 01(Guests : 60)</td>
                    <td>20' x 30' 600 sq ft</td>
                    <td>15000.00</td>
                </tr>     
                <tr>
                    <td>Tent Package 02(Guests : 80)</td>
                    <td>20' x 40' 800 sq ft</td>
                    <td>18000.00</td>
                </tr>    
                <tr>
                    <td>Tent Package 03(Guests : 90)</td>
                    <td>30' x 30' 900 sq ft</td>
                    <td>22000.00</td>
                </tr>     
                <tr>
                    <td>Tent Package 04(Guests : 100)</td>
                    <td>20' x 50' 1000 sq ft</td>
                    <td>25000.00</td>
                </tr> 
        </tbody>
        </table><br><br>
        <div class="col-md-4" style="background-color: #138496; color: black; text-align: center">
            <select name="packages">
                <option>No need</option>                
                <option>Tent Package 01(Guests : 60)</option>
                <option>Tent Package 02(Guests : 80)</option>
                <option>Tent Package 03(Guests : 90)</option>
                <option>Tent Package 04(Guests : 100)</option>
            </select>
        </div>
        </div>
            
        <div class="col-3.5" style="background-color: #138496 ;color: #ffffff; padding-right:0px; padding-bottom: 10px;margin-left: 7px; margin-right: 7px">
        <h2>Table Packages</h2> 
        <table border="1">
        <thead>
                <tr>
                    <th>Package Name</th>
                    <th>Facilities</th>
                    <th>No Of Chairs(Each)</th>
                    <th>Price</th>
                </tr>
        </thead>
        <tbody>            
                <tr>
                    <td>Table Package 01</td>
                    <td>2 Tables</td>
                    <td>8</td>
                    <td>1000.00</td>
                </tr>     
                <tr>
                    <td>Table Package 02</td>
                    <td>5 Tables</td>
                    <td>4</td>
                    <td>1500.00</td>
                </tr>    
                <tr>
                    <td>Table Package 03</td>
                    <td>8 Tables</td>
                    <td>4</td>
                    <td>1800.00</td>
                </tr>     
                <tr>
                    <td>Table Package 04</td>
                    <td>10 Tables</td>
                    <td>4</td>
                    <td>2000.00</td>
                </tr>   
        </tbody>
        </table><br><br>
        <div class="col-md-4" style="background-color: #138496; color: black; text-align: center; ">
            <select name="packages">
                <option>No need</option>                
                <option>Table Package 01</option>
                <option>Table Package 02</option>
                <option>Table Package 03</option>
                <option>Table Package 04</option>
            </select>
            
        </div>
        </div>
             
        <input class="btn btn-outline-dark" type="submit" value="Done" name="Done" />
        </div>
       
        
        
        
   


    </div>
    
   
        <%@ include file="Layouts/Footer.jsp" %></div>
    <!-- End page content -->


<%@ include file="Layouts/Scripts.jsp" %>
</body>
</html>