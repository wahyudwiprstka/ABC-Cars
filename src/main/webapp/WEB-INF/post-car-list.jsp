<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ include file="init.jsp"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Registration Page</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="/css/style.css">
</head>
<body>

	<%@ include file="component/nav.jsp" %>

	<div class="container content">
		<h1 class="my-3 text-center">Your Car Post</h1>
		<table border="1" class="table table-striped text-center">
			<tr>
				<th>Make</th>
				<th>Model</th>
				<th>Price</th>
				<th>Year</th>
				<th>Current Bidder</th>
				<th>Bid Price</th>
				<th>Image</th>
				<th>Status</th>
				<th>Action</th>
			</tr>
			<c:forEach var="car" items="${cars}">
				<tr>
					<td>${car.make}</td>
					<td>${car.model}</td>
					<td>${car.price}</td>
					<td>${car.year}</td>
					<td>${car.bidder.username}</td>
					<td>${car.bidprice}</td>
					<td><img src="/images/carImg/${car.image}" width="100px"></td>
					<td>
						<c:choose>
							<c:when test="${car.status==1}">
								Active
							</c:when> 
							<c:when test="${car.status==2}">
								Sold
							</c:when>      
							<c:otherwise>
								Inactive
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<div class="dropdown">
							<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
								Action
							</button>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
								<c:choose>
									<c:when test="${car.status==1}">
										<li><a class="dropdown-item" href="manage-car-status?id=${car.id}&value=0">Deactivate</a></li>
									</c:when>    
									<c:otherwise>
										<li><a class="dropdown-item" href="manage-car-status?id=${car.id}&value=1">Activate</a></li>
									</c:otherwise>
								</c:choose>
								<c:if test="${!empty car.bidder && !empty car.bidprice}">
									<li><a class="dropdown-item" href="manage-car-status?id=${car.id}&value=2">Accept Car Bid</a></li>
								</c:if>
								<li><a class="dropdown-item" href="delete-car?id=${car.id}">Delete</a></li>
							</ul>
						</div>
					</td>
				</tr>
			</c:forEach>
			<c:if test="${empty cars}">
				<tr>
					<td colspan="9" class="text-center">No Car Is Available</td>
				</tr>
			</c:if>
		</table>
	</div>

	<%@ include file="component/footer.jsp" %>

</body>
</html>