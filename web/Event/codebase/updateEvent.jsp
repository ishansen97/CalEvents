<%-- 
    Document   : updateEvent
    Created on : Aug 28, 2018, 1:24:37 PM
    Author     : hp
--%>
<%@page import="java.sql.*, Event.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<title>Event</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
    function date_validate() {
        var date = document.getElementById("st_date").value;
        var time1 = document.getElementById("st_STime").value;
        var time2 = document.getElementById("ed_Time").value;
        
        var ev_date = new Date(date);
        var cur_date = new Date();
        var start_time = new Date(time1);
        var end_time = new Date(time2);
        
        if (ev_date.getTime() < cur_date.getTime()) {
            alert("enter a day after current date");
            return false;
        }
        else
            return true;
        
      //  if(start_time.getHours() > end_time.getHours()) {
          //  alert("srart time should be less than end time");
        //    return false;
      //  }
    //    else
    //        return true;
    }
    function time_validate(){
        var date = document.getElementById("st_date").value;
        var time1 = document.getElementById("st_STime").value;
        var time2 = document.getElementById("ed_Time").value;
        
        var strtime1 = time1.toString();
        var strtime2 = time2.toString();
        
        var start_arr = strtime1.split(":");
        
        var ev_date = new Date(date);
        var cur_date = new Date();
        var start_time = new Date(time1);
        var end_time = new Date(time2);
        
         if(time1 > time2) {
            alert("start time should be less than end time");
            return false;
        }
        else {
            //alert("start_time " + time1);
            return true;
        }
    }
    
    
    function validation() {
        var time_validation = time_validate();
        var date_validation = date_validate();
        
        if(time_validation == true)
        {
            if(date_validation == true)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else
        {
            return false;
        }
        
        //alert(time_validation);
        alert(date_validation);
        
       // return false;
        
        //return time_validation && date_validation;
    }
</script>

<%@ include file="Layouts/Styles.jsp" %>

<style>
    .eventForm input[type=text], .eventForm input[type=date], .eventForm input[type=time]
    {
        width:100%;
        border:1px solid black;
        font-size:18px;
        padding:5px;
        font-family: Calibri;
        outline:none;
        border-radius:10px;
    }
    .eventForm input[type=text]:focus, .eventForm input[type=date]:focus, .eventForm input[type=time]:focus
    {
        border:1px solid #007bff;
    }
    .eventForm input[type=submit]
    {
        width:50%;
        border:1px solid whitesmoke;
        color:whitesmoke;
        font-size:18px;
        background-color: #007bff;
        font-family: Calibri;
        border-radius:10px;
        padding:5px;
        transition-duration: 0.5s;
    }
    .eventForm input[type=submit]:hover
    {
        background-color: whitesmoke;
        color:#007bff;
        border:1px solid #007bff;
    }
</style>
    </head>
<body class="w3-light-grey">
 
<%@ include file="Layouts/Navigation.jsp" %>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

    <div class="row">
          <div class="col-12">
              
              <p style="color:black;font-size:50px;text-align:center">Update Public Event</p>
              
        <% String event_id = request.getParameter("event_id"); 
           ResultSet result = Event.displayThisEvent(event_id);
        %>
        
        <form action="<%=request.getContextPath() %>/UpdateEventServelet" method="post" class="eventForm" onsubmit="return validation()">
            <% while (result.next()) { %>
            <table class="table table-striped">
                <tr>
                    <td>Event Name :</td>
                    <td><input type="text" name="event_name" value="<%=result.getString("event_name") %>"></td>
                </tr>
                <tr>
                    <td>location :</td>
                    <td><input type="text" name="location" value="<%=result.getString("location_ID") %>"></td>
                </tr>
                <tr>
                    <td>Description :</td>
                    <td><input type="text" name="description" value="<%=result.getString("description") %>"></td>
                </tr>
                <tr>
                    <td>start time :</td>
                    <td><input type="text" name="start_time" value="<%=result.getString("start_time") %>" readonly></td>
                    <td><input type="time" name="new_start_time" id="st_STime" ></td>
                </tr>
                <tr>
                    <td>End time :</td>
                    <td><input type="text" name="end_time" value="<%=result.getString("end_time") %>" readonly></td>
                    <td><input type="time" name="new_end_time" id="ed_Time"></td>
                </tr>
                <tr>
                    <td>Date :</td>
                    <td><input type="text" name="date" value="<%=result.getString("date") %>"></td>
                    <td><input type="date" name="newDate" id="st_date"></td>
                </tr>
                <tr>
                    <td><input type="hidden" name="event_ID" value="<%=result.getString("event_ID") %>"></td>
                    <td><input type="submit" name="submit" value="Update"></td>
                </tr>
            <% } %>
            </table>
        </form>
        
        </div>
    </div>            
     <!-- End page content -->
</div>
<%@ include file="Layouts/Footer.jsp" %>
<%@ include file="Layouts/Scripts.jsp" %>
</body>
</html>         