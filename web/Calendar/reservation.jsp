<%-- 
    Document   : reservation
    Created on : Jul 15, 2018, 5:18:55 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="<%=request.getContextPath() %>/ReservationServelet" method="post">
            <table border="1" cellspacing="1" cellpadding="1">
                <thead>
                    <tr>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Event Id : </td>
                        <td><input type="text" name="event" value="" /></td>
                    </tr>
                    <tr>
                        <td>Customer Id : </td>
                        <td><input type="text" name="customer" value="" /></td>
                    </tr>
                    <tr>
                        <td>seat no : </td>
                        <td><input type="text" name="seat" value="" /></td>
                    </tr>
                    <tr>
                        <td>date</td>
                        <td><input type="date" name="date"></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="submit" name="submit" /></td>
                    </tr>
                </tbody>
            </table>
        </form>

        <h1>Hello World!</h1>
        
    </body>
</html>
