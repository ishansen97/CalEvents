<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload photos gallery from here!</title>
</head>
<body>
    <center>
        <h1>Upload photos from here</h1>
        <form method="post" action="uploadServlet" enctype="multipart/form-data">
            <table border="0">
                <tr>
                    <td>photo id: </td>
                    <td><input type="text" name="photo_id" size="5"/></td>
                </tr>
                <tr>
                    <td>album id: </td>
                    <td><input type="text" name="album_id" size="5"/></td>
                </tr>
                <tr>
                    <td>photo name: </td>
                    <td><input type="text" name="photo_name" size="250"/></td>
                </tr>
                <tr>
                    <td>Photo: </td>
                    <td><input type="file" name="photo_type" size="50"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                         <input type="submit" value="Save">
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>
