<%@ taglib prefix="srch" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<style>
        /* dropdown */
        .dropdown_menu{
            display: none;
            position:absolute;
            right: 2rem;
            top: 60px;
            width: 300px;
            height: 0;
            background: rgba(255,255,255, 0.1);
            backdrop-filter: blur(15px);
            border-radius: 20px;
            overflow: hidden;
            transition: height .2s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }
        .dropdown_menu.open{
            height: 445px;
        }
        .dropdown_menu li{
            padding: 0.7rem;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .dropdown_menu .action_btn{
            width: 100%;
            display: flex;
            justify-content: center;
        }

        /*  responsive */
        @media (max-width: 992px) {
            .navbar .links, .navbar .action_btn, .searchField{
                display: none;
            }

            .navbar .toggle_btn{
                display: block;
            }
            
            .dropdown_menu{
                display: block;
            }
        }
        @media (max-width: 576px){
            .dropdown_menu{
                left: 2rem;
                width: unset;
            }
        } 
</style>
    <header style="background-color: #121212;">
        <div class="navbar">
            <div class="logo"><a href="#"><img src="images/abccarslogo.png"></a></div>
            <ul class="links">
                
                <sec:authorize access="!isAuthenticated()">
                    <li><a href="aboutUs" class="About  navbar-links">About Us</a></li>
                    <li><a href="contactUs" class="Contact  navbar-links">Contact Us</a></li>
                    <li><a href="registerForm" class="Register navbar-links">Register</a></li>
                    <li><a href="loginForm" class="Login navbar-links">Login</a></li>
                </sec:authorize>

                <sec:authorize access="isAuthenticated()">
                    <sec:authorize access="hasRole('Users')">
                        <li><a href="homepage" class="Home navbar-links">Home</a></li>
                    </sec:authorize>

                    <sec:authorize access="hasRole('Administrator')">
                        <li><a href="homepage" class="Home navbar-links">Home</a></li>
                        <li><a href="carManagement" class="Cars navbar-links">Cars</a></li>
                        <li><a href="userManagement" class="Users navbar-links">Users</a></li>
                    </sec:authorize>

                    <sec:authorize access="hasAnyRole('Administrator','Users')">
                        <li><a href="userProfile" class="Users navbar-links">Profile</a></li>
                        <!-- <li> -->
                            <form action="logout" method="post" style="padding: 7px;">
                            <input type="hidden" name="${_csrf.parameterName}"
                                value="${_csrf.token}" /> <input type="submit" name="Logout"
                                value="Logout" class="btn  navbar-links action_btn"></input>
                            </form>
                        <!-- </li> -->
                        <sf:form action="search" method="get">
                            <div class="input-group searchField">
                                <input type="search" class="form-control rounded " placeholder="Search" aria-label="Search" name="keyword" aria-describedby="search-addon" />
                                <button type="submit" class="btn btn-outline-warning "><i class="bi bi-search"></i></button>
                            </div>
                        </sf:form>
                    </sec:authorize>
                </sec:authorize>
                


                
            </ul>
            <!-- <sf:form action="search" method="get">
                <div class="input-group searchField">
                    <input type="search" class="form-control rounded " placeholder="Search" aria-label="Search" name="keyword" aria-describedby="search-addon" />
                    <button type="submit" class="btn btn-outline-warning"><i class="bi bi-search"></i></button>
                </div>
            </sf:form> -->
            <div class="toggle_btn">
                <i class="bi bi-list"></i>
            </div>
        </div>
        <div class="dropdown_menu">
            <sec:authorize access="!isAuthenticated()">
                <li><a href="aboutUs" class="About  navbar-links">About Us</a></li>
                <li><a href="contactUs" class="Contact  navbar-links">Contact Us</a></li>
                <li><a href="registerForm" class="Register navbar-links">Register</a></li>
                <li><a href="loginForm" class="Login navbar-links">Login</a></li>
            </sec:authorize>
            
            <sec:authorize access="isAuthenticated()">
                <sec:authorize access="hasRole('Users')">
                    <li><a href="homepage" class="Home navbar-links">Home</a></li>
                </sec:authorize>

                <sec:authorize access="hasRole('Administrator')">
                    <li><a href="homepage" class="Home navbar-links">Home</a></li>
                    <li><a href="carManagement" class="Cars navbar-links">Cars</a></li>
                    <li><a href="userManagement" class="Users navbar-links">Users</a></li>
                </sec:authorize>

                <sec:authorize access="hasAnyRole('Administrator','Users')">
                    <li><a href="userProfile" class="Users navbar-links">Profile</a></li>
                    <li>
                        <form action="logout" method="post" style="padding: 7px;">
                        <input type="hidden" name="${_csrf.parameterName}"
                            value="${_csrf.token}" /> <input type="submit" name="Logout"
                            value="Logout" class="btn  navbar-links action_btn"></input>
                        </form>
                    </li>
                    <sf:form action="search" method="get">
                        <div class="input-group searchField">
                            <input type="search" class="form-control rounded " placeholder="Search" aria-label="Search" name="keyword" aria-describedby="search-addon" />
                            <button type="submit" class="btn btn-outline-warning "><i class="bi bi-search"></i></button>
                        </div>
                    </sf:form>
                </sec:authorize>
            </sec:authorize>
        </div>
    </header>

    <script>
        const toggleBtn = document.querySelector('.toggle_btn')
        const toggleBtnIcon = document.querySelector('.toggle_btn i')
        const dropDownMenu = document.querySelector('.dropdown_menu')

        toggleBtn.onclick = function (){
            dropDownMenu.classList.toggle('open')
            const isOpen = dropDownMenu.classList.contains('open')

            toggleBtnIcon.classList = isOpen
            ? 'bi bi-x'
            : 'bi bi-list'
            
        }
    </script>
