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
		<table border="1" class="table table-striped text-center">
			<tr>
				<th>Car Name</th>
				<th>Car Year</th>
				<th>Car Image</th>
                <th>Car Seller</th>
				<th>Bid Amount</th>
			</tr>
			<c:forEach var="bid" items="${myBid}">
				<tr>
					<td>${bid.make} ${bid.model}</td>
                    <td>${bid.year}</td>
                    <td><img src="/images/carImg/${bid.image}" style="height: 50px;"></td>
                    <td>${bid.user.username}</td>
                    <td>${bid.bidprice}</td>
				</tr>
			</c:forEach>
			<c:if test="${empty myBid}">
				<tr>
					<td colspan="7" class="text-center">No Bid Is Available</td>
				</tr>
			</c:if>
		</table>
	</div>

	<%@ include file="component/footer.jsp" %>

</body>
</html>