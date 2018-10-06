<%-- 
    Document   : Menu_Overview
    Created on : Sep 19, 2018, 2:05:04 PM
    Author     : Sohan
--%>
<%@page import="java.sql.*, menu.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>Menu - Add Item</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<%@ include file="./Layouts/Styles.jsp" %>
<%@ include file="./Layouts/Navigation.jsp" %>
<script src="./Layouts/canvasjs.js"></script>
    </head>
    
    <body onload="menuGraph()">
        
        <%  ResultSet category_chart = MenuReports.displayMenuCategories();
            String dataset = "";
            while (category_chart.next()) {
                dataset += " { y : " +category_chart.getString("COUNT(*)")+ ", label : \"" +category_chart.getString("category")+ "\"},";
            }
            dataset += "";
            StringBuilder builder = new StringBuilder(dataset);
            int index = builder.lastIndexOf(",");
            builder.deleteCharAt(index);
            
            out.println(dataset);
        %>
<script>
    function menuGraph() {
        var chart = new CanvasJS.Chart("graph", {
            animationEnabled : true,
            theme : "light2",
            title : {
                text : "Menu chart"
            },
            axisY: {
                title : "Menu"
            },
            data: [{
                    type : "column",
                    showInLegend : true,
                    legendMarkerColor : "grey",
                    legendText: "menus",
                    dataPoints: [<%=builder %>]
            }]
        });
        chart.render();
        
    };
</script>

<div id="graph" style="width: 900px; height: 400px; margin-left: 400px; margin-top: 100px" ></div>
       <%@ include file="Layouts/Footer.jsp" %>
        <!-- End page content -->
    
    <%@ include file="Layouts/Scripts.jsp" %>
</body>
</html>
