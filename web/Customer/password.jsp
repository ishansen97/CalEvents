<%-- 
    Document   : password
    Created on : Sep 1, 2018, 10:29:44 AM
    Author     : Shashi Perera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="updatePassword">
        <h1>Enter Password</h1>
        <table>
        <tr>
                                        <td>Enter password : </td>
                                        <td> <input type="password" name="pass" required/></td>
                                    </tr>
                                    <tr><td><br><input type="submit" class="button btn-primary" value="Enter Password" />&nbsp;&nbsp;
                                        </td></tr>
        </table>
        </form>
    </body>
</html>
