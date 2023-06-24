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
<link href="/css/login.css" rel="stylesheet" />
<link href="/css/contactUs.css" rel="stylesheet" />
<style>
 .contactCont{
    display:flex;
    flex-direction: row;
      gap: 2em;
      
    }
    .contactCard{
    width:400px;
    padding: 20px 40px;
      border-radius: 10px;
      border: none;
      background-color: #efefef;
      box-shadow: 1px 1px 8px 10px rgba(85, 85, 85, 0.3)
    }
    .supportCard{
      padding: 20px 40px;
      border-radius: 10px;
      border: none;
      width: 610px;
          background-color: #efefef;
  box-shadow: 1px 1px 8px 10px rgba(85, 85, 85, 0.3);
  margin-bottom: 5%;
    }
    .wholeCont{
    display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
    }
    .supportCont{
    display: flex;
      gap: 2em;
    }
    
    .chatnow{
    font-size: 18px
    }
    .contactDesc{
    font-size: 18px;
    }
    .contactHead2{
    font-size: 22px;
      margin-top: 20px;
      color: #0F4C75;
    }
    .head3{
    margin-top: 30px;
    }
    .contactMainHead{
    font-size: 30px;
    margin-bottom: 20px;
    }
    .contactMainDesc{
    font-size: 20px;
        margin-bottom: 30px;
    }
    /* .upperCont{
    margin-left: 15%;
        margin-right: 15%;
      margin-top: 5%;
          margin-bottom: 1%;
    } */
    .contactImgs{
        width: 50px;
        height: 50px;
    }


    .contactRow{
        gap:5%;
        margin-bottom: 10%;
    }
    .upperCont{
      margin-top: 5%;
      color:#efefef;
    }



.faqrow{
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}
 .contactformbtn{
  background-color: #ffc249 ;
  font-size: 1.25rem;
            font-weight:500;
            border-radius: 30px;
            padding: 10px 30px;
 }
 .contactinfocont{
  margin-bottom: 5%;
 }
 .contactuppercont{
  /* margin-top: 3%; */
 }
 /* .faqHead{
  font-size: ;
 } */

 .jumbotron{
        background-image: url('/images/contactjumbotron.png');
        background-size: 100%;
        /* height: 100%; */
        height: 400px;
        background-repeat: no-repeat;
    }
    .jumbotroncont{
        display: flex;
        flex-direction: column;
        align-items: center;
        /* margin-top: 100px; */
        
    }
    .jumbotronhead{
        color:#efefef;
        font-size:6rem;
        font-weight: 700;
        margin-top: 10%;
    }
    .jumbotronheadlead{
        color:#efefef;
    }
    .outercont{
      background-color: #121212;
    }

    @media (max-width: 992px){
      .jumbotronhead{
        font-size:3rem;
        font-weight: 700;
        margin-top: 10%;
      }
      .jumbotron{
          background-image: url('Bootstrap Login/images/contactjumbotron.png');
          background-size: 100%;
          height: 19%;
          background-repeat: no-repeat;
      }
      .jumbotronheadlead{
        font-size: 1rem;
      }
      .contactMainHead{
        font-size: 24px;
        margin-bottom: 20px;
        }
        .contactMainDesc{
        font-size: 16px;
            margin-bottom: 30px;
        }
        .contactCont{
    display:flex;
      gap: 2em;
      
    }
    .contactCard{
    width:220px;
    padding: 10px 15px;
      border-radius: 10px;
      border: none;
      background-color: #efefef;
      box-shadow: 1px 1px 8px 10px rgba(85, 85, 85, 0.3);
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .contactDesc{
    font-size: 16px;
    }
    .contactHead2{
    font-size: 16px;
      margin-top: 20px;
      color: #0F4C75;
    }
    .supportCard{
      width: 345px;

    }
    }
    @media (max-width: 576px){
      .jumbotronhead{
        font-size:1.5rem;
        font-weight: 700;
        margin-top: 10%;
      }
      .jumbotron{
          background-image: url('Bootstrap Login/images/contactjumbotron.png');
          background-size: 100%;
          height: 15%;
          background-repeat: no-repeat;
          width: 100%;
      }
      .jumbotronheadlead{
        font-size: 0.5rem;
      }
      .contactMainHead{
        font-size: 24px;
        margin-bottom: 20px;
        }
        .contactMainDesc{
        font-size: 16px;
            margin-bottom: 30px;
        }
        .contactCont{
    display:flex;
      gap: 1em;
      
    }
    .contactCard{
    width:100px;
    padding: 5px 10px;
      border-radius: 10px;
      border: none;
      background-color: #efefef;
      box-shadow: 1px 1px 8px 10px rgba(85, 85, 85, 0.3);
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .contactImgs{
      width: 30px;
      height: 30px;
    }
    .contactDesc{
    font-size: 10px;
    }
    .contactHead2{
    font-size: 12px;
      margin-top: 20px;
      color: #0F4C75;
    }
    .supportCard{
      width: 160px;
      padding: 10px 20px;
      border-radius: 10px;
      border: none;
    }
    .supportCont{
      gap: 1em;
    }
    .chatnow{
      font-size: 12px
    }
    .contactformbtn{
      font-size: 14px;
      padding: 10px 20px;
      margin-bottom: 10%;
    }
    .wholeCont{
      margin-bottom: 10%;
    }
    }
    
                     //fOOTER
      footer {
	background: #101010;
	padding: 86px 0;
}
.single-content {
	text-align: center;
	padding: 115px 0;
}
.single-box p {
	color: #fff;
	line-height: 1.9;
}
.single-box h3 {
	font-size: 16px;
	font-weight: 700;
	color: #fff;
}
.single-box .card-area i {
	color: #ffffff;
	font-size: 20px;
	margin-right: 10px;
}
.single-box ul {
	list-style: none;
	padding: 0;
}
.single-box ul li a {
	text-decoration: none;
	color: #fff;
	line-height: 2.5;
	font-weight: 100;
}
.single-box h2 {
	color: #fff;
	font-size: 20px;
	font-weight: 700;
}
#basic-addon2 {
	background: #ffc249;
	color: #fff;
}
.socials i {
	font-size: 18px;
	margin-right: 15px;
}
@media (max-width: 767px) {
	.single-box {
		margin-bottom: 50px;
	}
}
@media (min-width: 768px) and (max-width: 991px) {
	.single-box {
		margin-bottom: 50px;
	}
}
</style>
</head>
<body>
<%@ include file="navbar.jsp"%>
	 <div class="jumbotron">
    <div class="container">
        <div class="jumbotroncont">
            <h1 class="jumbotronhead">Contact</h1>
            <p class="lead jumbotronheadlead">Contact ABC Cars Today and Let Us Help You Find Your Perfect Ride!</p>
        </div>
      
    </div>
  </div>

<div class="outercont">
  <div class="container contactinfocont">
    <div class="wholeCont">
        <div class="upperCont">
          <h3 class="contactMainHead">
            Need Some Help?
          </h3>
          <p class="contactMainDesc">
            Contact us for any inquiries, technical support or feedback regarding our web hosting services and our team will get back to you as soon as possible.
          </p>
        </div>
      
      <div class="contactCont">
        <div class="card contactCard">
          <img class="contactImgs" src="https://cdn.discordapp.com/attachments/1080063537029845017/1089781958504108122/Untitled_design_51_2.png">
          <h3 class="contactHead2">
            Address
          </h3>
          <p class="contactDesc">
            San Antonio, Makati City
          </p>
        </div>
        <div class="card contactCard">
          <img class="contactImgs"  src="https://cdn.discordapp.com/attachments/1080063537029845017/1089782405415575552/Untitled_design_51_6.png">
          <h3 class="contactHead2 head3">
            AAA Email address
          </h3>
          <p class="contactDesc">
            support@triplea.com
          </p>
        </div>
        <div class="card contactCard">
          <img  class="contactImgs" src="https://cdn.discordapp.com/attachments/1080063537029845017/1089781990661832714/Untitled_design_51_3.png">
          <h3 class="contactHead2">
            Contact Number
          </h3>
          <p class="contactDesc">
            +1 (555) 123-4567
          </p>
        </div>
      </div>
      <br>
       <div class="supportCont">
         <div class="card supportCard">
           <img class="contactImgs"  src="https://cdn.discordapp.com/attachments/1080063537029845017/1089782039575810078/Untitled_design_51_4.png">
           <h3 class="contactHead2">
               AAA Sales Help
           </h3>
           <p class="contactDesc">
             Chat with our sales team for expert web hosting guidance and support.
           </p>
           <a href="" class="chatnow">
              Chat Now ➜
           </a>
         </div>
         <div class="card supportCard">
           <img  class="contactImgs" src="https://cdn.discordapp.com/attachments/1080063537029845017/1089782072069066842/Untitled_design_51_5.png">
           <h3 class="contactHead2">
           Customer Support Chat
           </h3>
           <p class="contactDesc">
             24/7 expert support just a chat away for your website hosting needs.
           </p>
           <a href="" class="chatnow">
              Chat Now ➜
           </a>
         </div>
        </div>
      </div>
      

  </div>
</div>

    <div class="container contactuppercont">
        <div class="row contactRow">
            <h1>Contact Us</h1>
            <hr>
            <p>If you have any questions, comments, or feedback, please feel free to reach out to us using the contact form below. Our customer support team will respond to your query as soon as possible.</p>
           <div class="col-md-6">
                <h4>Your Details</h4>
                <hr>
                <form>
                    <div class="mb-3">
                    <label for="firstname" class="form-label">First Name:</label>
                    <input type="text" class="form-control" id="firstname" aria-describedby="firstnamehelp">
                    <!-- <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div> -->
                    </div>
                    <div class="mb-3">
                        <label for="lastname" class="form-label">First Name:</label>
                        <input type="text" class="form-control" id="lastname" aria-describedby="lastnamehelp">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email Address:</label>
                        <input type="text" class="form-control" id="email" aria-describedby="emailhelp">
                    </div>
                    
                </form>
                <hr>
                <div>
                    <h4>How can we help?</h4>
                    <hr>
                    <form>
                        <div class="mb-3">
                        <label for="inquiry" class="form-label">Inquery type:</label>
                        <input type="text" class="form-control" id="inquery" aria-describedby="inqueryhelp">
                        <!-- <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div> -->
                        </div>
                        <div class="mb-3">
                            <label for="lastname" class="form-label">Query:</label>
                            <textarea type="text" class="form-control" id="lastname" aria-describedby="query"></textarea>
                        </div>
                        <button type="submit" class="btn contactformbtn">Submit</button>
                    </form>
                </div>
           </div>

           <div class="col-md-5">
            <div class="FAQ">
                <div class="faqTitle">
                    <h4 class="faqHead">Frequently Asked Questions</h4>
                  </div>
                <div>
                  <div>
                    <hr>
                    <div class="faqRow">
                      <p>
                        What types of cars can I find on ABC Cars?
                      </p>
                      <i class="bi bi-plus-lg"></i>   
                      
                    </div>
                          <hr>
                  </div>
                  <div>
                    
                    <div class="faqRow">
                      <p>
                        How do I know if a car is in good condition?
                      </p>
                      <i class="bi bi-plus-lg"></i>        
                    </div>
                    <hr>
                  </div>
                  <div>
                    
                    <div class="faqRow">
                      <p>
                        Can I inspect the car before buying it?
                      </p>
                      <i class="bi bi-plus-lg"></i>        
                    </div>
                    <hr>
                  </div>
                  <div>
                    
                    <div class="faqRow">
                      <p>
                        How do I pay for the car if I win the bidding?
                      </p>
                      <i class="bi bi-plus-lg"></i>        
                    </div>
                    <hr>
                  </div>  
                  <div>
                    
                    <div class="faqRow">
                      <p>
                        What happens if I change my mind after winning the bid?
                      </p>
                      <i class="bi bi-plus-lg"></i>        
                    </div>
                    <hr>
                  </div>
                   
                </div>
              </div>
        </div>
           
        </div>
        
        
    </div>
    
    <%@ include file="footer.jsp"%>
</body>
</html>