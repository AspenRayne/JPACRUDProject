<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Remove Page</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	<a class="btn btn-outline-warning" href="home.do" role="button">Go
		Back</a>
	<jsp:include page="navbar.jsp" />

	<form action="removeRestaurant.do" method="GET">
		<h1>Remove Restaurant</h1>
		
		<label for="id">Are you sure you want to delete this
			Restaurant? </label>
		

			 <input name="id" value="${removeRestaurant.id}" /> <input
			type="submit" value="Confirm" />
	</form>

	<a class="btn btn-outline-warning" href="home.do" role="button">Go
		Back</a>

</body>
</html>