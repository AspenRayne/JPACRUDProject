<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Restaurant</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<a class="btn btn-outline-warning" href="home.do" role="button">Go
		Back</a>
	<c:if test="${selectedRestaurant == null}">
		<c:if test="${alreadyCreated != null}">
			<p style="font-weight: bold;">${alreadyCreated}</p>
		</c:if>

		<form action="searchRestaurant.do" method="POST">
			<div class="input-group input-group-lg">
				<span class="input-group-text">Google Place Search</span> <input
					name="name" type="text" class="form-control"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-lg">
			</div>
			<br> <input class="submit" type="submit" value="Search" />
		</form>
		<br>

		<c:if test="${searchResults != null}">
			<form action="placeSelection.do" method="POST">

				<select class="form-select form-select-lg mb-3"
					aria-label=".form-select-lg example" name="selectedResult">
					<c:forEach var="result" items="${searchResults}">
						<option value="${result.formattedAddress}">${result.name}
							${result.formattedAddress}</option>
					</c:forEach>
				</select><input class="submit" type="submit" />
			</form>
		</c:if>
	</c:if>

	<c:if test="${selectedRestaurant != null}">
		<form action="createRestaurant.do" method="POST">
			<h3>Selected Restaurant</h3>
			<table class="table table-dark">
				<thead>
					<tr>
						<th scope="col">Name</th>
						<th scope="col">Address</th>


					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${selectedRestaurant.name}</td>
						<td>${selectedRestaurant.formattedAddress}</td>

					</tr>
				</tbody>
			</table>

			<input name="address" value="${selectedRestaurant.formattedAddress}"
				type="hidden" /> <input name="name"
				value="${selectedRestaurant.name}" type="hidden" />
			<h3>Have you Visited?</h3>

			<input class="form-check-input" type="radio" name="visited" value="1" />
			Yes <input class="form-check-input" TYPE="radio" name="visited"
				value="0" /> No <br>
			<h3>Review</h3>


			<div class="mb-3">

				<textarea name="review" class="form-control"
					id="exampleFormControlTextarea1" rows="3"></textarea>
			</div>
			<h3>Rating</h3>
			<select name="rating" class="form-select form-select-lg mb-3"
				aria-label=".form-select-lg example">
				
				<option value="0">0 Stars</option>
				<option value="1">1 Stars</option>
				<option value="2">2 Stars</option>
				<option value="3">3 Stars</option>
				<option value="4">4 Stars</option>
				<option value="5">5 Stars</option>
			</select> <br> <input TYPE="submit" />
		</form>
	</c:if>
</body>
</html>