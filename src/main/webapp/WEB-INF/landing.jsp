<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
    
    <link href="/css/landing.css" rel="stylesheet" />
</head>
<body>
<%@ include file="navbar.jsp"%>
	<div class="banner" id="home">
        <div class="banner-text">
            <h2>ABC Cars</h2>
            <p class="bannerInnerText">Drive Away with Confidence: Experience Safe, Fast, and Efficient Car Bidding with ABC Cars</p>
            <a href="loginForm">Learn More</a>
        </div>
    </div>
    
    <div class="about container" id="about">
        <div class="section-header">
            <h2>About Us</h2>
            <p>Welcome to ABC Cars Pte Ltd, your trusted online destination for buying and selling used cars in Philippines.</p>
        </div>
        <div class="about-content">
            <div class="single-about">
                <img src="/images/carAuction.jpg" alt="">
                <div class="about-text">
                    <h2>Best Car Bidding Portal</h2>
                    <p>ABC Cars is the best car bidding portal as it provides a fast, secure, and user-friendly platform with a wide selection of vehicles, verified seller profiles, and competitive auctions, ensuring a hassle-free car shopping experience.</p>
                    <a href="loginForm">Learn More</a>
                </div>
            </div>
        </div>
    </div>
    
    <div class="contact" id="contact">
        <div class="section-header">
            <h2>Contact us</h2>
            <p>Contact us for any inquiries, technical support or feedback regarding our web hosting services and our team will get back to you as soon as possible.</p>
        </div>
    </div>

    <div class="service container mb-5" id="service">
        <div class="section-header">
            <h2>Our Services</h2>
            <p>ABC Cars offers a comprehensive car sale posting and bidding service that allows car sellers to list their vehicles for sale and enables buyers to bid on their desired cars with ease.</p>
        </div>
        <div class="service-content d-flex justify-content-center container">
            <div class="single-service container">
                <img src="/images/service1.jpg"  class="serviceImgs" >
                <h2>Fast Business Process</h2>
                <p>ABC Cars offers a fast and efficient car buying process, allowing you to browse through a wide selection of vehicles, place bids, and complete transactions quickly.</p>
            </div>
            <div class="single-service container">
                <img src="/images/service2.jpg"  class="serviceImgs"  alt="">
                <h2>Affordable Price</h2>
                <p>At ABC Cars, you can own your dream car without breaking the bank, as we offer a range of affordable vehicles at competitive prices with a bidding system that allows you to compete for the best deals.</p>
            </div>
            <div class="single-service container">
                <img src="/images/service3.jpg" class="serviceImgs" alt="">
                <h2>Luxury Designs</h2>
                <p>The latest models and designs from top car brands, and with our user-friendly interface and competitive bidding system, you can bid on your desired luxury car and get it at a great price.</p>
            </div>
        </div>
    </div>
</body>
</html>