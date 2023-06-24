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
<link href="/css/userProfile.css" rel="stylesheet" />

<style>
 .profilePic{
            width: 180px; 
            border-radius: 10px;
        }
        .div3{
            justify-content: start;
        }
         .divbefore1{
            /* justify-content: center; */
            flex-direction: column;
        }

        .imgDiv2{
          display: flex;
          justify-content: center;
        }
        .imgDiv{}
        /* .tabs:active, .tabs:hover {
          color:#ffc249;
        }
        .tabs:active{
          background-color: #121212;
        } */
        @media screen and (max-width: 767px){
            .profilePic{
            text-align: center;
           
        }
        .imgDiv{
            margin-bottom: 10px;;
        }
        .div1, .div2{
            display: flex;
            justify-content: center;
            
        }
        .div2{
            display: flex;
            justify-content: center;
            flex-direction: column; 
        }
        .div3{
            justify-content: center;
        }
        .divbefore1{
            justify-content: center;
            /* flex-direction: column; */
        }
        }
        

</style>
</head>
<body>

<%@ include file="navbar.jsp"%>
    <c:forEach items="${user}" var="user">
		<c:set var="id" value="${user.id}"></c:set>
		<c:set var="name" value="${user.name}"></c:set>
		<c:set var="userName" value="${user.userName}"></c:set>
		<c:set var="email" value="${user.email}"></c:set>
		<c:set var="mobile" value="${user.mobile}"></c:set>
	</c:forEach>
     <section>
        <div class="container py-5">
          <div class="row d-flex">
            <div class="col col-md-7 col-lg-5 col-xl-3">
              <div class="card mb-5" style="border-radius: 15px;">
                <div class="card-body p-4">
                  <div class="d-flex text-black flex-column flex-wrap div1">
                    <div class="flex-shrink-0 imgDiv2">
                      <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-profiles/avatar-1.webp"
                        alt="Generic placeholder image" class="img-flex profilePic"
                        style="">
                        <!-- <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-profiles/avatar-1.webp"
                        alt="Generic placeholder image" class="img-flex profilePic"
                        style="width: 180px; border-radius: 10px;"> -->
                    </div>
                    <div class=" div2">
                        <div class="divbefore1 d-flex divbefore2">
                           <h5 class="mb-1 mt-3 text-center">${name}</h5>
                            <p class="mb-3 pb-1 text-center" style="color: #2b2a2a;">${email}</p>
                        </div>

                      <div class="d-flex rounded-3 p-2 mb-2 div3"
                        style="background-color: #efefef;">
                        <div>
                          <p class="small text-muted mb-1">Username</p>
                          <p class="mb-0">${userName}</p>
                        </div>
                        <div class="px-3">
                          <p class="small text-muted mb-1">Mobile</p>
                          <p class="mb-0">${mobile}</p>
                        </div>
                      </div>
                      <div class="d-flex pt-1">
                        <button type="button" class="btn btn-outline-warning me-1 flex-grow-1">Follow</button>
                        <button type="button" class="btn btn-warning flex-grow-1" data-bs-toggle="modal" data-bs-target="#exampleModal" >Update</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col col-md-12 col-lg-9 col-xl-9">
              <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                  <button class="nav-link active tabs" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Post Status</button>
                  <button class="nav-link tabs" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Booking Status</button>
          
                </div>
                </nav>
                <div class="tab-content" id="nav-tabContent">
                  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                    <c:if test="${not empty cars}">
                      <div class="">
                        <div class="row">
                          <div class="col-12 table-responsive">
                            <table class="table table-bordered">
                              <thead>
                                <tr>
                                  <th scope="col">Post</th>
                                  <th scope="col">Car</th>
                                  <th scope="col">Post Date</th>
                                  <th scope="col">Action</th>
                                  <th scope="col">Current Bid (PHP)</th>
                                  <th scope="col">Bidder Name</th>
                                  <th scope="col">Sale status</th>
                                </tr>
                              </thead>
                              <tbody>
                                <c:forEach items="${cars}" var="c" varStatus="status">
                                  <tr>
                                    <th scope="row">${status.count}</th>
                                    <td>${c.brand}</td>
                                    <td>${c.postDate}</td>
                                    <td>
                                      <!-- view car --> <a type="button" class="btn btn-primary"
                                      href="/carDetails?cid=${c.id}"> <i class="far fa-eye"></i>
                                    </a> <!-- view car --> <!-- edit car --> <!-- <button type="button" class="btn btn-success">
                                      <i class="fas fa-edit"></i>
                                    </button> --> <!-- edit car --> <!-- delete car --> <a
                                      type="button" class="btn btn-danger"
                                      href="/deletecar?cid=${c.id}"> <i
                                        class="far fa-trash-alt"></i>
                                    </a> <!-- delete car -->
                                    </td>
                                    <c:forEach items="${c.biddings}" var="b" begin="0" end="0">
                                      <c:set var="biddingPrice" value="${b.biddingPrice}"></c:set>
                                      <c:if test="${biddingPrice > 0}">
                                        <td>${b.biddingPrice}</td>
                                        <td>${b.bidderName}</td>
          
                                      </c:if>
                                      <td>${c.sellStatus}</td>
                                    </c:forEach>
          
                                  </tr>
                                </c:forEach>
          
                              </tbody>
                            </table>
                          </div>
                        </div>
          
                        <!-- end of row -->
                      </div>
                    </c:if>
                  </div>
                  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                    <c:if test="${not empty cars}">
                      <div class="">
                        <div class="row">
                          <div class="col-12  table-responsive">
                            <table class="table table-bordered">
                              <thead>
                                <tr>
                                  <th scope="col">No.</th>
                                  <th scope="col">Car</th>
                                  <th scope="col">Book Date</th>
                                  <th scope="col">Book By</th>
                                  <th scope="col">Book Status</th>
          
                                </tr>
                              </thead>
                              <tbody>
                                <c:forEach items="${cars}" var="c" varStatus="status">
                                  <c:forEach items="${c.biddings}" var="b">
                                    <c:set var="bookingDate" value="${b.bookingDate}"></c:set>
                                    <c:if test="${bookingDate != null}">
                                      <tr>
                                        <th scope="row">${status.count}</th>
                                        <td>${c.brand}</td>
                                        <td>${b.bookingDate}</td>
                                        <td>${b.bidderName}</td>
                                        <td>${b.bookingStatus}</td>
                                      </tr>
                                    </c:if>
                                  </c:forEach>
                                </c:forEach>
          
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>
                    </c:if>
          
                    <c:if test="${empty cars}">
                      <div class="">
                        <div class="row">
                          <div class="col-12  table-responsive">
                            <table class="table table-bordered">
                              <thead>
                                <tr>
                                  <th scope="col">No.</th>
                                  <th scope="col">Book Date</th>
                                  <th scope="col">Car</th>
                                  <th scope="col">Book Status</th>
                                  <th scope="col">View Car</th>
                                </tr>
                              </thead>
                              <tbody>
                                <c:forEach items="${bids}" var="b" varStatus="status">
                                  <c:set var="bookingDate" value="${b.bookingDate}"></c:set>
                                  <c:if test="${bookingDate != null}">
                                    <tr>
                                      <th scope="row">${status.count}</th>
                                      <td>${b.bookingDate}</td>
                                      <td>${b.car.brand}</td>
                                      <td>${b.bookingStatus}</td>
                                      <td>
                                        <!-- view car --> <a type="button"
                                        class="btn btn-primary" href="/carDetails?cid=${b.car.id}">
                                          <i class="far fa-eye"></i>
                                      </a> <!-- view car -->
                                      </td>
                                    </tr>
                                  </c:if>
                                </c:forEach>
          
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>
                    </c:if>
          
          
                  </div>
          
                </div>
            </div>
          </div>
        </div>
      </section>



      <!-- ! update profile modal -->

      <div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Update User</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
            <sf:form action="update" method="post" class="was-validated" modelAttribute="user">
              <div class="modal-body">

                <!-- User Update Form -->
              
                  <div class="mb-3 mt-3">
                    <label for="name" class="form-label">Name:</label> 
                    <input  type="text" class="form-control" placeholder="Enter name" 
                    name="name" path="name" value="${name}" required="true" />
                    <div class="valid-feedback">Valid.</div>
                    <div class="invalid-feedback">Please fill out this field.</div>
                  </div>
                  <div class="mb-3">
                    <label for="userName" class="form-label">Username:</label> 
                    <input type="text" class="form-control" id="userName" placeholder="Enter username" 
                    name="userName" path="userName" value="${userName}" required="true" />
                    <div class="valid-feedback">Valid.</div>
                    <div class="invalid-feedback">Please fill out this field.</div>
                  </div>
                  <div class="mb-3">
                    <label for="email" class="form-label">Email:</label> 
                    <input type="email" class="form-control" placeholder="Enter username" 
                    name="email" path="email" value="${email}" required="true" />
                    <div class="valid-feedback">Valid.</div>
                    <div class="invalid-feedback">Please fill out this field.</div>
                  </div>
                  <div class="mb-3">
                    <label for="mobile" class="form-label">Mobile:</label>
                    <input type="text" class="form-control" id="mobile" placeholder="Enter mobile" 
                    name="mobile" path="mobile" value="${mobile}" required="true" />
                    <div class="valid-feedback">Valid.</div>
                    <div class="invalid-feedback">Please fill out this field.</div>
                  </div>

                 
                
                <!-- User Update Form -->
              </div>
              <div class="modal-footer">
                <button type="submit" class="btn btn-warning">Update</button>
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
              </div>
            </sf:form>
					</div>
				</div>
			</div>
		</div>
		
	<footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-sm-6">
                    <div class="single-box">
                        <img src="img/logo.png" alt="">
                    <p>With our used car sales portal and bidding feature, users can find and buy their desired cars, all in one convenient location. </p>
                    <h3>We Accept</h3>
                    <div class="card-area">
                            <i class="bi bi-bank"></i>
                            <i class="fa fa-credit-card"></i>
                            <i class="bi bi-paypal"></i>
                            <i class="bi bi-wallet"></i>
                    </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single-box">
                        <h2>Services</h2>
                    <ul>
                        <li><a href="#">Car Registration</a></li>
                        <li><a href="#">Car Selling</a></li>
                        <li><a href="#">Car Bidding</a></li>
                        <li><a href="#">Car Listing</a></li>
                    </ul>
                    </div>                    
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single-box">
                        <h2>Car Bidding Details</h2>
                    <ul>
                        <li><a href="#">Brand</a></li>
                        <li><a href="#">Model</a></li>
                        <li><a href="#">Manufacture Date</a></li>
                        <li><a href="#">Registration Date</a></li>
                        <li><a href="#">Price Range</a></li>
                    </ul>
                    </div>                    
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single-box">
                        <h2>ABC Cars</h2>
                        <p>We are committed to providing our users with the best possible experience on our website. So, whether you're looking to buy or sell a used car, we've got you covered.</p>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Enter your Email ..." aria-describedby="basic-addon2">
                            <span class="input-group-text" id="basic-addon2"><i class="fa fa-long-arrow-right"></i></span>
                        </div>
                        <h2>Follow us on</h2>
                        <p class="socials">
                            <i class="bi bi-facebook"></i>
                            <i class="bi bi-instagram"></i>
                            <i class="bi bi-twitter"></i>
                            <i class="bi bi-youtube"></i>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>