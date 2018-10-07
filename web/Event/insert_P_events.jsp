<!DOCTYPE html>
<html>
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

    <body class="w3-light-grey">

        <%@ include file="Layouts/Navigation.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">

            <div class="row">
                <div class="col-12">

                    <form action="<%=request.getContextPath()%>/MyServletPrivate" method="post" onsubmit="return validation()">
                        Event name:<input type="text" name="eventName"><br>
                        Customer name:<input type="text" name="CustomerName"><br>
                        phone number:<input type="text" name="phoneNo"><br>
                        email:<input type="text" name="email"><br>
                        Date:<input type="date" name="date" id="st_date" required><br>
                        Start time:<input type="time" name="start_time" id="st_STime"><br>
                        End time:<input type="time" name="end_time" id="ed_Time"><br>
                        Location:<select name="location">
                            <option>H001</option>
                            <option>H002</option>
                            <option>H003</option>
                        </select><br>
                        Crowd expected:<input type="number" name="crowdE" min="0" max="500" ><br>
                        <input type="submit" name="submit" value="submit">
                    </form>

                </div>
            </div>

            <%@ include file="Layouts/Footer.jsp" %>
            <!-- End page content -->
        </div>

        <%@ include file="Layouts/Scripts.jsp" %>
    </body>
</html>