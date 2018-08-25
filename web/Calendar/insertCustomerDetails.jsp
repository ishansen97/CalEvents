<%-- 
    Document   : insertCustomerDetails
    Created on : Aug 23, 2018, 5:27:10 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./Layouts/Styles.jsp" %>
        <%@include file="./Layouts/Scripts.jsp" %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <p>This email already exists in our system. Please provide another email</p>
                    <table class="table table-striped">
                        <tr>
                            <td>Email : </td>
                            <td><input type="text" name="newEmail"></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
