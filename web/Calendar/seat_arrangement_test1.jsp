<%@page import="java.sql.*, reservation.*" %>

<!DOCTYPE HTML>
<html>
<head>  
    <% ResultSet result = ReservationManagement.getEventReservationSummary("2018-09-08");
       String reservationData = "";
       
       while (result.next()) {
           //result.previous();
           reservationData += " { y: " +result.getInt("COUNT(*)")+ ", label: \"" +result.getString("event_id")+ "\"},";
       }
       reservationData += "";
       
       StringBuilder builder = new StringBuilder(reservationData);
       int index = reservationData.lastIndexOf(",");
       builder.deleteCharAt(index);
       
       
    %>
<script>
window.onload = function () {

var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme: "light2", // "light1", "light2", "dark1", "dark2"
	title:{
		text: "Top Oil Reserves"
	},
	axisY: {
		title: "Reserves(MMbbl)"
	},
	data: [{        
		type: "column",  
		showInLegend: true, 
		legendMarkerColor: "grey",
		legendText: "MMbbl = one million barrels",
//		dataPoints: [      
//                        { y: 30, label: "Sri Lanka" },
//			{ y: 26,  label: "Saudi" },
//			{ y: 16,  label: "Canada" },
//			{ y: 15,  label: "Iran" },
//			{ y: 14,  label: "Iraq" },
//			{ y: 10,  label: "Kuwait" },
//			{ y: 97,  label: "UAE" },
//			{ y: 80,  label: "Russia" }
//		]
                //dataPoints: [{y:3,label:"E001"},{y:2,label:"E002"},{y:1,label:"E004"}]
                dataPoints: [<%=builder %>]
	}]
});
chart.render();

};
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 50%;"></div>
<!--<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>-->
w4
</body>
</html>
