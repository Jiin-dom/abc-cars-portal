<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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
<link href="/css/aboutUs.css" rel="stylesheet" />

<style>
        .aboutUsCont2{
        display:flex;
        /* flex-wrap: wrap; */
        justify-content: space-between;
        /* flex-direction: row; */
        align-items: center;
        /* line-height: 2; */
        letter-spacing: 1;
        gap:5%;
        text-align: justify;
        background-color: #121212;
        color: #efefef;
        padding: 30px 40px;
    }
</style>
</head>
<body>
<%@ include file="navbar.jsp"%>
<div class="jumbotron">
        <div class="container">
            <div class="jumbotroncont">
                <h1 class="jumbotronhead">About Us</h1>
                <p class="lead jumbotronheadlead">Drive Away with Confidence: Experience Safe, Fast, and Efficient Car Bidding with ABC Cars</p>
            </div>
          
        </div>
      </div>
      <div class="container aboutUsCont1">
        <p>Welcome to ABC Cars Pte Ltd, your trusted online destination for buying and selling used cars in Philippines.</p>
      </div>
      <!-- <div class="row row2"> -->
        <div class="container aboutUsCont2">
            <p class="aboutCardesc">At ABC Cars, we are passionate about providing a seamless and convenient car buying experience for our customers. We understand that purchasing a car is a significant investment, which is why we offer a wide range of pre-owned vehicles to suit your budget and lifestyle. Whether you are looking for a reliable family car, a sporty convertible or a rugged SUV, we have got you covered.</p>
            <img src="/images/aboutUsCar1 (2).jpg" class="aboutUsCar1">
        </div>
      <!-- </div> -->
      <h3 class="features">Features</h3>
      <div class="container aboutusCardsCont">
        
        <div class="card aboutusCards">
            <div class="card-body aboutusCardsBody">
                <img src="/images/bid.png" class="aucardImg">
                <p class="carddesc card-text">ABC Cars is an online car bidding platform that lets you easily search for and bid on your desired vehicles. With a user-friendly interface and a wide selection of cars, you can compete for the best deals and drive away with your dream car. Sign up now and start bidding!</p>
            </div>
        </div>
        <div class="card aboutusCards">
            <div class="card-body aboutusCardsBody">
                <img src="/images/secure.png" class="aucardImg">
                <p class="carddesc card-text">ABC Cars is a secure online car bidding platform that puts the safety of its users first. With our advanced security measures, verified seller profiles, and secure payment system, you can bid with confidence. Join us now and enjoy a secure car shopping experience.</p>
            </div>

        </div>
        <div class="card aboutusCards">
            <div class="card-body aboutusCardsBody">
                <img src="images/fast.png" class="aucardImg aucardImgFast">
                <p class="carddesc card-text">
                    ABC Cars simplifies the car buying process with our fast and efficient bidding website. With a user-friendly interface and secure payment system, you can easily bid on your dream car and drive away with confidence. Join us now for a hassle-free car shopping experience.</p>
            </div>
        </div>
      </div>
      
      <%@ include file="footer.jsp"%>
</body>
</html>