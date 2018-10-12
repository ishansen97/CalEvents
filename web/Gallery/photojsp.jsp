<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<body>
<div align="center">
    <h2><c:out value="${photo.photo_type}" /></h2>
    <h3><c:out value="${photo.photo_name}" /></h3>
    <img src="data:image/jpg;base64,${photo.base64Image}" width="240" height="300"/>
</div>
</body>
</html>
