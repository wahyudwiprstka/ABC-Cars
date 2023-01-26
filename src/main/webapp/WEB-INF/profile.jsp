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
    <link rel="stylesheet" href="/css/profile.css">
</head>
<style> 
</style>
<body>

	<%@ include file="component/nav.jsp" %>

    <div class="content d-flex m-auto mb-2 align-items-center justify-content-center gap-5 shadow">
        <div>
            <div class="text-center">
                <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" class="rounded"><br>
                <a href="${pageContext.request.contextPath}/update-profile"><button class="mt-3 btn btn-primary">Change Profile</button></a>
            </div>
        </div>
        <div class="">
            <div class="text-start">
                <p class="text-muted mb-0">Full Name</p>
                <h3 class="">${user.profile.firstname} ${user.profile.lastname}</h3>
            </div>
            <div class="text-start">
                <p class="text-muted mt-3 mb-0">Username</p>
                <h3 class="">${user.username}</h3>
            </div>
            <div class="text-start">
                <p class="text-muted mt-3 mb-0">Address</p>
                <h3 class="">${user.profile.address}</h3>
            </div>
            <div class="text-start">
                <p class="text-muted mt-3 mb-0">Contact</p>
                <h3 class="">${user.profile.contact}</h3>
            </div>
        </div>
    </div>

	<%@ include file="component/footer.jsp" %>

</body>
</html>