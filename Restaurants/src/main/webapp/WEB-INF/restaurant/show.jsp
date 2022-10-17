<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Restaurants</title>
<jsp:include page="../bootstrapHead.jsp" />
</head>
<body>
	<jsp:include page="../navbar.jsp" />
	
	<a class="btn btn-outline-warning" href="home.do" role="button">Go Back</a>
	<table class="table table-warning">
		<thead>
			<tr style="text-align: center; vertical-align: middle;">
				<th scope="col">Name</th>
				<th scope="col">Address</th>
				<th scope="col">Visited</th>
				<th scope="col">Reset Sort</th>
			</tr>
		</thead>
		<tbody>
			<tr >
				<td style="text-align: center; vertical-align: middle;"><form action="sortByName.do">
						<div class="input-group input-group-lg">
							<span class="input-group-text">Name </span> <input name="name"
								value="${updateRestaurant.name}" placeholder="Insert Name" type="text"
								class="form-control" aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-lg"> <input
								name="submit" type="submit" value="Sort" class="btn btn-light"/>
						</div>

					</form></td>

				<td style="text-align: center; vertical-align: middle;">
					<form action="sortByAddress.do">
						<div class="input-group input-group-lg">
							<span class="input-group-text">Address </span> <input
								name="address" value="${updateRestaurant.address}" placeholder="Insert Address" type="text"
								class="form-control" aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-lg"> <input
								name="submit" type="submit" value="Sort" class="btn btn-light" />
						</div>
					</form>

				</td>

				<td style="text-align: center; vertical-align: middle;">
					<form action="sortByVisited.do">
						<input class="form-check-input" type="radio" name="visited"
							value="1" /> Yes <input class="form-check-input" TYPE="radio"
							name="visited" value="0" /> No <br>
						<input name="submit" type="submit" value="sort" class="btn btn-light" />

					</form>
				</td>
				
				<td style="text-align: center; vertical-align: middle;">
				<form action="showAll.do">
				<input class="btn btn-light" name="submit" type="submit" value="Reset" />
				</form>
				</td>
			</tr>
		</tbody>
	</table>

	<table class="table table-dark table-striped">
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
		<c:forEach items="${restaurants}" var="rest">
			<tbody>
				<tr>
					<td scope="row">${rest.id}</td>
					<td>${rest.name}</td>
					<td>${rest.address}</td>
					<td>${rest.visited }</td>
					<td>${rest.review }</td>
					<td>${rest.rating }/5</td>

					<td><form action="updateDetails.do" action="POST">
							<input type="hidden" name="id" value="${rest.id}" /> <input
								type="submit" value="Edit" class="btn btn-success" />
						</form></td>


					<td><form action="removeDetails.do" action="POST">
							<input type="hidden" name="id" value="${rest.id}" /> <input
								type="submit" value="Remove" class="btn btn-danger" />
						</form></td>
				</tr>
			</tbody>
		</c:forEach>
	</table>




	<jsp:include page="../bootstrapFoot.jsp" />
</body>
</html>