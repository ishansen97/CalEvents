<%-- 
    Document   : determine
    Created on : Sep 1, 2018, 12:20:52 AM
    Author     : Lini Eisha
--%>
 
<%@page import="java.sql.ResultSet"%>
<%@page import="test.fetch"%>
<!DOCTYPE html>
<html>
<title>Kitchen</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   

<%@ include file="Layouts/Styles.jsp" %>


<body class="w3-light-grey">
 
<%@ include file="Layouts/Navigation.jsp" %>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

    
     <div>
        <center><h1 style="color:#10707f" >Raw Materials </h1></center>
    </div>
        <hr><hr>
    
        <div class="container">
            <h1 style="padding-left:0%;">Determine Raw Materials</h1>
            <hr><br>
    
           
         <div class="container">
             <ul class="nav nav-pills ">
                <li class="active"><a data-toggle="tab" href="#home">Appetizers</a></li>
                <li><a data-toggle="tab" href="#menu1">Main Dishes</a></li>
                <li><a data-toggle="tab" href="#menu2">Desserts</a></li>
                <li><a data-toggle="tab" href="#menu3">Refreshments</a></li>
             </ul>

            <div class="tab-content">
                
                
                
               <div id="home" class="tab-pane fade in active"><br>      
                <h3>Appetizers</h3>
                
                <%  
                    fetch app = new fetch();
                    ResultSet name1 = app.fetchAppetizers();
                %>
                
                <form action="../" method="POST" onclick="submit">
                <div class="col-sm-6">
                    <table class="table" border="5" width="35%" cellspacing="2">
                       
                     <thead class="thead-dark">
                        <tr>
                            <th>Name</th>
                            <th>Ingredients</th>
                            <th>Quantity</th>
                            
                        </tr>
                    </thead>
                        
                        
                    <tbody>
                        <%while(name1.next()){%>
                        <tr>
                            <td><%= name1.getString("name")%></td>
                                <%String in1 = name1.getString("ingredients");
                                String[] raws = in1.split(",");%>
                                <td>
                                <%for(int i=0;i<raws.length;i++){
                                %> 
                                <p><%=raws[i].trim()%></p>
                                <% } %>
                                </td>
                                <td>
                                    
                                  
                                  
                                  
                                  
                                  
                                    
                                </td>
                                
                        </tr>
                        
                    <%}%>
                    
                    </tbody>
                    </table>
                </div>
                </form>
               </div>
                
                
                
                
                
               <div id="menu1" class="tab-pane fade"><br>
                <h3>Main Dishes</h3>
             
                <%  
                    fetch md = new fetch();
                    ResultSet name2 = md.fetchMainDishes();
                %>
                
                <form action="../" method="POST" onclick="submit">
                <div class="col-sm-6">
                    <table class="table" border="5" width="35%" cellspacing="2">
                       
                     <thead class="thead-dark">
                        <tr>
                            <th>Name</th>
                            <th>Ingredients</th>
                            <th>Quantity</th>
                            
                        </tr>
                    </thead>
                        
                        
                    <tbody>
                        <%while(name2.next()){%>
                        <tr>
                            <td><%= name2.getString("name")%></td>
                                <%String in2 = name2.getString("ingredients");
                                String[] raws = in2.split(",");%>
                                <td>
                                <%for(int i=0;i<raws.length;i++){
                                %> 
                                <p><%=raws[i].trim()%></p>
                                <% } %>
                                </td>
                                <td>
                                    <input type="text" name="qty" value="qty" placeholder="quantity"/>
                                </td>
                                
                        </tr>
                        
                    <%}%>
                    
                    </tbody>
                    </table>
                </div>
                </form> 
               </div>
                
                
                
                
                
               <div id="menu2" class="tab-pane fade"><br>
                <h3>Desserts</h3>
                
                <%  
                    fetch fD = new fetch();
                    ResultSet name = fD.fetchDesserts();
                %>
                
                <form action="../" method="POST" onclick="submit">
                <div class="col-sm-6">
                    <table class="table" border="5" width="35%" cellspacing="2">
                       
                     <thead class="thead-dark">
                        <tr>
                            <th>Name</th>
                            <th>Ingredients</th>
                            <th>Quantity</th>
                            
                        </tr>
                    </thead>
                        
                        
                    <tbody>
                        <%while(name.next()){%>
                        <tr>
                            <td><%= name.getString("name")%></td>
                                <%String in3 = name.getString("ingredients");
                                String[] raws = in3.split(",");%>
                                <td>
                                <%for(int i=0;i<raws.length;i++){
                                %> 
                                <p><%=raws[i].trim()%></p>
                                <% } %>
                                </td>
                                <td>
                                    <input type="text" name="qty" value="qty" placeholder="quantity"/>
                                </td>
                                
                        </tr>
                        
                    <%}%>
                    
                    </tbody>
                    </table>
                </div>
                </form>
               </div>
                
                    
                    
                    
               <div id="menu3" class="tab-pane fade"><br>
                   
                <h3>Refreshments</h3>
                <%
                    fetch ref = new fetch();
                    ResultSet name4 = ref.fetchRefreshments();
                %>
                
                <form action="../" method="POST" onclick="submit">
                <div class="col-sm-6">
                    <table class="table" border="5" width="35%" cellspacing="2">
                       
                     <thead class="thead-dark">
                        <tr>
                            <th>Name</th>
                            <th>Ingredients</th>
                            <th>Quantity</th>
                            
                        </tr>
                    </thead>
                        
                        
                    <tbody>
                        <%while(name4.next()){%>
                        <tr>
                            <td><%= name4.getString("name")%></td>
                                <%String in4 = name4.getString("ingredients");
                                String[] raws = in4.split(",");%>
                                <td>
                                <%for(int i=0;i<raws.length;i++){
                                %> 
                                <p><%=raws[i].trim()%></p>
                                <% } %>
                                </td>
                                <td>
                                    <input type="text" name="qty" value="qty" placeholder="quantity"/>
                                </td>
                                
                        </tr>
                        
                    <%}%>
                    
                    </tbody>
                    </table>
                </div>
                </form> 
               </div>
            
            
            
            </div>
    
       </div>   
            
            
            
</div>
    
</body>
</html>
