<%-- 
    Document   : determine
    Created on : Sep 1, 2018, 12:20:52 AM
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
    
    <h3>NOT SUPPORTED</h3>
    
</div></body></html>
