<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body>
	<jsp:include page="../navbar.jsp" />
	<a class="btn btn-outline-warning" href="home.do" role="button">Go
		Back</a>

	<table class="table table-dark">
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Name</th>
				<th scope="col">Address</th>
				<th scope="col">Visited</th>
				<th scope="col">Review</th>
				<th scope="col">Rating</th>
				<th scope="col">Edit</th>
				<th scope="col">Remove</th>
			</tr>
		</thead>

		<tbody>
			<tr>
				<td scope="row">${restaurant.id}</td>
				<td>${restaurant.name}</td>
				<td>${restaurant.address}</td>
				<td>${restaurant.visited }</td>
				<td>${restaurant.review }</td>
				<td>${restaurant.rating }</td>
				<td><form action="updateDetails.do" action="POST">
						<input type="hidden" name="id" value="${restaurant.id}" /> <input
							type="submit" value="Edit" class="btn btn-success" />
					</form></td>

				<td><form action="removeDetails.do" action="POST">
						<input type="hidden" name="id" value="${restaurant.id}" /> <input
							type="submit" value="Remove" class="btn btn-danger" />
					</form></td>
			</tr>
		</tbody>

	</table>




	<jsp:include page="../bootstrapFoot.jsp" />
</body>
</html>