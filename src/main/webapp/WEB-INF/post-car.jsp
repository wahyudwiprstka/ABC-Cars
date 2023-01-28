<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ include file="init.jsp"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Registration Page</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="/css/style.css">
	<style>
		body{
			background-image: url("images/bg.svg");
			background-repeat: no-repeat;
			background-size: cover;
		}
		.image img{
			width: 35vw;
		}
		input.form-control{
			width: 30vw;
		}
		.postcar-form input.name{
			width: 14vw;
		}
		.btn-regis{
			margin-top: 10px;
		}
		.regis{
			background-color: white;
			margin-top: 10px;
			border-radius: 3px;
			padding: 20px;
			padding-bottom: 25px;
			box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
			width: 40vw;
			height: 88vh;
		}
		.form-group{
			margin-top: 7px;
		}
	</style>
</head>
<body>

	<%@ include file="component/nav.jsp" %>

	<div class="regis container d-flex align-items-center justify-content-center content">
		<div>
			<form:form name="pcForm" onsubmit="return validatePostCarForm()" modelAttribute="postCar" class="d-flex flex-column justify-content-center postcar-form" action="postCarProcess" enctype="multipart/form-data" method="post">
				<h3 class="text-center">Post Car</h3>
				<div class="form-group">
					<label for="make">Make</label>
					<input type="text" class="form-control" id="make" name="make">
				</div>
				<div class="form-group">
					<label for="model">Model</label>
					<input type="text" class="form-control" id="model" name="model">
				</div>
				<div class="form-group">
					<label for="year">Year</label>
					<input type="text" class="form-control" id="year" name="year">
				</div>
				<div class="form-group">
					<label for="price">Price</label>
					<input type="text" class="form-control" id="price" name="price">
				</div>
				<div class="form-group">
					<label for="upload-imamge">Image</label>
					<input type="file" class="form-control" id="upload-image" name="image" accept="image/png, image/jpeg">
				</div>
				<button type="submit" class="btn btn-primary btn-regis">Submit</button>
			</form:form>
		</div>
	</div>

	<%@ include file="component/footer.jsp" %>

	<script src="js/postcarValidation.js"></script>

</body>
</html>