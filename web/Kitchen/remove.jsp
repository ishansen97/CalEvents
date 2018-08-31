<%-- 
    Document   : remove
    Created on : Aug 31, 2018, 11:01:46 PM
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
    
    
    <div width="100%" height="20%">
    <a href="insert.jsp"> <button class="button" name="addremove" value='insert'>Insert Raw Materials</button></a>
    <a href="remove.jsp"> <button class="button" name='addremove' value="remove">Remove Raw Materials</button></a>
    <a href="updatePrice.jsp"> <button class="button" name='addremove' value="updatePrice">Update Price</button></a>
    <a href="updateQty.jsp"> <button class="button" name='addremove' value="updateQty">Update Quantity</button></a>
    <a href="allocate.jsp"> <button class="button" name='addremove' value="allocate">Allocate Raw Materials</button> </a>
    <a href="determine.jsp"> <button class="button" name='addremove' value="determine">Determine Menu</button></a>
</div>
    <hr><hr>
    
    
        
    <hr><hr>
    <div class="container-fluid" widith="30%" align="left" > 
          <%--Remove raw materials--%>
        <div class="con" style="background-color: #10707f; color: white; width:30%" >
         <h4>Delete Raw Materials </h4>
        </div>
        
        <br><br>
        
        <form action="../removeRaw" method="POST" onclick="submit">
        <div class="container-fluid" widith="30%" height="15%" align="left">
        Raw material Name :
        <input type="text" name="name"  placeholder="Name" required="" />
        
        <br><br>
        
        <div> <button class="button">DELETE</button> </div>
        </div>
        </form>
    </div>
    </body>
</html>
