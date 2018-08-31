<!DOCTYPE html>
<html>
<title>Kitchen</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ include file="Layouts/Styles.jsp" %>

<body class="w3-light-grey">
 
<%@ include file="Layouts/Navigation.jsp" %>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">
    
    
    
    
    <style>
.button {
    background-color:#009688;
    border: none;
    color: white;
    padding: 5px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    margin: 3px 2px;
    cursor: pointer;
    align-items: right;
}
</style>
    
    
    
    
        <div>
    <center><h1 style="color:#10707f" >Raw Materials </h1></center>
    </div>
    <hr><hr>
    <div>
    <%-- Insert raw materials--%>
    <div class="container-fluid" style="width:100%" align="left" >
        <div class="con" style="background-color: #10707f; color: white; width: 30%" >
            <h4>Insert Raw Materials </h4>
        </div>
    </div>
    
    <div class="container-fluid" widith="30%" align="left" > 
        
        
        <form action="../insertRaw" method="POST" onclick="submit">

        <div>
        Raw material Name :
        <input type="text" name="name"  placeholder="Name" />
        
        <br><br>
        
        Unit type :
        <input type="text" name="Utype"  placeholder="Type" />
        
        <br> <br>
        
        Unit price :
        <input type="text" name="Uprice"  placeholder="Price" />
        
        <br><br>
        
        Quantity :
        <input type="text" name="qty"  placeholder="Quantity" />
        <br>
        
        </div>
        <div>
         <button class="button">INSERT</button>
        </div>
        </form>
        
        
        <br>
        <%--Update unit price--%>
        <div class="con" style="background-color: #10707f; color: white; width:30%" >
        <h4>Update Unit-Price </h4>
        </div>
        
        <form action="../updatePrice" method="POST" onclick="submit">
        <div class="container-fluid" widith="30%" height="15%" align="left">
            Raw material Name :
        <input type="text" name="name"  placeholder="Name" />
            <br><br>
        Unit Price :
        <input type="text" name="Uprice"  placeholder="Price"/>
            <br>
        <div class="container-fluid" widith="30%"> 
        <button class="button">UPDATE</button>
        </div>
        </div>
        </form>
           
        
        <br>
        <%--Remove raw materials--%>
        <div class="con" style="background-color: #10707f; color: white; width:30%" >
         <h4>Delete Raw Materials </h4>
        </div>
        
        <form action="../removeRaw" method="POST" onclick="submit">
        <div class="container-fluid" widith="30%" height="15%" align="left">
        Raw material Name :
        <input type="text" name="name"  placeholder="Name" />
        <br>
        <div> <button class="button">DELETE</button> </div>
        </div>
        </form>
        
        
        <br>
        <%--Update Quantity--%>
        <div class="con" style="background-color: #10707f; color: white; width:30%" >
        <h4>Update Quantity</h4>
        </div>
        
        <form action="../updateQuantity" method="POST" onclick="submit">
       <div class="container-fluid" widith="30%" height="20%" align="left">
        Raw material Name :
        <input type="text" name="name"  placeholder="Name" />
        <br><br>
        Quantity :
        <input type="text" name="qty"  placeholder="Quantity" />
        <br>
        <div> <button class="button" name="addremove" value='add'>ADD</button>
            <button class="button" name='addremove' value="remove">Remove</button> </div>
        </div>
        
    </form>
        
        
        
    </div>
    
    
    
        <div class="container-fluid" width='40%' align='right'>
        <div class="col-md-4" style="background-color: #10707f; color: white; height: 20%; width: 40% ; text-align: left">
            <h3>Available Raw Materials </h3>
        </div>

         </div>
    <div class="con" width='40%' align='right' height='90%'>
        
        <table border="1" width="35%" cellspacing="2">
            <thead>
                <tr>
                    <th>Raw Materials Name</th>
                    <th>Quantity</th>
                    <th>Unit Price</th>
                </tr>
            </thead>
            <tbody>

            
            </tbody>
        </table>

        
    </div>
   
    
    </div>
    
<%--
    <div style="position:absolute; bottom:0; width:100%; height:10px; background:#6cf;">
        <%@ include file="Layouts/Footer.jsp" %></div>
    <!-- End page content -->
</div>
--%>
<%@ include file="Layouts/Scripts.jsp" %>
</body>
</html>



