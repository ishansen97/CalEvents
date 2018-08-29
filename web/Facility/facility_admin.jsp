<!DOCTYPE html>
<html>
<title>Facility</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ include file="Layouts/Styles.jsp" %>

<body class="w3-light-grey">
 
<%@ include file="Layouts/Navigation.jsp" %>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">
    
    <div class="container-fluid" style=" padding-left: 200px; padding-top: 200px">
        <div class="row">
            <div class="col-md-3" style="background-color: #009688;">
            <h1 style="color: #c0c0c0">Select Facility :</h1>
            </div>
            <div class="col-md-4" style="background-color: #009688;">
            <select name="addFacility" style="font-size: 40px;">
            <option>Tents</option>
            <option>Sounds</option>
            <option>Kitchen Utensils</option>
            <option>Chairs</option>
            <option>Lights</option>
            <option>Tables</option>
        </select>
            </div>
            <div class="col-1" style="background-color: #009688;font-size: 30px;" >
                <input style=" color: #009999" type="submit" value="ADD" name="addF" />
            </div>
            <div class="col-1.5" style="background-color: #009688;font-size: 30px;" >
                <input style=" color: #009999" type="submit" value="DELETE" name="deleteF" />
            </div>
            <div class="col-2" style="background-color: #009688;font-size: 30px;" >
                <input style=" color: #009999" type="submit" value="UPDATE" name="updateF" />
            </div>
        </div>
    </div>

<div style="position:absolute; bottom:0; width:100%; height:60px; background:#6cf;">
        <%@ include file="Layouts/Footer.jsp" %></div>
    
</div>

<%@ include file="Layouts/Scripts.jsp" %>
</body>
</html>