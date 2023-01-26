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
    <link rel="stylesheet" href="/css/aboutus.css">
</head>
<style>
</style>
<body>

	<%@ include file="component/nav.jsp" %>

	<div class="container content">
        <h1 class="text-center">About Us</h1>
        <hr>
        <div class="row">
            <div class="col-md-6 d-flex align-items-center abt-top">
            <p class="d-block">Welcome to our car bidding website, ABC Cars! We are a dedicated team of car enthusiasts who have a passion for finding the best deals on vehicles. Our website is the perfect place for car buyers and sellers to come together and find their dream car at a fair price.</p>
            </div>
            <div class="col-md-6">
            <img src="https://images.unsplash.com/photo-1494905998402-395d579af36f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80" class="img-fluid shadow" alt="car bidding website">
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-md-12">
            <p>We understand that buying a car can be a daunting task, which is why we have made it our mission to make the process as simple and stress-free as possible. Our website is user-friendly and easy to navigate, making it easy for you to find the perfect car for your needs.</p>
            <p>Our team is constantly working to ensure that our inventory is up-to-date and that the cars listed on our website are of the highest quality. We only work with reputable sellers, so you can rest assured that you are getting a great deal on a reliable vehicle.</p>
            <p>We also understand that not everyone has the same budget, which is why we offer a wide range of cars at various price points. Whether you're looking for a luxury car or a budget-friendly option, we have something for everyone.</p>
            </div>
        </div>
        </div>

    <%@ include file="component/footer.jsp" %>


</body>
</html>