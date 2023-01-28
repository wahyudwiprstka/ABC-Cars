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
		<h1 class="my-3 text-center">Your Test Drive Request</h1>
		<table border="1" class="table table-striped text-center">
			<tr>
				<th>Make</th>
				<th>Model</th>
				<th>Seller</th>
				<th>Test Drive Date</th>
				<th>Status</th>
			</tr>
			<c:forEach var="tdrive" items="${testDrives}">
				<tr>
					<td>${tdrive.car.make}</td>
					<td>${tdrive.car.model}</td>
					<td>${tdrive.car.user.username}</td>
					<td>${tdrive.date}</td>
					<td>
						<c:choose>
							<c:when test="${tdrive.status==0}">
								Waiting Approval
							</c:when> 
							<c:when test="${tdrive.status==1}">
								Approved
							</c:when>      
							<c:otherwise>
								Rejected
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
			<c:if test="${empty testDrives}">
				<tr>
					<td colspan="9" class="text-center">No Test Drive Available</td>
				</tr>
			</c:if>
		</table>
	</div>

	<%@ include file="component/footer.jsp" %>

</body>
</html>