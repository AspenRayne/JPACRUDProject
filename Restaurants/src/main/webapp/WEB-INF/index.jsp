<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurants</title>
</head>
<body>

	<h1>Home Page</h1>
	
	<c:forEach items="${restaurants}" var="rest">
		<li>${rest.name}</li>
	</c:forEach>
	
</body>
</html>