<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ include file="init.jsp"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Update Profile Page</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="/css/style.css">
	<style>
		.image img{
			width: 35vw;
		}
		.registration-form input{
			width: 38vw;
		}
		.registration-form input.name{
			width: 18vw;
		}
		.btn-regis{
			margin-top: 10px;
		}
		.regis{
			margin-top: 50px;
			border-radius: 3px;
			padding: 20px;
			padding-bottom: 25px;
			box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
		}
	</style>
</head>
<body>

	<%@ include file="component/nav.jsp" %>

	<div class="content mb-2 regis container d-flex align-items-center justify-content-center">
		<div class="image">
			<img alt="Register Image" src="https://img.freepik.com/free-vector/business-people-writing-agreement-shaking-hands-tiny-man-with-magnifying-glass-researching-checklist-document-clipboard-paper-flat-vector-illustration-survey-paperwork-management-concept_74855-21676.jpg?w=740&t=st=1671024580~exp=1671025180~hmac=ba8f958dd16699b1e3ac8c4a3be4e87cdaccd08ebf03d01cd93226be45016193">
		</div>
		<div>
			<form:form modelAttribute="update-profile" class="d-flex flex-column justify-content-center registration-form" action="update-profile-process">
				<h1>Update Profile</h1>
				<div class="form-group">
					<label for="firstname">First Name</label>
					<input type="text" class="form-control" id="firstname" name="firstname" value="${profile.firstname}">
				</div>
				<div class="form-group">
					<label for="lastname">Last Name</label>
					<input type="text" class="form-control" id="lastname" name="lastname" value="${profile.lastname}">
				</div>
				<div class="form-group">
					<label for="address">Address</label>
					<input type="text" class="form-control" id="address" name="address" value="${profile.address}">
				</div>
				<div class="form-group">
					<label for="contact">Contact</label>
					<input type="text" class="form-control" id="contact" name="contact" value="${profile.contact}">
				</div>
				<button type="submit" class="btn btn-primary btn-regis">Submit</button>
			</form:form>
		</div>
	</div>

	<%@ include file="component/footer.jsp" %>

</body>
</html>