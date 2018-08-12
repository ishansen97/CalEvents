<%-- 
    Document   : test
    Created on : Aug 9, 2018, 6:38:09 PM
    Author     : Lini Eisha
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="KitchenJavaF.rawMaterials"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Life and Death</title>
    </head>
    <%
        rawMaterials rm1 = new rawMaterials();
        ResultSet res = rm1.fetch_Raw_Materials();
    %>
   <table>
                <tbody>
                    <tr><%while(res.next()){%>
                        <td  style="width: 200px;"><%=res.getString("name")%></td>
                    </tr>
                </tbody><%}%>
            </table>
</html>
got an idea? yesssss thank you team viewer <3 i love you<3<%-- hahahah--%> meh meh mehh