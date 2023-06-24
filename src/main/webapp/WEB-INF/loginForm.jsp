<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
<link href="/css/login.css" rel="stylesheet" />

<style>
.hero{
    height: 100%;
    width: 100%;
    background-image: linear-gradient(rgba(0,0,0,0.8),rgba(0,0,0,0.8)),url(/images/carsbg1.jpg);
    background-position: center;
    background-size: cover;
    position: absolute;
}
.center {
    display: block;
    margin-left: auto;
    margin-right: auto;
    width: 50%;
  }
.center{
	margin-left: 50px;
}
.form-box{
    width: 370px;
    height: 100px;
    margin: 6% auto;
    background: #fff;
    padding: 5px;
    border-radius: 20px;
    display: flex;
    justify-content: center;
    flex-direction: column;
    align-items: center;
    position: relative;
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="hero">
	    
        <c:if test="${error_msg != null}">
	        <div class="alert alert-danger">${error_msg}
	            Click here to <a href="register_user"> Register</a>
	        </div>
	    </c:if>
	    
	    <c:if test="${success_register != null}">
			<div class="alert alert-success">${success_register} Click here to <a href="login">
			Sign In</a> </div>
		</c:if>

    <div class="form-box" style="height: 400px;">
    
        <h3 class="loginformhead">Login</h3>
    
        <c:url var="post_url" value="/loginForm" />
        <form id="login" class="input-group inputgroup1 was-validated" action="${post_url}" method="post">
            <input type="hidden" name="${_csrf.parameterName}"
            value="${_csrf.token}" />
            <!-- <img src="images/kyn2.png" class="center mx-auto mt-5"> -->
            <input type="text" class="input-field mb-3" placeholder="Username" name="username" id="userName" required>
            <input type="password" class="input-field mb-3" placeholder="Enter Password" name="password" id="password" required>
            <!-- <input type="submit" name="Login" value="Sign In" class="btn submit-btn"></input> -->
            <div>
                <button type="submit" name="loginForm" class="loginbtn mt-4">Sign in</button>
            </div>
            
        </form>
        <!-- <a href="homepage" class="backtohome text-muted align-self-start ms-4"><i class="bi bi-arrow-bar-left"></i>Back</a> -->
    </div>
     
</div>
</body>
</html>