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
<link href="/css/searchcar.css" rel="stylesheet" />
</head>
<body>
<%@ include file="navbar.jsp"%>
<div class="container">

        <c:if test="${empty searchCar}">
            <div class="alert alert-danger mt-3">No search results found for
            ${keyword}</div>
        </c:if>


        <!-- list of all cars posted -->
		<div class="row" style="gap: 60px;">

			<c:forEach items="${searchCar}" var="c">

				<div class="card cardSearch " style="width: 400px">
					<img class="card-img-top" src="${c.photoImagePath}"
						alt="${c.photos}" style="width: 100%">
					<div class="card-body cardSearchBody">
						<h4 class="card-title cardSearchTitle">${c.model}</h4>
                        <div class="cardSearchTextDiv">
                            <p class="card-text cardSearchText"> 
                                <i class="bi bi-car-front-fill"></i>&nbsp;PHP ${c.brand}
                            </p>
                            <p class="card-text cardSearchText">
                                <i class="bi bi-calendar-event"></i>&nbsp;PHP ${c.manufactureDate}
                            </p>
                            <!-- <p class="card-text cardSearchText">
                                <i class="fas fa-tags"></i>&nbsp;PHP ${c.price}
                            </p> -->
                        </div>

                        <p class="card-text cardSearchTextPrice">
                            <i class="fas fa-tags"></i>&nbsp;PHP ${c.price}
                        </p>
						
                        <div class="carSearchBtnDiv">
                            <a href="/carDetails?cid=${c.id}" class="btn cardSearchBtn">View</a>
                        </div>
						
					</div>
				</div>
			</c:forEach>

		</div>
		<!-- list of all cars posted -->

    </div>
</body>
</html>