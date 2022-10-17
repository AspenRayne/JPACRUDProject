<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
<a class="btn btn-outline-warning" href="home.do" role="button">Go
		Back</a>
<jsp:include page="navbar.jsp" />
	<c:choose>
		<c:when test="${removeRestaurant}">
      Restaurant has been successfully been removed!
    </c:when>
		<c:otherwise>
			<p>Sorry, Could not remove that !</p>
		</c:otherwise>
	</c:choose>
</body>
</html>