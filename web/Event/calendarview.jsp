<%-- 
    Document   : calendarview
    Created on : Aug 12, 2018, 3:05:05 PM
    Author     : hp
--%>
<html>
<title>Event</title>
<meta charset="UTF-8">
<meta    name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="Layouts/Styles.jsp" %>

<body class="w3-light-grey">
 
<%@ include file="Layouts/Navigation.jsp" %>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

    <div class="row">
          <div class="col-12">

<%@page import="com.dhtmlx.planner.extensions.DHXExtension" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

        <h1>Calendar</h1>
        <div class="content-container">
            <div id="planner" class="planner"><%=getPlanner(request) %></div>
            <%@page import="com.dhtmlx.planner.*,com.dhtmlx.planner.data.*,java.util.Date" %>
            <%! String getPlanner(HttpServletRequest request) throws Exception {
                DHXPlanner p1 = new DHXPlanner("./codebase/", DHXSkin.TERRACE);
                p1.setWidth(1000);
                p1.setInitialDate(new Date());
                p1.calendars.attachMiniCalendar();
                        p1.load("events.jsp", DHXDataFormat.JSON);
                        p1.data.dataprocessor.setURL("events.jsp");
                
                return p1.render();
            }
            %>
        </div>
              </div>
        </div>

    <%@ include file="Layouts/Footer.jsp" %>
<!-- End page content -->
</div>

<%@ include file="Layouts/Scripts.jsp" %>
</body>
</html>
