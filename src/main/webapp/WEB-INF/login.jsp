<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Registration Page</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
	<style>
		img, .image{
			width: 35vw;
		}
		input[type="text"]{
			width: 25vw;
		}
		button{
			margin-top: 20px;
		}
		.regis{
			width: 70vw;
			margin-top: 50px;
			border-radius: 3px;
			padding: 20px;
			padding-bottom: 25px;
			box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
			background-color: white;
		}
	</style>
</head>
<body>

	<div class="regis container d-flex align-items-center justify-content-center">
		<div class="image">
			<img alt="Register Image" src="https://img.freepik.com/free-vector/business-people-writing-agreement-shaking-hands-tiny-man-with-magnifying-glass-researching-checklist-document-clipboard-paper-flat-vector-illustration-survey-paperwork-management-concept_74855-21676.jpg?w=740&t=st=1671024580~exp=1671025180~hmac=ba8f958dd16699b1e3ac8c4a3be4e87cdaccd08ebf03d01cd93226be45016193">
		</div>
		<div>
			<form class="d-flex flex-column justify-content-center">
				<h1>Login</h1>
				<div class="form-group">
					<label for="username">Username</label>
					<input type="text" class="form-control" id="username" name="username">
				</div>
				<div class="form-group">
					<label for="password">Password</label>
					<input type="text" class="form-control" id="password" name="password">
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
				<a href="${pageContext.request.contextPath}/registration" class="text-decoration-none mt-3">Register</a>
			</form>
		</div>
	</div>

</body>
</html>