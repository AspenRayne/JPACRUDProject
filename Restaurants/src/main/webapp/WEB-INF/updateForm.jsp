<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<form action="updateRestaurant.do" method="POST">

		<input name="id" value="${updateRestaurant.id}" type="hidden" /> 
		
		<div class="input-group input-group-lg">
				<span class="input-group-text">Name </span> <input
					name="name" value="${updateRestaurant.name}" type="text" class="form-control"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-lg">
		</div>
		 <br>

			
			<div class="input-group input-group-lg">
				<span class="input-group-text">Address </span> <input
					name="address" value="${updateRestaurant.address}" type="text" class="form-control"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-lg">
		</div>
			
			
			<br>
			<h3>Review</h3>
			<div class="mb-3">

				<textarea name="review" placeholder="${updateRestaurant.review}" class="form-control"
					id="exampleFormControlTextarea1" rows="3"></textarea>
			</div>
			
			<br> 
			
			<h3>Rating</h3>
			<select name="rating" class="form-select form-select-lg mb-3"
				aria-label=".form-select-lg example">
			
			<option value="${updateRestaurant.rating}"
				selected="${updateRestaurant.rating}">${updateRestaurant.rating}</option>
			<option value="0">0 stars</option>
			<option value="1">1 stars</option>
			<option value="2">2 stars</option>
			<option value="3">3 stars</option>
			<option value="4">4 stars</option>
			<option value="5">5 stars</option>
		</select> <br> 
		<h3>Visited?</h3>
		<input class="form-check-input" type="radio" name="visited"
			value="1" /> Yes <input class="form-check-input" TYPE="radio"
			name="visited" value="0" /> No <br><input name = "submit" type="submit"
			value="Update" />
	</form>





</body>
</html>