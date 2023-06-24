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
<link href="/css/carDetails.css" rel="stylesheet" />
</head>
<body>

	<c:forEach items="${car}" var="c">
		<c:set var="id" value="${c.id}"></c:set>
		<c:set var="brand" value="${c.brand}"></c:set>
		<c:set var="image" value="${c.photoImagePath}"></c:set>
		<c:set var="manufactureDate" value="${c.manufactureDate}"></c:set>
		<c:set var="model" value="${c.model}"></c:set>
		<c:set var="registration" value="${c.registration}"></c:set>
		<c:set var="price" value="${c.price}"></c:set>
		<c:set var="sellStatus" value="${c.sellStatus}"></c:set>
	</c:forEach>
	
	<%@ include file="navbar.jsp"%>
<div class="container carDetailsCont">
        <div class="card mb-4 mt-5">
            <div class="row no-gutters">
              <div class="col-md-7">
                <img src="${image}" id="main_product_image" width="100%" class="card-img" alt="car">
                <!-- <img src="${image}" class="card-img" alt="car" id="carDetailsImg"> -->
              </div>
              <div class="col-md-5">
                <div class="card-body cardbodyCarDetails">
                  <h2 class="card-title carBrandName">${brand} ${model}</h2>
                  <!-- <h5 class="card-title">${brand} ${model}</h5> -->
                  <div class="cardDetails1">
                    <div class="cardDetailsInner">
                        <h5 class="carLabels">Brand</h5>
                        <div class="innerMost">
                          <i class="bi bi-car-front-fill"></i><p class="card-text cardLabelMain">${brand}</p>
                        </div>
                        
                    </div>
                    <div class="cardDetailsInner">
                        <h5 class="carLabels">Manufacture Date</h5>
                        <div class="innerMost">
                          <i class="bi bi-calendar-event"></i><p class="card-text cardLabelMain">${manufactureDate}</p>
                        </div>
                        <!-- <i class="bi bi-r-circle"></i><p class="card-text">{manufactureDate}</p> -->
                    </div>
                  </div>
                  <div class="cardDetails2">
                    <div class="cardDetailsInner">
                        <h5 class="carLabels">Model</h5>
                        <div class="innerMost">
                          <i class="bi bi-car-front-fill"></i><p class="card-text cardLabelMain">${model}</p>
                        </div>
                    </div>
                    <div class="cardDetailsInner">
                        <h5 class="carLabels">Registration Date</h5>
                        <div class="innerMost">
                          <i class="bi bi-r-circle"></i><p class="card-text cardLabelMain">${registration}</p>
                        </div>
                        <!-- <i class="bi bi-r-circle"></i><p class="card-text">{registration}</p> -->
                      </div>
                    </div>

                    <!-- <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
                  
                  <!-- <h5 class="card-title">${brand}</h5> -->

                  <c:if test="${sellStatus == 'sold'}">
                    <!-- <h3>Car Sold!</h3> -->
                  </c:if>
                  
                  <c:if test="${sellStatus != 'sold'}">

                  <div class="prices">
                    <div class="currentPrice">
                      <h4 class="price1">Current Price</h4>
                      <h5 class="price2">PHP  ${price}</h5>
                    </div>
                    <div class="currentBid">
                        <h4 class="price1">Current Bid</h4>
                        <c:if test="${empty highest}">
                          <h5 class="price2">PHP 0</h5>
                        </c:if>
                        <c:if test="${not empty highest}">
                          <h5 class="price2">PHP ${highest}</h5>
                      </c:if>             
                    </div>
                  </div>

                  <div class="buttons">
                    <button class="btn testdriveBtn" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal1">Book For Test Drive</button>
                    <button type="button " class="btn bidBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">Bid</button>
                  </div>

<!-- ! Booking Modal ---------- -->
                  
                  <div class="modal fade" id="exampleModal1" tabindex=" aria-labelledby="exampleModal1Label" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="exampleModal1Label">Book for
                            Test Drive</h5>
                          <button type="button" class="btn-close"
                            data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <sf:form action="book" method="post" class="was-validated" modelAttribute="booking">
                          <div class="modal-body">
                            <!-- Book Form -->
                            <!-- <sf:form action="book" method="post" class="was-validated" modelAttribute="booking"> -->
                              <div class="mb-3 mt-3">
                                <label for="bookDate" class="form-label">Booking Date:</label> 
                                <input type="date" class="form-control" name="bookDate" required="true" />
                                <div class="valid-feedback">Valid.</div>
                                <div class="invalid-feedback">Please fill out this field.</div>
                              </div>

                              <input type="hidden" name="cid" value="${id}">

                              <!-- <button type="submit" class="btn btn-primary" style="width: auto;">Book on this Date</button> -->
                            
                            <!-- User Update Form -->
                          </div>
                          <div class="modal-footer">
                            <button type="submit" class="btn bookModalBtn" style="width: auto;">Book on this Date</button>
                            <button type="button" class="btn closeModalBtn btn-light" data-bs-dismiss="modal">Close</button>
                          </div>
                        </sf:form>
                      </div>
                    </div>
                  </div>



                  <!-- ! Bidding Modal ---------- -->
              <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Car
												Bidding</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
                    <sf:form action="bid" method="post" class="was-validated" modelAttribute="bidding">
                      <div class="modal-body">
                        <!-- Bid Form -->
                        
                          <div class="mb-3 mt-3">
                            <label for="name" class="form-label">Bid Price(PHP):</label> 
                            <input type="text" class="form-control" placeholder="Enter bidding price" name="bidderPrice" required="true" />
                            <div class="valid-feedback">Valid.</div>
                            <div class="invalid-feedback">Please fill out this field.</div>
                          </div>

                          <input type="hidden" name="cid" value="${id}">

                          <!-- <button type="submit" class="btn btn-primary">Bid
                            at this price</button> -->
                        <!-- </sf:form> -->
                        <!-- User Update Form -->
                      </div>
                      <div class="modal-footer">
                        <button type="submit" class="btn bidModalBtn">Bid at this price</button>
                        <button type="button" class="btn btn-light closeModalbtn" data-bs-dismiss="modal">Close</button>
                      </div>
                    </sf:form>
									</div>
								</div>
                

							</div>
						</div>
						</c:if>
                  
                </div>
              </div>
            </div>

            <c:if test="${not empty bid}">
              <div class="row">
                <h3 style="margin-bottom: 20px;">Bidding & Booking Status</h3>
                <div class="col-12">
                  <table class="table table-bordered">
                    <thead>
                      <tr style="background-color: #121212; color:#FFD369;">
                        <th scope="col">Name</th>
                        <th scope="col">Bidding Date</th>
                        <th scope="col">Bidding Price (PHP)</th>
                        <th scope="col">Test Drive Book Date</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${bid}" var="b">
                        <tr>
                          <td>${b.bidderName}</td>
                          <td>${b.biddingDate}</td>
                          <td>${b.biddingPrice}</td>
                          <td>${b.bookingDate}</td>
                        </tr>

                      </c:forEach>

                    </tbody>
                  </table>
                </div>
              </div>
            </c:if>
          </div>
</body>
</html>