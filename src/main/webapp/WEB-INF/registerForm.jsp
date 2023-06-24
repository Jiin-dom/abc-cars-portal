<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="reg" uri="http://www.springframework.org/tags/form"%>  
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
<link href="/css/register.css" rel="stylesheet" />

</head>
<body>
<%@ include file="navbar.jsp"%>
    <div class="hero">

		
			<c:if test="${success_register != null}">

			<div class="alert alert-success">${success_register} Please <a href="loginForm">Login</a></div>

			</c:if>
        <div class="form-box">
            <h3>Registration</h3>
         <reg:form id="register" class="input-group was-validated mt-3" modelAttribute="user" action="registerForm" method="post">
            <div class="mb-3 input-group2">
                <reg:input
                    type="text" class="form-control input-field register-input" 
                    placeholder="Enter name" name="name" path="name" required="true" 
                />
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this field.</div>
            </div>
            <div class="mb-3 input-group2">
                <reg:input
                    type="text" class="form-control input-field register-input" id="userName"
                    placeholder="Enter username" name="userName" path="userName" required="true" />
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this field.</div>
            </div>
			 <div class="mb-3 input-group2">
                <reg:input
                    type="text" class="form-control input-field register-input" id="mobile"
                    placeholder="Enter mobile number" name="mobile" path="mobile" required="true" />
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this field.</div>
            </div>
            <div class="mb-3 input-group2">
                <reg:input
                    type="email" class=" form-control input-field register-input" 
                    placeholder="Enter email" name="email" path="email" required="true" 
                />
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this field.</div>
            </div>
            <div class="mb-3 input-group2">
                <reg:input
                    type="password" class="form-control input-field register-input" id="password"
                    placeholder="Enter password" name="password" path="password" required="true" 
                />
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Please fill out this field.</div>
            </div>

            <div>
                <button type="submit" value="Register"
                class="btn btn-primary registerbtn">Register</button>
            </div>
        
        </reg:form>
       <!--  <a href="homepage" class="backtohome text-muted align-self-start ms-4"><i class="bi bi-arrow-bar-left"></i>Back</a> -->
    </div>
</div>
</body>
</html>