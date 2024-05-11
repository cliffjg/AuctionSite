<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import="userpackage.Model.Auction" %>
<%@ page import="userpackage.Model.Users" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>


<!DOCTYPE html>
<html >
<head>


    
    
       <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>AuctionUp New Auction</title>
    <link rel="icon" type="image/png" href="Images/auction.png">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Abel&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito&amp;display=swap">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/-Login-form-Page-BS4--Login-form-Page-BS4.css">
    <link rel="stylesheet" href="assets/css/Div-Overlay-Black.css">
    <link rel="stylesheet" href="assets/css/Footer-Dark-Multi-Column-icons.css">
    <link rel="stylesheet" href="assets/css/Signup-page-with-overlay.css">
    
    
</head>
<body >


	
	<jsp:include page="header.jsp" />
	
	

    <div class="d-inline-flex flex-column align-content-start flex-wrap flex-sm-shrink-1" style="width: 100%;height: 30px;background: rgb(44,47,50);overflow: scroll;overflow-y: hidden;">
    	<label class="form-label" data-bss-hover-animate="pulse" style="color: var(--bs-body-bg);margin-left: 50px;margin-right: 20px;font-family: Abel, sans-serif;font-weight: bold;margin-top: 5px;padding-right: 10px;padding-left: 10px;height: 100%;">
    		<span style="background-color: rgb(43, 47, 50);">My Auctions</span>
    	</label>
    	<label class="form-label" data-bss-hover-animate="pulse" style="color: var(--bs-body-bg);margin-left: 20px;margin-right: 20px;font-family: Abel, sans-serif;font-weight: bold;margin-top: 5px;padding-right: 10px;padding-left: 10px;height: 100%;">
    		<span style="background-color: rgb(43, 47, 50);">My Bids/Favorites</span>
    	</label>
    	<label class="form-label" data-bss-hover-animate="pulse" style="color: var(--bs-body-bg);margin-left: 20px;margin-right: 20px;font-family: Abel, sans-serif;font-weight: bold;font-size: 16px;margin-top: 5px;">
    		<span style="background-color: rgb(43, 47, 50);">Community Auctions</span>
    	</label>
    </div>
    

<form action="AddAuctionServlet" method="post">

	
   <div class="d-flex d-lg-flex justify-content-center align-items-center justify-content-lg-center align-items-lg-start" style="height: 100%;background: linear-gradient(black 0%, rgb(134,134,134) 100%, white 100%);">
        <div class="d-flex d-lg-flex justify-content-center align-items-center justify-content-sm-center justify-content-lg-center align-items-lg-start" style="padding-top: 20px;height: 100%;width: 85%;background: var(--bs-body-bg);">
            <div class="d-lg-flex justify-content-lg-start align-items-lg-start" style="width: 80%;margin-right: 0px0px;margin-left: 0px;height: 100%;">
            
            
            
                <div style="width: 100%;height: 100%;">
                    <div class="m-auto w-lg-75 w-xl-50" style="width: 90%;">
                        <div class="d-flex d-lg-flex justify-content-center align-items-center justify-content-lg-center align-items-lg-center" style="width: 100%;height: 400px;border: 1px solid #dee2e6;border-radius: 2px;">
                            <div style="width: 50px;height: 50px;"><img width="100" height="80" style="width: 100%;height: 100%;border-radius: 2px;border: 1px none #dee2e6 ;" src="Images/add.png" name="imagePath"></div>
                        </div>
                        <div>
                            <div class="form-group mb-3">
                            	<label class="form-label text-secondary">Year</label>
                            	<input class="d-flex" required=""  name="carYear" type="number" min="1900" max="2025" step="1" style="width: 100%;height: 38px;border-radius: 6px;border: 1px solid #dee2e6 ;">
                            </div>
                            <div class="form-group mb-3">
                            	<label class="form-label text-secondary">Make</label>
                            	<input class="d-flex" type="text" required=""  name="carMake" style="width: 100%;height: 38px;border-radius: 6px;border: 1px solid #dee2e6 ;">
                            </div>
                            <div class="form-group mb-3">
                            	<label class="form-label text-secondary">Model</label>
                            	<input class="d-flex" type="text" required="" name="carModel" style="width: 100%;height: 38px;border-radius: 6px;border: 1px solid #dee2e6 ;">
                            </div>
                        </div>
                    </div>
                </div>
                <div style="width: 100%;height: 100%;padding-right: 20px;padding-left: 20px;">
                    <div class="form-group mb-3">
                    	<label class="form-label text-secondary">Color</label>
                    	<input class="d-flex" type="text" required=""  name="carColor" style="width: 100%;height: 38px;border-radius: 6px;border: 1px solid #dee2e6 ;">
                    </div>
                    <div class="form-group mb-3">
                    	<label class="form-label text-secondary">Car Price</label>
                    	<input class="d-flex" type="number" min="1" step="1" name="carPrice" style="width: 100%;height: 38px;border-radius: 6px;border: 1px solid #dee2e6 ;">
                    </div>
                    <div class="form-group mb-3">
                    	<label class="form-label text-secondary">Starting Bid</label>
                    	<input class="d-flex" type="number" min="1" step="1" name="startingBid" style="width: 100%;height: 38px;border-radius: 6px;border: 1px solid #dee2e6 ;">
                    </div>
                    <div class="form-group mb-3">
                    	<label class="form-label text-secondary">Expiration Date</label>
                    	<input class="d-flex" type="datetime-local" required="" name="expirationDate" style="width: 100%;height: 38px;border-radius: 6px;border: 1px solid #dee2e6 ;">
                    </div>
                    <div class="form-group mb-3">
                    	<label class="form-label text-secondary">Car Description</label>
                    	<textarea name="carDescription" style="width: 100%;height: 150px;border-radius: 6px;border: 1px solid #dee2e6;"></textarea>
                    </div>
                    	
                    	<button class="btn btn-info mt-2" style="color: var(--bs-body-bg);background: linear-gradient(-91deg, rgb(103,170,255) -5%, var(--bs-btn-bg) 100%), rgb(103,170,247);width: 100%;">Submit</button>
                    	<a class="btn btn-info mt-2" role="button" href="userPage.jsp" style="color: var(--bs-body-bg);background: linear-gradient(-91deg, rgb(255,103,103) -5%, #ff0000 100%), rgb(103,170,247);width: 100%;border-color: #ff0000;">Cancel</a>
                </div>
                
                
                
                
                
                
            </div>
        </div>
    </div>


</form>


 <jsp:include page="footer.jsp" />

<script src="assets/JavaScript/userPageErrorTest.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>          
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=65f1335b449f2a64b6d20ec9" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="assets/js/webflow.js" type="text/javascript"></script>
</body>
</html>