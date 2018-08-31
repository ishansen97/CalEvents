<!DOCTYPE html>
<html>
<title>Event</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
    function date_validate() {
        var date = document.getElementById("B_date").value;
        var time1 = document.getElementById("B_s_time").value;
        var time2 = document.getElementById("B_e_time").value;
        
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
        var date = document.getElementById("B_date").value;
        var time1 = document.getElementById("B_s_time").value;
        var time2 = document.getElementById("B_e_time").value;
        
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
    
<style>
    .formField
    {
        width:200%;
        height:auto;
    }
    
    .formField input[type=text],.formField input[type=time],.formField input[type=date]
    {
        alignment-adjust: 5px;
        width:100%;
        margin:2px;
        border-radius:10px;
        outline:none;
        font-size:18px;
        font-family: Calibri;
        border:1px solid black;
        padding:5px;
        background: transparent;
    }
    .formField input[type=submit]
    {
        width:50%;
        font-size:18px;
        padding:5px;
        border:2px solid dimgrey;
        background: whitesmoke;
        outline:none;
        border-radius:5px;
        font-family: Calibri;
        margin:5px;
        color:dimgray;
        transition-duration: 0.5s;
    }
    
    .formField input[type=submit]:hover
    {
        background: dimgray;
        color:white;
        border-radius:10px;
    }
</style>
<%@ include file="Layouts/Styles.jsp" %>

<body class="w3-light-grey">
 
<%@ include file="Layouts/Navigation.jsp" %>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">


    <p style="color:black;font-size: 50px;text-align: center">Insert Booked Events</p>    
    <form action="<%=request.getContextPath()%>/MyServletBook" method="post" class="formField" onsubmit="return validation()">
                  <table style="wdth:100%;margin-left: 10px">
                        <tr>
                            <td>
                              <label>Event name:</label>
                            </td>
                            <td>
                              <input type="text" name="B_eventName">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Category:</label>
                            </td>
                            <td>
                                <input type="text" name="B_category">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Event Description:</label>
                            </td>
                            <td>
                                <input type="text" name="B_description">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Date:</label>
                            </td>
                            <td>
                                <input type="date" name="B_start" id="B_date">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Start time:</label>
                            </td>
                            <td>
                                <input type="time" name="B_start_time" id="B_s_time"><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label> End time:</label>
                            </td>
                            <td>
                                <input type="time" name="B_end_time" id="B_e_time"><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label> Location:</label>
                            </td>
                            <td>
                                 <input type="text" name="B_location"><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Seats Allocation:</label>
                            </td>
                            <td>
                                <input type="number" name="seats" min="1" max="50"><br>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                               <input type="submit" name="submit" value="submit"> 
                            </td>
                        </tr>
                  </table>
                </form>
                
                
    <%@ include file="Layouts/Footer.jsp" %>
<!-- End page content -->
</div>

<%@ include file="Layouts/Scripts.jsp" %>
</body>
</html>