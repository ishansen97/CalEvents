<%-- 
    Document   : createHTML
    Created on : Sep 12, 2018, 8:10:56 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="./Layouts/Styles.jsp" %>
        <%@include file="./Layouts/Scripts.jsp" %>
    </head>
    <% int columns = Integer.parseInt(request.getParameter("columns"));
       int x = Integer.parseInt(request.getParameter("x"));
       int y = Integer.parseInt(request.getParameter("y"));
    %>
    <body>
        <input type="hidden" id="cols" value="<%=columns %>">
        <input type="hidden" id="x-dir" value="<%=x %>">
        <input type="hidden" id="y-dir" value="<%=y %>">
        <script>
            //fucntion createHTMLContent() {
                var columns = document.getElementById("cols").value;
                var x = document.getElementById("x-dir").value;
                var y = document.getElementById("y-dir").value;
                var total_seats = columns * x * y;
                
                var i,j,k;
                var mainDiv = document.createElement("div");
                var rowDiv = document.createElement("div");
                var columnDiv = document.createElement("div");
                var container = document.createElement("div");
                var w3_main = document.createElement("div");
                
                rowDiv.className = "row";
                columnDiv.className = "col-12";
                container.className = "container bg-white";
                w3_main.className = "w3-main";
                
                w3_main.style.marginLeft = "300px";
                
                
                var button;
                var divElem;
                var count = 0;
                
                for (k = 1; k <= columns; k++) {
                    var colDiv = document.createElement("div");
                    colDiv.style.margin = "20px";
                    colDiv.style.display = "inline-block";
                    colDiv.style.border = "3px solid red";
                    
                    for (j = 1; j <= y; j++) {
                        divElem = document.createElement("div");
                        divElem.style.margin = "10px";
                        
                        for (i = 1; i <= x; i++) {
                            count = count + 1;
                            button = document.createElement("button");
                            button.style.margin = "5px";
                            button.style.color = "black";
                            button.className = "btn-outline-danger";
                            var text = document.createTextNode(count);
                            button.appendChild(text);
                            divElem.appendChild(button);
                        }
                        colDiv.appendChild(divElem);
                    }
                    mainDiv.appendChild(colDiv);
                } 
                columnDiv.appendChild(mainDiv);
                rowDiv.appendChild(columnDiv);
                container.appendChild(rowDiv);
                w3_main.appendChild(container);
                document.body.appendChild(w3_main);

                
            //}
        </script>
        
    </body>
</html>
