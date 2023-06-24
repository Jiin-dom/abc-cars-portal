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
<link href="/css/allCar.css" rel="stylesheet" />

<style>
        .tablehead{
            font-size: 14px;
            color: #FFD369;
            text-align: center;
        }
</style>
</head>
<body>
<%@ include file="navbar.jsp"%>
 <div class="jumbotron">
        <div class="container containerCarManage">
            <div class="jumbotroncont">
                <h1 class="jumbotronhead">Car Management</h1>
                <!-- <p class="lead jumbotronheadlead">Drive Away with Confidence: Experience Safe, Fast, and Efficient Car Bidding with ABC Cars</p> -->
            </div>
          
        </div>
      </div>
    
    <div class="outerCont">
        <div class="container innerContCarManage">
            <!-- <h3 class="carManagementHead">Car Management</h3> -->
    
            <div class="row">
                <div class="col-12">
                    <div class="table-responsive">
                        <table class="table table-bordered carManageTable">
                            <thead class="theadrow">
                                <tr>
                                    <th  class="tablehead" scope="col">No.</th>
                                    <th  class="tablehead" scope="col">Brand</th>
                                    <th  class="tablehead" scope="col">Model</th>
                                    <th  class="tablehead" scope="col">Price (PHP)</th>
                                    <th  class="tablehead" scope="col">Seller</th>
                                    <th  class="tablehead" scope="col">Action</th>
                                    <th  class="tablehead" scope="col">Sell Car?</th>
                                    <th  class="tablehead" scope="col">Current Bid (PHP)</th>
                                    <th  class="tablehead" scope="col">Booking Date</th>
                                    <th  class="tablehead" scope="col">Approve Booking?</th>
                                    <th  class="tablehead" scope="col">Bidder Name</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${cars}" var="c" varStatus="status">
                                <tr>
                                    <th scope="row" class="tdCarmanage">${status.count}</th>
                                    <td class="tdCarmanage">${c.brand}</td>
                                    <td class="tdCarmanage">${c.model}</td>
                                    <td class="tdCarmanage">${c.price}</td>
                                    <td class="tdCarmanage">
                                        <a type="button" class="btn btn-primary" href="/view?uid=${c.sellerId}"> <i class="far fa-eye"></i></a>
                                    </td>
                                    <td class="tdCarmanage">
                                        <a type="button" class="btn btn-primary" href="/carDetail?cid=${c.id}"> <i class="far fa-eye"></i> </a> 
                                        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal${status.index}"> <i class="fas fa-edit"></i> </button>
                                        <a type="button" class="btn btn-danger" href="/delete_car?cid=${c.id}"> <i class="far fa-trash-alt"></i> </a>
                                    </td>
                                    <td class="tdCarmanage">${c.sellStatus}<!-- Button trigger modal -->
                                        <button type="button" class="btn" data-bs-toggle="modal"
                                            data-bs-target="#exampleModal2${status.index}">
                                            <i class="fas fa-edit fa-sm"></i>
                                        </button>
                                    </td>
                                    <c:forEach items="${c.biddings}" var="b" begin="0" end="0">
                                        <td class="tdCarmanage">${b.biddingPrice}</td>
                                        <td class="tdCarmanage">${b.bookingDate}</td>
                                        <!-- booking modal -->
                                        <td class="tdCarmanage">${b.bookingStatus}<!-- Button trigger modal -->
                                            <button type="button" class="btn" data-bs-toggle="modal"
                                                data-bs-target="#exampleModal1${status.index}">
                                                <i class="fas fa-edit fa-sm"></i>
                                            </button> <!-- Modal -->
                                        </td>
                                        <td class="tdCarmanage">${b.bidderName}</td>
                                    </c:forEach>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    





    <div class="modal fade" id="exampleModal${status.index}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" role="dialog">
            <div class="modal-dialog">
                
                <div class="modal-content">
                    <sf:form action="/edit_car?cid=${c.id}" method="post" class="was-validated" modelAttribute="car" enctype="multipart/form-data">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Edit
                                Car Post</h5>
                            <button type="button" class="btn-close"
                                data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">

                            <!-- Car Post Form -->
                            <!-- <sf:form action="/edit_car?cid=${c.id}" method="post" class="was-validated" modelAttribute="car" enctype="multipart/form-data"> -->
                                <div class="mb-3 mt-3">
                                    <label for="name" class="d-flex form-label">Brand:</label>
                                    <input type="text" class="form-control" placeholder="Enter car name" 
                                    name="name" path="name" required="true" value="${c.brand}" />
                                    <div class="valid-feedback">Valid.</div>
                                    <div class="invalid-feedback">Please fill out this field.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="model" class="d-flex form-label">Model:</label>
                                    <input type="text" class="form-control" placeholder="Enter model"
                                    name="model" path="model" value="${c.model}" required="true" />
                                    <div class="valid-feedback">Valid.</div>
                                    <div class="invalid-feedback">Please fill out this field.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="price" class="d-flex form-label">Price (PHP):</label> 
                                    <input type="text" class="form-control" id="price" placeholder="Enter car price" 
                                    name="price" path="price" value="${c.price}" required="true" />
                                    <div class="valid-feedback">Valid.</div>
                                    <div class="invalid-feedback">Please fill out this field.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="make" class="d-flex form-label">Manufacture Year:</label> 
                                    <input type="text" class="form-control" placeholder="Enter manufacture year"
                                    name="manufactureYear" path="manufactureYear" value="${c.manufactureDate}" required="true" />
                                    <div class="valid-feedback">Valid.</div>
                                    <div class="invalid-feedback">Please fill out this field.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="registration" class="d-flex form-label">Registration Date:</label> 
                                    <input type="text" class="form-control" id="registration" placeholder="Enter registration year" 
                                    name="registration" path="registration" value="${c.registration}" required="true" />
                                    <div class="valid-feedback">Valid.</div>
                                    <div class="invalid-feedback">Please fill out this field.</div>
                                </div>
                                <!-- <div class="mb-3">
                                    <label class="d-flex form-label">Photo:</label> <input
                                        type="file" class="form-control" name="fileImage"
                                        id="photo" accept="image/png, image/jpeg"
                                        required="true" />
                                    <div class="valid-feedback">Valid.</div>
                                    <div class="invalid-feedback">Please fill out this
                                        field.</div>
                                </div>-->

                                <input type="hidden" name="sellerId" value="${c.sellerId}" />
                                <input type="hidden" name="photos" value="${c.photos}" />
                                <input type="hidden" name="photoImagePath" value="${c.photoImagePath}" />

                                <div class="holder" style="height: 300px; width: 300px; margin: auto;">
                                    <img id="imgPreview" src="${c.photoImagePath}" alt="image preview" style="width: inherit;" />
                                </div>

                                
                            <!-- </sf:form> -->
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
                            <!-- Car Post Form -->
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn editBtn d-flex">Edit</button>
                            <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Close</button>

                        </div>
                    </sf:form>
                </div>
            </div>

        </div>


            <div class="modal fade" id="exampleModal2${status.index}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModal2Label">Set
                                Car Sale Status</h5>
                            <button type="button" class="btn-close"
                                data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">

                            <!-- Sale Status Form -->
                            <sf:form action="/sale_status?cid=${c.id}" method="post"
                                class="was-validated" modelAttribute="biddings">
                                <div class="mb-3 mt-3">
                                    <label for="sellStatus" class="form-label">Sale
                                        Status:</label> <input type="text" class="form-control"
                                        placeholder="Enter sale status" name="sellStatus"
                                        value="${c.sellStatus}" required="true" />
                                    <div class="valid-feedback">Valid.</div>
                                    <div class="invalid-feedback">Please fill out this
                                        field.</div>
                                </div>
                                <div class="assignBtnDiv">
                                    <button type="submit" class="btn btn-warning setBtn">Set</button>
                                </div>
                                
                            </sf:form>
                        </div>
                    </div>
                </div>
            </div>



            <div class="modal fade" id="exampleModal1${status.index}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModal1Label">Set
                                Booking Status</h5>
                            <button type="button" class="btn-close"
                                data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">

                            <!-- Booking Status Form -->
                            <sf:form action="/booking_status?bid=${b.id}"
                                method="post" class="was-validated" modelAttribute="book">
                                <div class="mb-3 mt-3">
                                    <label for="bookStatus" class="form-label">Booking
                                        Status:</label> <input type="text" class="form-control"
                                        placeholder="Enter booking status" name="bookStatus"
                                        value="${b.bookStatus}" required="true" />
                                    <div class="valid-feedback">Valid.</div>
                                    <div class="invalid-feedback">Please fill out this
                                        field.</div>
                                </div>
                                <div class="assignBtnDiv">
                                    <button type="submit" class="btn btn-warning setBtn">Set</button>
                                </div>
                                
                            </sf:form>
                        </div>
                    </div>
                </div>
            </div>
            
       
</body>
</html>