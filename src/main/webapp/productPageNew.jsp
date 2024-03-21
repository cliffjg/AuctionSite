<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import="userpackage.Auction" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>AuctionUp</title>
   <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Abel&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Actor&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Advent+Pro&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Akatab&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Albert+Sans&amp;display=swap">
   <!--  <link rel="stylesheet" href="assets/css/Navbar-Right-Links-icons.css"> -->
   <!--  <link rel="stylesheet" href="assets/css/styles.css"> -->
    <!-- <link rel="stylesheet" href="assets/css/untitled.css"> -->
    <link rel="stylesheet" href="styles.css">
     
     
     <style>
  /* Styling for the dropdown menu */
  .dropdown {
    position: relative;
    display: inline-block;
    
  }
  
  .dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    right: -50px;
    
    
  }
  
  .dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
  }
  
  .dropdown-content a:hover {
    background-color: #f1f1f1;
  }
  
  .dropdown:hover .dropdown-content {
    display: block;
    
  }
</style>
     
     
     
</head>

<body >

	<%
		String userEmail = session.getAttribute("userEmail").toString(); 
	
		NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance();
		
		String carPrice = null; 
	%>

    

    <!--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->
    
   
    
      <nav> 
      
        <div style="width: 100%; height: 64px; display: flex;">
            
             
           <form style="width: 100%;" action = "BackToUserPage" method = "post">
            <!-- <div type ="submit" onclick="location.href='userPageNew.jsp'" style="width: 20%; height: 64px; display: flex; justify-content: center;align-items: center;cursor: pointer;">
                 -->
                 <!-- <div type ="submit" onclick="location.href='userPageNew.jsp'" style="width: 20%; height: 64px; display: flex; justify-content: center;align-items: center;cursor: pointer;">
                 -->
         
         		<button   style="width: 20%; height: 64px; display: flex; justify-content: center;align-items: center;cursor: pointer;border: none;background: transparent;">
                
                <div style="width: 20%; height: 30px; ">
                    <img src="Images/auction.png" width="100%" height="100%">
                </div>
                <div style="width: 40%; height: 30px; font-size: 20px;padding-left: 5px;">
                    AuctionUp
                </div>
                
  
                
            </button>
           </form>
            

            <div style="width: 80%; height: 64px;  display: flex; justify-content: right;align-items: center;">
            
            
                
                <!-- BEGINNING OF ADD AUCTION ICON/TEXT -->
                <div   style="width: 30px; height: 30px;" >
                    <div style="width: 30px; height: 30px;"onclick="on()" >
                        <img src="Images/plus.png" width="30%" height="30%"  style="float: right;margin-top: 7px;margin-right:3px;cursor:pointer;" onclick="on()" >
                    </div>
                </div>
                <div  style="width: 100px; height: 30px; margin-right: 5px;font-family: sans-serif; color: rgb(89,89,89);cursor: pointer;" onclick="on()" >
                    New Auction
                </div>
                <!-- ENDING OF ADD AUCTION ICON/TEXT -->
	


                <!-- BEGINNING OF MAIL ICON/TEXT -->
                <div style="width: 30px; height: 30px; cursor: pointer;">
                    <div style="width: 30px; height: 30px; ">
                    <form id="myForm" action = "UserMessageServlet" method = "post"> 
                    <input type="hidden" id="dataField" name="data">
                        <img src="assets/img/mail.png" width="40%" height="40%" style="float:right; margin-top: 6px;margin-right:3px;cursor: pointer;" onclick="submitForm('<%=userEmail%>')">
                       </form>
                    </div>
                </div>
                
				<form id="myForm" action = "UserMessageServlet" method = "post"> 
                    <input type="hidden" id="dataField" name="data">
                	<div style="width: 80px; height: 30px; margin-right: 20px;font-family: sans-serif;color: rgb(89,89,89);cursor: pointer;" onclick="submitForm('<%=userEmail%>')">
                    	Messages
                	</div>
                </form>
                <!-- ENDING OF MAIL ICON/TEXT -->
                
                

                <!-- BEGINNING OF USER ICON -->
                <div class="dropdown"style="width: 30px; height: 30px;  margin-right: 70px;">
                    <img src="assets/img/user.png" width="100%" height="100%">
                    <div class="dropdown-content" >
                    	<a><%=userEmail%></a>
    					<a href="#" >Settings</a>
    					<a href="#">Profile</a>
    					<a href="#" id="logout" onclick="logout()" >Logout</a>
  					</div>
                </div>
                <!-- ENDING OF USER ICON -->


            </div>
        </div>
     </nav>
    

   	<script>
   		function submitForm(data) {
   								
   			console.log("Data to submit:", data);
   			// Set the value of the hidden input field
   			document.getElementById("dataField").value = data;
   							        	    
   			// Submit the form
   			document.getElementById("myForm").submit();
		}
   			
   	</script>
    
    
    
    <!-- ///////////////////////////////////BEGINNING OF BLACK SECTION PARTITION////////////////////////////////////////////////////////////////////////////////////////////////-->
    <section style="background: var(--bs-secondary-text-emphasis);--bs-body-color: var(--bs-body-bg);color: var(--bs-body-bg);height: 30px;padding-top: 2px; display: flex;">
    	<!-- <form action = "BackToUserPage" method = "post"> -->
	
			<!-- <em onclick="location.href='userPageNew.jsp'" style="margin-left: 70px;margin-right: 0px;font-family: Abel, sans-serif;cursor: pointer; font-style: normal;">Home&nbsp;</em> -->
	 	
	 	<!-- </form> -->
	 	
	 	<form  action = "BackToUserPage" method = "post"> 
	
			<button  class="dividerSection" style="margin-left: 70px;margin-right: 0px;font-family: Abel, sans-serif;cursor: pointer; font-style: normal;border: none;background: transparent;color: white;">Home&nbsp;</button>
	 	
	 	</form>
    	
    	<div class="dividerSection" style="margin-left: 70px;margin-right: 0px;font-family: Abel, sans-serif;cursor: pointer; font-style: normal;">My Auctions&nbsp;</div>
    	<div class="dividerSection" style="font-family: Abel, sans-serif;margin-left: 40px;cursor: pointer;font-style: normal;">My Bids/Favorites</div>
    	<div class="dividerSection" style="font-family: Abel, sans-serif;font-weight: bold;margin-left: 40px;cursor: pointer;font-style: normal;">Community Auctions</div>
    
    </section>
     <!-- //////////////////////////////////ENDING OF BLACK SECTION PARTITION/////////////////////////////////////////////////////////////////////////////////////////////////-->
    
<!--////////////////////////////////////BEGINNING OF NEW CODE /////////////////////////////////////////////////////////////////////////////////////  -->
<!-- 
	 <form action = "BackToUserPage" method = "post">
	
		<button onclick="location.href='userpageTest.jsp'">Home</button>
	 </form> -->

	 <form action = "ProductPage" method = "post">
	 
	 	<%-- <% String auctionID= request.getParameter("id");  %> --%>
	 	<% String auctionID= request.getParameter("auctionID");  %>
	 	 <% auctionID= (String)session.getAttribute("auctionID");  %>
	 	 <% userEmail = (String)session.getAttribute("userEmail"); %>
	 	 <%
				String bidderEmail = userEmail;
	 	 		session.setAttribute("bidderEmail", bidderEmail);
	 	 		session.setAttribute("auctionID", auctionID);
	 	 	
	 	 
		%>
	 	
		<%-- <% session.setAttribute("auctionID", auctionID);  %>
		<% request.setAttribute("auctionID", auctionID);%> --%>
	
<%-- 	<div>
		
		The auctionID = <%=auctionID %>
		<br>The userEmail = <%=userEmail %>
	
	</div> --%>
	 
		 <div>
		 	

		 	
		 	
		 	
		 	
		 	
		 	
        			
		 	<%Auction auction = new Auction(); %>
		 	
		 	<%auction = (Auction) session.getAttribute("auction"); %>
		 	
		 	<%-- <%auction = (Auction)session.getParameter("auction"); %> --%>
		 	<%-- <%auction = (Auction)session.getParameter("auction"); %> --%>
		 	
		 	<div style="padding-left: 10%;margin-top: 10px; display: flex; ">
		 	
		 				<div style="padding-right: 10px;">
		 					<div style="height: 50px; width: 50px; border: solid 1px; color: black; margin-bottom: 10px;">
		 						<img src="Images/bugatti_other.jpeg"  style="height: 100%; width: 100%;">
		 					</div>
		 					
		 					<div style="height: 50px; width: 50px; border: solid 1px; color: black; margin-bottom: 10px;">
		 						<img src="Images/bugatti_other.jpeg"  style="height: 100%; width: 100%;">
		 					</div>
		 					
		 					<div style="height: 50px; width: 50px; border: solid 1px; color: black; margin-bottom: 10px;">
		 						<img src="Images/bugatti_other.jpeg"  style="height: 100%; width: 100%;">
		 					</div>
		 				
		 				</div>
		 	
		 				<div style="height: 400px; width: 650px; border: 1px solid; color: black;">
		 					<% if(auction.getImagePath() == null){ %>
                				<img src="Images/AwaitingPhoto.jpeg"  style="height: 400px; width: 50%;">
                			
                			<% }else{%>
                				<img src=".<%=auction.getImagePath()%>"  style="height: 100%; width: 100%;">
                			
                			<% } %>
                		</div>	
		 	
		 				<div style="padding-top: 10px; padding-left: 20px;">
		 					<h5 style="font-weight: normal;margin-bottom: 0px;"><span style= "font-weight: bold;">Car: </span><%=auction.getCarYear()%>
               				<%=auction.getCarMake()%>
                			<%=auction.getCarModel()%>
                			</h5>
                			<span style= "font-weight: bold;">Color:</span> <%=auction.getCarColor()%>
                			<br><br><span style= "font-weight: bold;">Seller's Description: </span><br><span style="padding-left: 20px;"><%=auction.getCarDescription()%></span>
                			
                			<% carPrice = currencyFormatter.format(Integer.parseInt(auction.getStartingBid()));%>
                			<br><br><span style= "font-weight: bold;">Starting Bid: </span><%=carPrice%>
                			
                			<%-- 
                			<br>$<%=auction.getCarPrice()%>
                			<br><%=auction.getStartDate()%>
                			<br><%=auction.getExpirationDate()%>
                			<br><%=auction.getCarDescription()%>
                			 --%>
                			
                			<%-- <%carPrice = currencyFormatter.format(Integer.parseInt(auction.getCurrentBid())); %> --%>
                			
                			<% if(auction.currentBid != null){
                				
                				carPrice = currencyFormatter.format(Integer.parseInt(auction.getCurrentBid()));
                				
                			%>
                				<br><span style= "font-weight: bold;">Current Bid: </span><span style="color: green;"><%=carPrice%></span>
                				<br><span style= "font-weight: bold;">Bidder Email: </span><%=auction.getBidderEmail()%>
                			
                			<% }else{%>
                				<br>Current Bid: No current Bids!
                				<br>Bidder Email: No current Bids!
                			
                			<% } %>
                			<%-- <br>Current Bid: $<%=auction.getCurrentBid()%>
                			<br>Bidder Email: <%=auction.getBidderEmail()%> --%>
                			
                			<%-- <br><%=auction.getImagePath()%> --%>
                			<%-- <br><%=auction.getCalculatedExpirationDate()%>
                			<br><%=auction.getCalculatedExpirationDate()%>
                			<div><%=auction.getCalculatedExpirationDate()%></div>
     		 	  --%>           			
     
     				<div >
     					<span style= "font-weight: bold;">Time remaining: </span> <span id="countdown<%=auction.getAuctionId()%>" style="color: red;"></span>
 
     				
     				</div>
                			
 
 
 
  <script src="userPage.js"></script>
 <script >
     
     
     // Set the end time for the countdown
     var endTime<%=auction.getAuctionId()%> = new Date('<%=auction.getExpirationDate()%>').getTime();

     // Start the countdown
     startCountdown("<%=auction.getAuctionId()%>", endTime<%=auction.getAuctionId()%>);
     
     
  
    
</script>               			
                			
                			

		 	  				<% 
		 	  				if(!userEmail.equals(auction.getUserEmail()) && !auction.getCalculatedExpirationDate().contains("-") ){
		 	  				%>
		 	  				
		 	  						<br><div><span style= "font-weight: bold;">Bid: </span>
		 	  								<input type="number" id="bidderPrice" name="bidderPrice" style="border-radius: 6px; border:1px solid"></input>
		 	  								<button style="font-size: 15px; color: rgb(255, 255, 255); border-color: #42b8fe; border-radius: 6px;background: linear-gradient(-163deg, #0ce4fe 18%, #27cffe 44%, #42b8fe 80%, #4daefd 100%), #27cffe;margin-left: 5px;">
		 	  								Submit Bid
		 	  								</button>
		 	  					
		 	  							</div>
		 	  				
		 	  				<%	
		 	  					} 
		 	  				%>
		 	  		</div>		
							
		 	
		 	</div>
		 	
		 </div>
		 
		 				

		 			<div style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
		 				
		 				<div style="margin-top: 10px; "><span style= "font-weight: bold;">Bid History</span></div>
		 				
		 				<%

       						ArrayList<String> bidHistory = new ArrayList<String>();
   							bidHistory = (ArrayList<String>) session.getAttribute("bidHistory");
    					%>
   				
   				
   				
   						<% 
   							if(bidHistory != null){
   								for(int i = bidHistory.size()-1; i >= 0 ; i--) {  
   									/* for(int i = 0; i < bidHistory.size(); i++) {  */
                				
   									if(i == 0){
   										
            			%>
            			
            						<div>Starting bid: $<%=bidHistory.get(i) %></div>
            			
            			<% 	
   									}else if(i == bidHistory.size()-1){
            			%>

            							
            							
            						<div >Current bid: $<%=bidHistory.get(i) %></div>
            						
            						
            	
            			<%
   									}else{
   										
   						%>	
   									<div style="padding-left: 80px;">$<%=bidHistory.get(i) %></div>
   						
   						<% 			
   									}
            						
            					} 
   							}
   						%>
   						
   				</div>			
	 
	 
	 </form>

<!--///////////////////////////////////ENDING OF NEW CODE////////////////////////////////////////////////////////////////////////////////////////////////  -->
   
   
    
   
   
    
    
    
<!--     <footer class="text-center" style="--bs-body-bg: var(--bs-body-color);margin-top: 20px;">
        <div class="container text-muted py-4 py-lg-5" style="--bs-body-bg: var(--bs-body-color);">
            <ul class="list-inline">
                <li class="list-inline-item me-4"><a class="link-secondary" href="#">Careers</a></li>
                <li class="list-inline-item me-4"><a class="link-secondary" href="#">Contact Us</a></li>
                <li class="list-inline-item"><a class="link-secondary" href="#">About Us</a></li>
            </ul>
            <ul class="list-inline">
                <li class="list-inline-item me-4"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-facebook">
                        <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951"></path>
                    </svg></li>
                <li class="list-inline-item me-4"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-twitter">
                        <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15"></path>
                    </svg></li>
                <li class="list-inline-item"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-instagram">
                        <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334"></path>
                    </svg></li>
            </ul>
            <p class="mb-0">Copyright © 2024 AuctionUp</p>
        </div>
    </footer> -->
    
    
    
    
    
    
    
    
    
    
    
    
    
    <!-- BEGINNING OF OVERLAY FOR ADDING AUCTION  -->
     <!-- <div id="overlay" onclick="off()"> -->
     <div id="overlay" >
  		<div id="text">
  		
  		 <form action="AddAuctionServlet" method="post" >
  		<!-- background: rgb(220,220,220); -->
  		
  		 <div style="width: 900px;height: 540px;  background: rgb(220,220,220);">
  		 
  		 		<div style="width:900px; height: 40px; display: flex;align-items: center;justify-content: right;">
  		 			<img onclick="off()" alt="" src="Images/close.png" style="width: 20px; height: 20px; margin-right: 10px; color: gray; ">
  		 		</div>
  		 
  		 		<div class="container" style="width: 950px; height: 500px;display: inline-flex;position: absolute; margin-top:-10px;">
  		 		
  		 		
  		 		
  		 			<div style="box-sizing: border-box;width: 95%;height: 95%;margin: 0px;padding-left: 5px; overflow: hidden;display: inline-flex;">
  		 		
  		 		
  		 					<!-- LEFT SIDE OF POP UP  -->
  		 					
  		 					<div style="box-sizing: border-box;width: 445px; height: 500px;padding-top: 10px; ">
  		 					
  		 						 <div style="box-sizing: border-box;width: 445px; height: 30px;  ">
  		 						 
  		 						 	<div style="font-size: 20px;overflow: hidden;	display: flex; justify-content: center;align-items: center; font-family:Arial, Helvetica, sans-serif;color: rgb(118,120,122);">
  		 						 		Add Auction
  		 						 	</div>
 
  		 						 </div>
  		 						 
  		 						 <div style="height: 300px; width: 445px; box-sizing: border-box;">
  		 						 	<div style="width: 93%; height: 85%; margin-left: 10px; border: 1px solid rgb(151,151,151); border-radius: 6px;background: #FFFFFF;display: flex;justify-content: center;align-items: center;position: relative;">
  		 						 	

  		 						 		<img id="imagePath" alt="" src="Images/add.png" style="width: 50px; height: 50px;position: absolute; z-index: 1;"> 
  		 						 		<input id="imagePath" name="imagePath" type="file" style="height: 100%; width: 100%; opacity: 0; position: absolute;z-index: 2;" onchange="previewImage(event)">
  		 						 
  		 						 		
  		 						 	</div>
  		 						 	
<!--THIS SCRIPT IS FOR CHANGING THE ADD IMAGE ICON TO THE IMAGE SELECTED BY USER  -->  		 						 	
<script>
  		 					
	function previewImage(event) {

		var img = document.getElementById('imagePath');
		console.log("The image: " + img.value);
  		 						  
		// Check if a file was selected
		if (event.target.files && event.target.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
			
  		 	
			//set the size of the image and also the result
			img.style.width = '100%';
			img.style.height = '100%';
			img.src = e.target.result;
  		 						   
		}

		// Read the selected file as a Data URL
		reader.readAsDataURL(event.target.files[0]);
		}
	} 
</script>
  		 						 	
  		 						 		
  		 						 		    
  		 						 	
  		 						 </div>
  		 						 	<div  class="addAuctionLabels" style="margin-top: -20px;" >
                          				Car Description
                      				</div>
  		 						 
  		 						 
  		 						 <div style="height: 145px; width: 445px;  box-sizing: border-box; ">
  		 						 		 <textarea name="carDescription" id="carDescription" cols="30" rows="10" style="box-sizing: border-box; width: 93%;height: 85%; margin: 10px; font-size: 15px;border-radius: 6px;padding-left: 10px;border: 1px solid rgb(151,151,151); resize: none;"> </textarea>          
  		 						  
  		 						 </div>

  		 					</div>
  		 					


  		 					
  		 					<!-- LEFT SIDE OF POP UP  -->
  		 			
  		 		
  		 					<!-- RIGHT SIDE OF POP UP  -->

					<div style="box-sizing: border-box;width: 445px; height: 500px;  ">
					
						 <div style="width: 425px; height: 60px; padding-top: 10px;">
						 	<div  class="addAuctionLabels" >
                          		Year
                      		</div>
                      		<div  style="width: 415px; height: 30px;  margin-top: -25px;">
                      			<input name="carYear" class="addAuctionInputs" type="number" >
                      		</div>
                   		 </div>
                   		 
                   		 
                   		 	 <div style="width: 425px; height: 60px; padding-top: 10px;">
						 	<div  class="addAuctionLabels" >
                          		Make
                      		</div>
                      		<div  style="width: 420px; height: 30px;  margin-top: -25px;">
                      			<!-- <input name="carMake" class="addAuctionInputs" type="text" > -->
                      			<select name="carMake" class="addAuctionInputs" id="year" >
                                    
                                    <option id="make" value="0" disabled selected></option>
                                    <option id="make">Abarth</option>
                                    <option id="make">Acura</option>
                                    <option id="make">Alfa Romeo</option>
                                    <option id="make">Aston Martin</option>
                                    <option id="make">Audi</option>
                                    <option id="make">Bentley</option>
                                    <option id="make">BMW</option>
                                    <option id="make">Bugatti</option>
                                    <option id="make">Buick</option>
                                    <option id="make">Cadillac</option>
                                    <option id="make">Chevrolet</option>
                                    <option id="make">Chrysler</option>
                                    <option id="make">Citroen</option>
                                    <option id="make">Dacia</option>
                                    <option id="make">Dodge</option>
                                    <option id="make">Ferrari</option>
                                    <option id="make">Fiat</option>
                                    <option id="make">Ford</option>
                                    <option id="make">GMC</option>
                                    <option id="make">Honda</option>
                                    <option id="make">Hummer</option>
                                    <option id="make">Hyundai</option>
                                    <option id="make">Infiniti</option>
                                    <option id="make">Isuzu</option>
                                    <option id="make">Jaguar</option>
                                    <option id="make">Jeep</option>
                                    <option id="make">Kia</option>
                                    <option id="make">Lamborghini</option>
                                    <option id="make">Lancia</option>
                                    <option id="make">Land Rover</option>
                                    <option id="make">Lexus</option>
                                    <option id="make">Lincoln</option>
                                    <option id="make">Lotus</option>
                                    <option id="make">Maserati</option>
                                    <option id="make">Mazda</option>
                                    <option id="make">McLaren</option>
                                    <option id="make">Mercedes-Benz</option>
                                    <option id="make">Mercury</option>
                                    <option id="make">Mini</option>
                                    <option id="make">Mitsubishi</option>
                                    <option id="make">Nissan</option>
                                    <option id="make">Opel</option>
                                    <option id="make">Peugeot</option>
                                    <option id="make">Pontiac</option>
                                    <option id="make">Porsche</option>
                                    <option id="make">Ram</option>
                                    <option id="make">Renault</option>
                                    <option id="make">Saab</option>
                                    <option id="make">Saturn</option>
                                    <option id="make">Scion</option>
                                    <option id="make">Seat</option>
                                    <option id="make">Skoda</option>
                                    <option id="make">Smart</option>
                                    <option id="make">SsangYong</option>
                                    <option id="make">Subaru</option>
                                    <option id="make">Suzuki</option>
                                    <option id="make">Tesla</option>
                                    <option id="make">Toyota</option>
                                    <option id="make">Volkswagen</option>
                                    <option id="make">Volvo</option>
                                    <option id="make">Wiesmann</option>
                                    <option id="make">Other</option>
                                    


                                   
                                    
                                </select>
                      		</div>
                   		 </div>
                   		 
                   		 
                   		 
                   		 	<div style="width: 425px; height: 60px; padding-top: 10px;">
						 	<div  class="addAuctionLabels" >
                          		Model
                      		</div>
                      		<div  style="width: 420px; height: 30px;  margin-top: -25px;">
                      			<input name="carModel" class="addAuctionInputs" type="text" >
                      		</div>
                   		 </div>
                   		 
                   		 
                   		 						 <div style="width: 425px; height: 60px; padding-top: 10px; ">
						 	<div  class="addAuctionLabels" >
                          		Color
                      		</div>
                      		<div  style="width: 420px; height: 30px;  margin-top: -25px;">
                      			<input name="carColor" class="addAuctionInputs" type="text" >
                      		</div>
                   		 </div>
                   		 
                   		 
                   		 						 <div style="width: 425px; height: 60px; padding-top: 10px;">
						 	<div  class="addAuctionLabels" >
                          		Starting Bid
                      		</div>
                      		<div  style="width: 420px; height: 30px;  margin-top: -25px;">
                      			<input name="startingBid" class="addAuctionInputs" type="number" >
                      		</div>
                   		 </div>
                   		 
                   		 
                   		 						 <div style="width: 425px; height: 60px; padding-top: 10px;">
						 	<div  class="addAuctionLabels">
                          		Price
                      		</div>
                      		<div  style="width: 420px; height: 30px;  margin-top: -25px;">
                      			<input name="carPrice" class="addAuctionInputs" type="number" >
                      		</div>
                   		 </div>
					
					
					
					
												 <div style="width: 425px; height: 60px; padding-top: 10px;">
						 	<div  class="addAuctionLabels">
                          		Expiration Date (*Required)
                      		</div>
                      		<div  style="width: 420px; height: 30px;  margin-top: -25px;">
                      			<input name="expirationDate" class="addAuctionInputs" type="datetime-local" >
                      		</div>
                   		 </div>
                   		 
                   		 
                   		 
                   		 <div style="width: 425px; height: 60px; padding-top: 10px;">
						 	
                      		<div  style="width: 420px; height: 30px;  margin-top: -20px;">
                      			<!-- <input type="submit" style="width: 420px; height: 30px; font-size: 15;"> -->
                      			<button onclick="location.href='userpageTest.jsp'" style="width: 400px; height: 30px; font-size: 15px; color: rgb(255, 255, 255); border-color: #42b8fe; border-radius: 6px;background: linear-gradient(-163deg, #0ce4fe 18%, #27cffe 44%, #42b8fe 80%, #4daefd 100%), #27cffe;margin-left: 5px;">Submit</button>
                      		</div>
                   		 </div>
			
					</div>						
							<!-- RIGHT SIDE OF POP UP  -->
  		 		
  		 			</div>
	
  		 		</div>

  		</div>
  
  		
  		
  		</form>
  		
  		</div>
	</div>	
	
    
    <!-- ENDING OF OVERLAY FOR ADDING AUCTION  -->
    
    <script src="userPage.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>