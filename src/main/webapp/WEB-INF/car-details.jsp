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
<style>
		dt, dd{
			padding-top: 8px;
			border-top: 1px solid #adadad;
			border-collapse: collapse;
		}
		dt{
			padding-left: 10px;
			float: left;
			width: 10vw;
		}
		input.form-control:disabled{
			background-color: white;
		}
		.bid-info{
			background-color: #05445E;
			height: 60px;
			border-radius: 10px;
			color: white;
		}
		h3.green{
			color: #75E6DA;
		}
		form.bidform{
			padding: 20px;
			width: 50vw;
			margin: auto;
			margin-bottom: 30px;
		}
		#carImage{
			width: 50vw;
			object-fit: cover;
			margin: auto;
		}
</style>
<body>

	<%@ include file="component/nav.jsp" %>

	<div class="container content">

		<div class="container d-flex justify-content-center flex-column">
			<h1 class="fw-bold">${car.make} ${car.model} ${car.year}</h1>
			<img src="/images/carImg/${car.image}" id="carImage">
		</div>
	
		<div class="bid-info container align-items-center d-flex justify-content-around my-5 p-0">
			<div class="d-flex">
				<h3 class="green me-2">Starting Price: </h3><h3>$${car.price}</h3>
			</div>
			<div class="d-flex">
				<h3 class="green me-2">Current Bid: </h3><h3>$${car.bidprice}</h3>
			</div>
			<div class="d-flex">
				<h3 class="green me-2">Current Bidder: </h3><h3>${car.bidder.username}</h3>
			</div>
			<button type="button" class="btn btn-primary" onClick="document.getElementById('bid').scrollIntoView();">Place Bid</button>
		</div>
	
		<div class="container">
			<dl>
				<dt>Make</dt>
				<dd>${car.make}</dd>
				<dt>Model</dt>
				<dd>${car.model}</dd>
				<dt>Year</dt>
				<dd>${car.year}</dd>
				<dt>Seller</dt>
				<dd>${car.user.username}</dd>
				<dt></dt>
				<dd></dd>
			</dl>
		</div>
	
		<div class="container shadow mt-5 p-4" id="bid">
			<p class="text-success">${bidSuccess}</p>
			<p class="text-danger">${bidError}</p>
			<form action="${pageContext.request.contextPath}/car-details/${car.id}/bid">
				<h1>Place Bid</h1>
				<div class="mb-3">
					<label for="currentbid" class="form-label">Current Bid</label>
					<c:choose>
						<c:when test = "${car.bidprice == '0'}">
							<input type="text" class="form-control" id="currentbid" value="${car.price}" disabled>
						</c:when>
						<c:otherwise>
							<input type="text" class="form-control" id="currentbid" value="${car.bidprice}" disabled>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="mb-3">
					<label for="userbid" class="form-label">Your Bid</label>
					<input type="text" class="form-control" id="userbid" name="bid" aria-describedby="userbiddesc">
					<div id="userbiddesc" class="form-text">The amount of bid should be greater than the current bid</div>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>

	</div>

	<%@ include file="component/footer.jsp" %>

</body>
</html>