<%-- 
    Document   : reservation_seat_arrangement
    Created on : Sep 29, 2018, 6:23:56 PM
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
                var modal_body = document.createElement("div");
                var modal_dialog = document.createElement("div");
                var modal_fade = document.createElement("div");
                
                rowDiv.className = "row collapse";
                columnDiv.className = "col-6";
                container.className = "container bg-white";
                w3_main.className = "w3-main";
                modal_body.className = "modal-body";
                modal_dialog.className = "modal-dialog bg-white";
                modal_fade.className = "modal fade";
                
                w3_main.style.marginLeft = "300px";
                container.id = "seat_arrangement";
                
                
                var button;
                var divElem;
                var count = 0;
                
                for (k = 1; k <= columns; k++) {
                    var colDiv = document.createElement("div");
                    colDiv.style.margin = "10px";
                    colDiv.style.display = "inline-block";
                    colDiv.style.border = "2px solid red";
                    
                    for (j = 1; j <= y; j++) {
                        divElem = document.createElement("div");
                        divElem.style.margin = "10px";
                        
                        for (i = 1; i <= x; i++) {
                            count = count + 1;
                            button = document.createElement("button");
                            button.style.margin = "2px";
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
//                modal_body.appendChild(mainDiv);
//                modal_dialog.appendChild(modal_body);
                container.appendChild(mainDiv);
                document.body.appendChild(container);
                  
                
            //}
        </script>
        <!--<p>Welcome to seat arrangement</p>-->
    </body>
</html>

