<%@ page contentType="text/html; charset=US-ASCII"%>
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
<link href="/css/style.css" rel="stylesheet" />
</head>
<body>
<%@ include file="navbar.jsp"%>

    <div class="banner" id="home">
    </div>
<!--     
	<div class="headermain">
        <div class="upperleft">
            <p class="saletext1">Cars Sale up to <br><strong>40%</strong></p>
            <button class="btn homeviewbtn ">View Cars</button>
        </div>
    </div> -->
    <sec:authorize access="hasRole('Users')">
	    <div class="container salecont">
	            <p class="saletext2">Get the best value for your car - sell it now!</p>
	            <button type="button" class="btn salebtn" data-bs-toggle="modal" data-bs-target="#exampleModal">Sell Now</button>
	    </div>
    </sec:authorize>

    <div class="cardCont container-fluid">
        <a href="#" class="carCardsA">
            <div class="card cardBox" style="">
                <div class="card-body">
                    <img class="carCards" src="images/sedan.png" alt=""> 
                  <h5 class="card-title card-titleBox">Sedan</h5>
                </div>
            </div>
        </a>
      
        <a href="#" class="carCardsA">
            <div class="card cardBox" style="">
              <div class="card-body">
                <img  class="carCards" src="images/suv.png" alt=""> 
                <h5 class="card-title card-titleBox">SUV</h5>
              </div>
          </div>
        </a>
        <a href="#" class="carCardsA">
          <div class="card cardBox" style="">
              <div class="card-body">
                <img class="carCards"  src="images/truck.png" alt=""> 
                <h5 class="card-title card-titleBox">Truck</h5>
              </div>
            </div>
        </a>
        <a href="#" class="carCardsA">
            <div class="card cardBox" style="">
                <div class="card-body">
                    <img  class="carCards" src="images/convertibles.png" alt=""> 
                  <h5 class="card-title card-titleBox">Convertibles</h5>
                </div>
            </div>
        </a>
          <a href="#" class="carCardsA">
            <div class="card cardBox" style="">
              <div class="card-body card-bodyService">
                <img  class="carCards" src="images/hatchback.png" alt=""> 
                <h5 class="card-title card-titleBox">Hatchback</h5>
             
              </div>
                  </div>
            </a>
          <a href="#" class="carCardsA">
              <div class="card cardBox" style="">
                <div class="card-body">
                    <img  class="carCards" src="images/van.png" alt=""> 
                  <h5 class="card-title card-titleBox">Van</h5>
                </div>
            </div>
          </a>
        </div>


        <!-- --------------- Modal --------------------------- -->
  
  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Car Registration</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        
        <sf:form action="car_post" method="post" class="was-validated" modelAttribute="car" enctype="multipart/form-data">
        <div class="modal-body">
            <!--  -------------- Cart registration form ---------------------------->
            <c:if test="${success_post != null}">
				<div class="alert alert-success">${success_post}</div>
			</c:if>
          
            <div class="mb-3 mt-3">
                <label for="name" class="d-flex form-label">Brand:</label>
                <sf:input type="text" class="form-control"
                    placeholder="Enter car brand" name="brand" path="brand"
                    required="true" />
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this
                    field.</div>
            </div>
            <div class="mb-3">
                <label for="model" class="d-flex form-label">Model:</label>
                <sf:input type="text" class="form-control"
                    placeholder="Enter model" name="model" path="model"
                    required="true" />
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this
                    field.</div>
            </div>
            <div class="mb-3">
                <label for="price" class="d-flex form-label">Price
                    (PHP):</label>
                <sf:input type="text" class="form-control" id="price"
                    placeholder="Enter car price" name="price" path="price"
                    required="true" />
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this
                    field.</div>
            </div>
            <div class="mb-3">
                <label for="make" class="d-flex form-label">Manufacturing Date:</label>
                <sf:input type="text" class="form-control"
                    placeholder="Enter anufacturing year" name="manufactureDate" path="manufactureDate"
                    required="true" />
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this
                    field.</div>
            </div>
            <div class="mb-3">
                <label for="registeration" class="d-flex form-label">Registration Date:</label>
                <sf:input type="text" class="form-control" id="registeration"
                    placeholder="Enter registration date" name="registration"
                    path="registration" required="true" />
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this
                    field.</div>
            </div>
            <div class="mb-3">
                <label class="d-flex form-label">Photo:</label> 
                <input
                    type="file" class="form-control" name="fileImage" id="photo"
                    accept="image/png, image/jpeg" required="true" />
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this
                    field.</div>
            </div>

            <div class="holder"
                style="height: 300px; width: 300px; margin: auto;">
                <img id="imgPreview" src="#" alt="image preview"
                    style="width: inherit;" />
            </div>
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn" data-bs-dismiss="modal">Close</button>
          <button type="submit" class="btn postFormBtn">Post</button>
        </div>
       </sf:form>
       <script>
           $(document).ready(() => {
           	
               $("#photo").change(function () {
                   const file = this.files[0];
                   if (file) {
                       let reader = new FileReader();
                       reader.onload = function (event) {
                           $("#imgPreview")
                             .attr("src", event.target.result);
                       };
                       reader.readAsDataURL(file);
                   }
               });
           });
       </script>
      </div>
    </div>
  </div>
  
  <!-- list of all cars posted -->
  <div class="container ">
		<div class="row mb-5 carPostRow d-flex justify-content-center">
			<c:forEach items="${cars}" var="c">
				<c:set var="id" value="${c.id}"></c:set>
				<c:if test="${success_post == null}">

					<c:if test="${c.sellStatus != 'sold'}">
						<div class="card carCardPost">
							<img class="card-img-top" src="${c.photoImagePath}"
								alt="${c.photos}" style="width: 100%">
							<div class="card-body">
								<h4 class="card-title">${c.brand} ${c.model}</h4>
								<p class="card-text">
									<i class="fas fa-tags"></i>&nbsp;PHP ${c.price}
								</p>

								<a href="/carDetails?cid=${c.id}" class="btn btn-warning">View
									Car Details</a>
							</div>
						</div>
					</c:if>

				</c:if>
			</c:forEach>
			<c:if test="${success_post != null}">
				<div class="alert alert-success">${success_post}
					Click here to <a href="/carDetail?cid=${id}">View</a> your car
					post
				</div>
			</c:if>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>