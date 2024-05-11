<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import="userpackage.Model.Auction" %>
<%@ page import="userpackage.Model.Users" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>login</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Abel&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito&amp;display=swap">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/-Login-form-Page-BS4--Login-form-Page-BS4.css">
    <link rel="stylesheet" href="assets/css/Div-Overlay-Black.css">
    <link rel="stylesheet" href="assets/css/Footer-Dark-Multi-Column-icons.css">
    <link rel="stylesheet" href="assets/css/Signup-page-with-overlay.css">
</head>

<body>
	
	<%ArrayList<Users> users = (ArrayList<Users>)session.getAttribute("users"); %>
	
	
	<jsp:include page="header.jsp" />
	
<%-- 	
    <nav class="navbar navbar-expand-md bg-body py-3">
        <div class="container"><a class="navbar-brand d-flex align-items-center" href="productPage.html"><span class="bs-icon-sm bs-icon-rounded bs-icon-primary d-flex justify-content-center align-items-center me-2 bs-icon"><img style="height: 32px;width: 32px;background: var(--bs-body-bg);" src="assets/img/auction.png"></span><span style="color: #404040;">AuctionUp</span></a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item d-flex flex-row justify-content-center align-items-center" style="margin-right: 20px;color: #404040;">
                    	<a class="nav-link" href="newAuction.html" style="margin-left: 0px;color: rgba(0,0,0,0.65);">
                    		<img style="width: 10px;height: 10px;color: #404040;" src="assets/img/plus.png">
                    		<span style="color: #404040;margin-left: 5px;">New Auction</span>
                    	</a>
                    </li>
                    <li class="nav-item d-flex d-md-flex flex-row justify-content-center align-items-center justify-content-md-center align-items-md-center" style="margin-right: 20px;">
                    	<a class="nav-link d-flex justify-content-center align-items-center" href="messagePage.html" style="margin-left: 0px;color: #404040;">
                    		<img style="width: 12px;height: 12px;margin-right: 5px;color: #404040;" src="assets/img/mail.png">
                    		<span style="color: #404040;">Messages</span>
                            <div style="height: 20px;width: 0px;color: rgb(64, 64, 64);margin-left: 10px;border: 1px solid #404040 ;"></div>
                        </a>
                    </li>
                    <li class="nav-item d-flex d-md-flex flex-row justify-content-center align-items-center justify-content-md-center align-items-md-center">
                        <div class="nav-item dropdown">
                        	<a aria-expanded="false" data-bs-toggle="dropdown" href="#" style="text-decoration: none;">
                        		<span style="margin-right: 5px;color: #404040;"><%=users.get(0).getFirstName()%></span>
                        		<span style="margin-right: 10px;color: #404040;"><%=users.get(0).getLastName()%></span>
                        		<img class="rounded-circle border border-1 border-secondary shadow-lg focus-ring" style="width: 32px;height: 32px;" src="Images/Default.jpg" />
                        	</a>
                            <div class="dropdown-menu dropdown-menu-end">
                            	<a href="profilePage.jsp" style="padding-top: 4px;padding-bottom: 4px;padding-right: 16px;padding-left: 16px;color: var(--bs-navbar-active-color);text-decoration-line: none;">Profile</a>
                            	<a class="dropdown-item" href="#">Settings</a>
                            	<a class="dropdown-item" href="index.jsp">Logout</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
     --%>
    
    
    
    <div class="d-inline-flex flex-column align-content-start flex-wrap flex-sm-shrink-1" style="width: 100%;height: 30px;background: rgb(44,47,50);overflow: scroll;overflow-y: hidden;">
    	<label class="form-label" data-bss-hover-animate="pulse" style="color: var(--bs-body-bg);margin-left: 50px;margin-right: 20px;font-family: Abel, sans-serif;font-weight: bold;margin-top: 5px;padding-right: 10px;padding-left: 10px;height: 100%;">
    		<span style="background-color: gray; padding: 40px;">Profile</span>
    	</label>
    	<label class="form-label" data-bss-hover-animate="pulse" style="color: var(--bs-body-bg);margin-left: 20px;margin-right: 20px;font-family: Abel, sans-serif;font-weight: bold;margin-top: 5px;padding-right: 10px;padding-left: 10px;height: 100%;">
    		<span style="background-color: rgb(43, 47, 50);">Settings</span>
    	</label>
    	
    </div>
    
    <div class="container-fluid" style="background: #efefef;">
       
        <div class="row mb-3" style="padding-top: 10px;">
            <div class="col-lg-4">
                <div class="card mb-3">
                    <div class="card-body text-center shadow">
                    	<img class="rounded-circle img-fluid border border-1 border-secondary shadow-lg focus-ring mb-3 mt-4"  width="160" height="160" src="<%=users.get(0).getProfilePicture()%>">
                        <div class="mb-3">
                        	<button class="btn btn-info mt-2" type="button" style="color: var(--bs-body-bg);background: linear-gradient(-91deg, rgb(103,170,255) -5%, var(--bs-btn-bg) 100%), rgb(103,170,247);">Change Photo</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
   
                <div class="row">
                    <div class="col" >
                        <div class="card shadow mb-3" >
                            <div class="card-header py-3"  style="background: linear-gradient(64deg, rgb(92,197,237) 0%, rgb(93,170,248) 100%);">
                                <p class=" m-0 fw-bold" style="color: #ffffff;" >Change Password</p>
                            </div>
                            <div class="card-body">
                                <form>
                                    <div class="row">
                                        <div class="col">
                                            <div class="mb-3"><label class="form-label" for="username" ><strong>Password</strong></label>
                                            <input class="form-control" type="text" id="username" placeholder="<%=users.get(0).getPassword()%>" name="username"></div>
                                        </div>
                                        <div class="col">
                                            <div class="mb-3"><label class="form-label" for="email"><strong>Confirm Password</strong></label>
                                            <input class="form-control" type="email" id="email" placeholder="<%=users.get(0).getPassword()%>" name="email"></div>
                                        </div>
                                    </div>
                                    <div class="mb-3"><button class="btn btn-info mt-2" type="submit" style="color: var(--bs-body-bg);background: linear-gradient(-91deg, rgb(103,170,255) -5%, var(--bs-btn-bg) 100%), rgb(103,170,247);">Save Settings</button></div>
                                </form>
                            </div>
                        </div>
                        <div class="card shadow">
                            <div class="card-header py-3" style="background: linear-gradient(64deg, rgb(92,197,237) 0%, rgb(93,170,248) 100%);">
                                <p class="m-0 fw-bold" style="color: #ffffff;">Contact Settings</p>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <div class="d-flex d-lg-flex flex-column justify-content-lg-start align-items-lg-start mb-3"><label class="form-label" for="first_name"><strong>First Name</strong></label>
                                        <input type="text" id="first_name-1" placeholder="<%=users.get(0).getFirstName()%>" name="first_name" style="width: 100%;border-radius: 6px;height: 38px;border: 1px solid rgb(223,226,230); padding-left: 10px;"></div>
                                    </div>
                                    <div class="col">
                                        <div class="d-flex flex-column mb-3" style="width: 100%;"><label class="form-label" for="last_name"><strong>Last Name</strong></label>
                                        <input type="text" id="last_name-1" placeholder="<%=users.get(0).getLastName()%>" name="last_name" style="border-radius: 6px;height: 38px;border: 1px solid rgb(223,226,230); padding-left: 10px;"></div>
                                    </div>
                                </div>
                                <form>
                                    <div class="mb-3"><label class="form-label" for="address"><strong>Address</strong></label>
                                    <input class="form-control" type="text" id="address" placeholder="<%=users.get(0).getAddress()%>" name="address"></div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="mb-3"><label class="form-label" for="city"><strong>City</strong></label>
                                            <input class="form-control" type="text" id="city" placeholder="<%=users.get(0).getCity()%>" name="city"></div>
                                        </div>
                                        <div class="col">
                                            <div class="mb-3"><label class="form-label" for="country"><strong>State</strong></label>
                                            <input class="form-control" type="text" id="country" placeholder="<%=users.get(0).getState()%>" name="country"></div>
                                        </div>
                                        <div class="col">
                                            <div class="mb-3"><label class="form-label" for="country"><strong>ZipCode</strong></label>
                                            <input class="form-control" type="text" id="country" placeholder="<%=users.get(0).getZipCode()%>" name="country" style="color: gray;"></div>
                                        </div>
                                        <div class="row">
                                            <div class="mb-3"><label class="form-label" for="country"><strong>Phone Number</strong></label>
                                            <input class="form-control" type="text" id="country" placeholder="<%=users.get(0).getPhoneNumber()%>" name="country" style="color: gray;"></div>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                    	<button class="btn btn-info mt-2" type="submit" style="visibility: visible; color: var(--bs-body-bg);background: linear-gradient(-91deg, rgb(103,170,255) -5%, var(--bs-btn-bg) 100%), rgb(103,170,247);">Edit&nbsp;Settings</button>
                                    	<button class="btn btn-info mt-2" type="submit" style="visibility: hidden; color: var(--bs-body-bg);background: linear-gradient(-91deg, rgb(103,170,255) -5%, var(--bs-btn-bg) 100%), rgb(103,170,247);">Cancel&nbsp;Settings</button>
                                    	<button class="btn btn-info mt-2" type="submit" style="visibility: hidden; color: var(--bs-body-bg);background: linear-gradient(-91deg, rgb(103,170,255) -5%, var(--bs-btn-bg) 100%), rgb(103,170,247);">Save&nbsp;Settings</button>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    
    <jsp:include page="footer.jsp" />
    
    
    
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="assets/js/countDownTimer.js"></script>
    <script src="assets/js/newCountDownTimers.js"></script>
</body>

</html>