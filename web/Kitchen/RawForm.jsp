<%-- 
    Document   : RawForm
    Created on : Sep 11, 2018, 10:08:43 PM
    Author     : Lini Eisha
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="test.fetch"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <style> 
        body h3{
                    background-color: #10707f;
                    color:white;
                    width: 25% ; 
                }
                form{
                    border-style:solid ;
                    border-color:#002752;
                    border-left: 8px solid #002752;
                }
        </style>

        
        
    </head>
    
    
    <body>
        
        <div id="RawForm"  style="display:none;" class="RawForm">
            
        <form class="form">
            <div>
                <h3>Insert Raw Materials</h3>
                <table>
                 
                <tr>
                    <td> MenuID:  </td> 
                    <td><input class="form-control form-control-lg" name='item_id' type="text" placeholder="menuID"> </td>
                
                </tr>
                <%  

                    fetch raw = new fetch();
                    ResultSet name = raw.fetchData();
                %>
                <tr>
                    <td> Raw Material name:   </td>
                    <td><select name="name">
                    <option>Raw Material Name</option>
                    <%while (name.next()) {%>
                    <option><%=name.getString("name")%></option>
                    <%}%>
                    </select> </td>
                </tr>
                
                <tr>
                    <td> Quantity  </td> 
                    <td><input class="form-control form-control-lg"  type="text" placeholder="quantity"> </td>
                </tr>
                
                <tr>
                    
                </tr>
                <input type="button" name="form" value="Show Div" onclick="showDiv()" />
                </table>
   
            </div>
        </form>
        </div>
            
      
</body>
</html>

        