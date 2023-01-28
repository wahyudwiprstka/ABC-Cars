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
	<% String userRole; %>

	<div class="container d-flex flex-column align-items-center content">
		<h1 class="mb-3">Manage Users</h1>
		<div>
			<a href="${pageContext.request.contextPath}/admin/user" class="btn border-0 disabled">Manage User</a>
			<a href="${pageContext.request.contextPath}/admin/car" class="btn border-0 text-primary text-decoration-none">Manage Cars</a>
			<a href="${pageContext.request.contextPath}/admin/test-drive" class="btn border-0 text-primary text-decoration-none">Manage Test Drive</a>
		</div>
		<table border="1" class="table table-striped text-center">
			<tr>
				<th>ID</th>
				<th>Username</th>
				<th>Full Name</th>
				<th>Address</th>
				<th>Contact</th>
				<th>Roles</th>
				<th>Action</th>
			</tr>
			<c:forEach var="user" items="${users}">
				<tr>
					<td>${user.id}</td>
					<td>${user.username}</td>
					<td>${user.profile.firstname} ${user.profile.lastname}</td>
					<td>${user.profile.address}</td>
					<td>${user.profile.contact}</td>
					<td>
						<c:forEach var="role" items="${user.roles}">
							${role.role_name}&ensp;
						</c:forEach>
					</td>
					<td>
						<div class="dropdown">
							<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
								Action
							</button>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
								<c:if test="${user.roles.size() == 1}">
									<li><a class="dropdown-item" href="give-admin-role/${user.id}">Give Admin Role</a></li>
								</c:if>
								<c:if test="${user.roles.size() == 2}">
									<li><a class="dropdown-item" href="delete-admin-role/${user.id}">Delete Admin Role</a></li>
								</c:if>
								<li><a class="dropdown-item" href="delete-user/${user.id}">Delete</a></li>
								<li><a class="dropdown-item" href="update-user/${user.id}">Update Profile</a></li>
							</ul>
						</div>
					</td>
				</tr>
			</c:forEach>
			<c:if test="${empty users}">
				<tr>
					<td colspan="7" class="text-center">No Car Is Available</td>
				</tr>
			</c:if>
		</table>
	</div>

	<%@ include file="component/footer.jsp" %>

</body>
</html>