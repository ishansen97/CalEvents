<%@page import="java.sql.ResultSet"%>
<%@page import="supporting.Fetch"%>
<!DOCTYPE html>
<html>
<head>
<title>Facility</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
    function addf(){
        
        //hide
        
        document.getElementById('updateM').style.display='none'; 
        document.getElementById('deleteM').style.display='none';   
        document.getElementById('viewM').style.display='none';
            
        //view Add operations
        document.getElementById('addM').style.display='';
    }
    function deletef(){
        
        //hide 
                
        document.getElementById('updateM').style.display='none';                
        document.getElementById('viewM').style.display='none';
        document.getElementById('addM').style.display='none';
        
        //view Add operations
        document.getElementById('deleteM').style.display='';
    }
    function updatef(){
        //hide 
                
        document.getElementById('viewM').style.display='none';
        document.getElementById('addM').style.display='none';
        document.getElementById('deleteM').style.display='none';
        
        
        //view Add operations
        document.getElementById('updateM').style.display='';
    }
    function viewf(){
        
        //hide
        document.getElementById('updateM').style.display='none'; 
        document.getElementById('deleteM').style.display='none';        
        document.getElementById('addM').style.display='none';
        
        //view Add operations
        document.getElementById('viewM').style.display='';
    }
</script>
<style>            .button {
                background-color: #4CAF50; /* Green */
                border: none;
                color: white;
                padding: 16px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                -webkit-transition-duration: 0.4s; /* Safari */
                transition-duration: 0.4s;
                cursor: pointer;
            }
            
            .button5 {
                background-color: white;
                color: black;
                border: 2px solid #555555;
            }
            .button5:hover {
                background-color: #555555;
                color: white;
            }</style>
    
</head>
<%@ include file="Layouts/Styles.jsp" %>
<body style="background-color: #555555">
 
<%@ include file="Layouts/Navigation.jsp" %>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">
    
<!--        
    <div class="container-fluid" style=" padding-left: 200px; padding-top: 200px">
        <div class="row">
            <div class="col-md-4" style="background-color: #009688;">-->
            <h1 style="color: white">Select an Operation:</h1>
            <!--</div>-->
            <br>    <br> <br>

            <!--<div class="col-1" style="background-color: #009688;font-size: 30px;" >-->
                <input class="button button5"  style=" color: #009999" type="submit" value="ADD" name="addF" onclick="javascript:addf();" />
            <!--</div>-->
            <!--<div class="col-1.5" style="background-color: #009688;font-size: 30px;" >-->
                <input  class="button button5" style=" color: #009999" type="submit" value="DELETE" name="deleteF" onclick="javascript:deletef();" />
            <!--</div>-->
            <!--<div class="col-2" style="background-color: #009688;font-size: 30px;" >-->
                <input  class="button button5" style=" color: #009999" type="submit" value="UPDATE" name="updateF" onclick="javascript:updatef();" />
            <!--</div>-->
                
                <input  class="button button5" style=" color: #009999" type="submit" value="VIEW" name="viewF" onclick="javascript:viewf();" />
        <!--</div>-->
    <!--</div>-->
            
            <div style="display: none" id="addM">
            <%@include file="addFacility.jsp" %>
            </div>
            
            <div style="display: none" id="viewM">
            <%@include file="viewFacility.jsp" %>
            </div>
            
            <div style="display: none" id="deleteM">
            <%@include file="deleteFacility.jsp" %>
            </div>
            
            <div style="display: none" id="updateM">
            <%@include file="updateFacility.jsp" %>
            </div></div>       
            
            <% String message = (String)request.getAttribute("errorMessage");%>
            <%if(message!=null){%>
            <script type="text/javascript">
            var msg = "<%=message%>";
            alert(msg);

            </script><%}%>
        <%--<%@ include file="Layouts/Footer.jsp" %>--%>
<!--</div>-->
    
<%@ include file="Layouts/Scripts.jsp" %>

</body>
</html>