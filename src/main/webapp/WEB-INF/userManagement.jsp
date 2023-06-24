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
<link href="/css/allUser.css" rel="stylesheet" />
<style>
                .tablehead{
            font-size: 18px;
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
                <h1 class="jumbotronhead">User Management</h1>
                <!-- <p class="lead jumbotronheadlead">Drive Away with Confidence: Experience Safe, Fast, and Efficient Car Bidding with ABC Cars</p> -->
            </div>
        </div>
      </div>
      
      <div class="outerCont">
        <div class="container">
            <div class="row">
                <div class="col-12">
                <div class="table-responsive">
                    <table class="table table-bordered carManageTable">
                        <thead  class="theadrow">
                            <tr class="tableRow">
                                <th  class="tablehead"scope="col">No.</th>
                                <th  class="tablehead"scope="col">Name</th>
                                <th  class="tablehead"scope="col">Username</th>
                                <th  class="tablehead"scope="col">Email</th>
                                <th  class="tablehead"scope="col">Role</th>
                                <th  class="tablehead"scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${user}" var="u" varStatus="status">
							<tr  class="tableRow">
								<th scope="row" class="tdCarmanage">${status.count}</th>
								<td  class="tdCarmanage">${u.name}</td>
								<td class="tdCarmanage">${u.userName}</td>
								<td class="tdCarmanage">${u.email}</td>
                                <c:forEach items="${u.roles}" var="r">
									<td class="tdCarmanage">${r.name}<!-- Button trigger modal -->
										<button type="button" class="btn" data-bs-toggle="modal"
											data-bs-target="#exampleModal1${status.index}">
											<i class="fas fa-edit fa-sm"></i>
                                        </button>
                                    </td>
                                </c:forEach>
                                <td class="actionBtnsGroup tdCarmanage">
                                    <a type="button" class="btn actionBtns btn-primary" href="/view?uid=${u.id}"> <i class="far fa-eye"></i> </a> <!-- Button trigger modal -->
									<button type="button" class="btn actionBtns  btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal${status.index}">
										<i class="fas fa-edit"></i>
									</button>
                                    <a type="button" class="btn actionBtns  btn-danger" href="/delete?uid=${u.id}"> <i class="far fa-trash-alt"></i>  </a>
                                </td>
                            </tr>
						    </c:forEach>
                        </tbody>
                    </table>
                </div>
                    
                </div>
            </div>
        </div>
      </div>












      <!-- ! roles modal -->
    <div class="modal fade" id="exampleModal1${status.index}" tabindex="-1" aria-labelledby="exampleModalLabel"aria-hidden="true" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModal1Label">Assign as Admin</h5>
                    <button type="button" class="btn-close"
                        data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <!-- Assign Admin Form -->
                    <sf:form action="/assign_role?uid=${u.id}" method="post"
                        class="was-validated" modelAttribute="user">
                        <div class="mb-3 mt-3">
                            <label for="name" class="form-label">Role:</label> <input
                                type="text" class="form-control"
                                placeholder="Enter role" name="name" value="${r.name}"
                                required="true" />
                            <div class="valid-feedback">Valid.</div>
                            <div class="invalid-feedback">Please fill out this
                                field.</div>
                        </div>
                        <div class="assignBtnDiv">
                            <button type="submit" class="btn assignBtn ms-auto">Assign</button>
                        </div>
                        
                    </sf:form>
                </div>
            </div>
        </div>
    </div>


    <!-- ! edit modal -->
    <div class="modal fade" id="exampleModal${status.index}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Edit
                        User</h5>
                    <button type="button" class="btn-close"
                        data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <%-- <sf:form action="/edit?uid=${u.id}" method="post" class="was-validated" modelAttribute="user"> --%>
                    <div class="modal-body">

                        <!-- User Update Form -->
                        <sf:form action="/edit?uid=${u.id}" method="post"
                            class="was-validated" modelAttribute="user">
                            <div class="mb-3 mt-3">
                                <label for="name" class="form-label">Name:</label> <input
                                    type="text" class="form-control"
                                    placeholder="Enter name" name="name" value="${u.name}"
                                    required="true" />
                                <div class="valid-feedback">Valid.</div>
                                <div class="invalid-feedback">Please fill out this
                                    field.</div>
                            </div>
                            <div class="mb-3">
                                <label for="userName" class="form-label">Username:</label>
                                <input type="text" class="form-control" id="userName"
                                    placeholder="Enter username" name="userName"
                                    value="${u.userName}" required="true" />
                                <div class="valid-feedback">Valid.</div>
                                <div class="invalid-feedback">Please fill out this
                                    field.</div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="email" class="form-label">Email:</label> <input
                                    type="email" class="form-control"
                                    placeholder="Enter username" name="email"
                                    value="${u.email}" required="true" />
                                <div class="valid-feedback">Valid.</div>
                                <div class="invalid-feedback">Please fill out this
                                    field.</div>
                            </div>
                            <div class="mb-3">
                                <label for="mobile" class="form-label">Mobile:</label> <input
                                    type="text" class="form-control" id="mobile"
                                    placeholder="Enter mobile" name="mobile"
                                    value="${u.mobile}" required="true" />
                                <div class="valid-feedback">Valid.</div>
                                <div class="invalid-feedback">Please fill out this
                                    field.</div>
                            </div>
                            <div class="mb-3">
                                <label for="address" class="form-label">Address:</label>
                                <input type="text" class="form-control" id="address"
                                    placeholder="Enter address" name="address"
                                    value="${u.address}" required="true" />
                                <div class="valid-feedback">Valid.</div>
                                <div class="invalid-feedback">Please fill out this
                                    field.</div>
                            </div>
							 <button type="submit" class="btn editBtn">Edit</button>
                            </sf:form>
                        
                        <!-- User Update Form -->
                    </div>
                    <div class="modal-footer">
                       <!--  <button type="submit" class="btn editBtn">Edit</button> -->
                        <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>

                    </div>
<%--                 </sf:form> --%>
            </div>
        </div>
	
    </div>
</body>
</html>