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
</script><style>
/* Style The Dropdown Button */
.dropbtn {
    background-color: #4CAF50;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
    position: relative;
    display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #f1f1f1}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
    display: block;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {
    background-color: #3e8e41;
}
</style>
<style>     .button {
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
<body style="background-color: #ededed">
 
<%@ include file="Layouts/Navigation.jsp" %>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">
    
<!--        
    <div class="container-fluid" style=" padding-left: 200px; padding-top: 200px">
        <div class="row">
            <div class="col-md-4" style="background-color: #009688;">-->
            <h1 style="color: #ededed">Select an Operation:</h1>
            <!--</div>-->
            <br>    <br> <br>

            <!--<div class="col-1" style="background-color: #009688;font-size: 30px;" >-->
                <input class="button button5"  style=" color: #009999" type="submit" value="ADD" name="addF" onclick="javascript:addf();" />
            <!--</div>-->
<!--            <div class="col-1.5" style="background-color: #009688;font-size: 30px;" >
                <input  class="button button5" style=" color: #009999" type="submit" value="DELETE" name="deleteF" onclick="javascript:deletef();" />
            </div>
            <div class="col-2" style="background-color: #009688;font-size: 30px;" >
                <input  class="button button5" style=" color: #009999" type="submit" value="UPDATE" name="updateF" onclick="javascript:updatef();" />-->
            <!--</div>-->
                
                <input  class="button button5" style=" color: #009999" type="submit" value="VIEW" name="viewF" onclick="javascript:viewf();" />
                            
    
    
            <div class="dropdown">
            <button class="button button5">Dropdown</button>
            <div class="dropdown-content">
                <a href="update.jsp">Update</a>
                <a href="delete.jsp">Delete</a>
                <a href="delete.jsp">Allocate</a>
            </div>
            </div>       
        <!--</div>-->
    <!--</div>-->
            
            <div style="display: none" id="addM">
            <%@include file="addFacility.jsp" %>
            </div>
            
            <div style="display: none" id="viewM">
            <%@include file="view.jsp" %>
            </div>

            
            <div style="display: none" id="deleteM">
            <%@include file="delete.jsp" %>
            </div>
            
            <div style="display: none" id="updateM">
            <%@include file="update.jsp" %>
            </div>
</div>     
            
            <% String message = (String)session.getAttribute("FacilityErrorMessage");%>
            <%if(message!=null){%>
            <script type="text/javascript">
            var msg = "<%=message%>";
            alert(msg);

            </script><% 
                session.removeAttribute("FacilityErrorMessage");
                    }%>
            
        <%--<%@ include file="Layouts/Footer.jsp" %>--%>
<!--</div>
    
<%@ include file="Layouts/Scripts.jsp" %>

</body>
</html>