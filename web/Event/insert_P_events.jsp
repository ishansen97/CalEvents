<!DOCTYPE html>
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

                    <form action="<%=request.getContextPath()%>/MyServletPrivate" method="post">
                        Event name:<input type="text" name="eventName"><br>
                        Customer name:<input type="text" name="CustomerName"><br>
                        phone number:<input type="text" name="phoneNo"><br>
                        email:<input type="text" name="email"><br>
                        Date:<input type="date" name="date" required><br>
                        Start time:<input type="time" name="start_time"><br>
                        End time:<input type="time" name="end_time"><br>
                        Location:<input type="text" name="location"><br>                
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