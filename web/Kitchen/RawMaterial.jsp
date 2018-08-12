<%-- 
    Document   : menuInter
    Created on : Aug 10, 2018, 9:56:31 PM
    Author     : Lini Eisha
--%>

<!DOCTYPE html>
<html>
<title>Kitchen</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ include file="Layouts/Styles.jsp" %>

<body class="w3-light-grey">
 
<%@ include file="Layouts/Navigation.jsp" %>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">\
    
    <h1><center>Raw materials!</center></h1>
   
    
    <form action="rawMaterials" method="POST">
    <div>
    
        
        Raw material Name :
        <input type="text" name="name"  placeholder="Name" />
        
        <br><br>
        
        Unit price :
        <input type="text" name="Uprice"  placeholder="Price" />
        
        <br><br>
        
        Quantity :
        <input type="text" name="qty"  placeholder="Quantity" />
        
        
        <br><br><br>
        
        </div>
        <div>
         <button type="submit" name="insert">INSERT </button>        
        
         
         
         <button type="submit" name="update"> UPDATE </button>
         
         
         <button type="submit" name="delete"> DELETE </button>
    
    </div>
    
    </form>
    <div>
        
       
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    <%@ include file="Layouts/Footer.jsp" %>
<!-- End page content -->
</div>

<%@ include file="Layouts/Scripts.jsp" %>
</body>
</html>


