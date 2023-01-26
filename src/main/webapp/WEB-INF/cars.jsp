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
	.border-box{
		box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
	}

	.content{
		min-height: 100vh;
		position: relative;
	}

	.car-image {
		width: 500px;
		height: 250px;
		object-fit: cover;
	}

	.car-tab {
		margin-top: 1rem;
		width: 71vw;
		margin-right: 1rem
	}

	div#search{
		margin-top: 1rem;
		width: 23vw;
		margin-left: 1.5rem;
		height: 50%
	}

	.no-car{
		margin-top: 1.5rem;
	}

	.btn-search{
		width: 21vw;
	}
	
	form.searchform input{
		width: 21vw;
		border: 1px solid #9ca3af;
		height: 40px;
		padding: 3px 5px;
	}

	.cartab-btn a button.btn{
		width: 10rem;
	}
</style>
<body>

	<%@ include file="component/nav.jsp" %>

	<div class="container-fluid content d-flex gap-3">
		<div class="shadow rounded text-center py-4 float-start" id="search">
			<a href="${pageContext.request.contextPath}/post-car" class="text-white text-decoration-none"><button class="btn btn-primary btn-search mt-3">Post Car</button></a>
			<h6 class="fw-semibold ms-4 mt-2" style="text-align: left;">Search Car</h6>
			<form action="${pageContext.request.contextPath}/cars/search" method="get" class="searchform">
				<input type="text" name="keyword" id="keyword" placeholder="Input make/model/year" class="rounded">
				<button class="btn btn-success btn-search mt-2">Search Car</button>
			</form>
			<h6 class="fw-semibold ms-4 mt-2" style="text-align: left;">Search Car By Price Range</h6>
			<form action="${pageContext.request.contextPath}/cars/search" method="get" class="searchform">
				<input type="text" name="min" id="min" placeholder="Min Price" class="rounded">
				<input type="text" name="max" id="max" placeholder="Max Price" class="rounded mt-2">
				<button class="btn btn-success btn-search mt-2 mb-3">Search Car</button>
			</form>
		</div>
		<div class="d-flex flex-column float-end" id="cars">
			<c:forEach var="car" items="${cars}">
				<div class="d-flex flex-row car-tab container border-box">
					<a href="${pageContext.request.contextPath}/car-details/${car.id}" class="d-flex text-black text-decoration-none">
					<img src="/images/carImg/${car.image}" class="car-image"/>
					<div class="justify-content-between">
						<div class="ms-3 my-2 d-flex flex-column">
							<h2>${car.make} ${car.model}</h2>
							<h4>(${car.year})</h4>
							<c:choose>
								<c:when test="${car.bidprice == '0'}">
									<p>Current Bid: $${car.price}</p>
								</c:when>
								<c:otherwise>
									<p>Current Bid: $${car.bidprice}</p>
								</c:otherwise>
							</c:choose>
							<%-- <p>Current Bid: ${bidService.findCurrentBidPrice($car.id)}</p> --%>
						</div>
						<div class="ms-3 my-3 d-flex flex-column cartab-btn">
							<a href="${pageContext.request.contextPath}/car-details/${car.id}#bid" class="d-inline-block"><button type="button" class="btn btn-warning">Bid Now</button></a>
							<a href="${pageContext.request.contextPath}/car-details/${car.id}#bid" class="d-inline-block"><button type="button" class="btn btn-primary mt-2">View Details</button></a>
						</div>
					</div>
					</a>
				</div>
			</c:forEach>
		</div>
		<c:if test = "${empty cars}">
			<h3 class="no-car ms-3 float-end me-5">No cars yet</h3>
		</c:if>
		
	</div>

	<%@ include file="component/footer.jsp" %>

</body>
</html>