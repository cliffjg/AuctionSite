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
</head>

<body >

	<%String userEmail = session.getAttribute("userEmail").toString(); 
	
		NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance();
		
		String carPrice = null; 
	%>

    

    <!--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->
    
   
    
      <nav> 
        <div style="width: 100%; height: 64px; display: flex;">
            <div style="width: 20%; height: 64px; display: flex; justify-content: center;align-items: center;">
                <div style="width: 12%; height: 30px; ">
                    <img src="Images/auction.png" width="100%" height="100%">
                </div>
                <div style="width: 40%; height: 30px; font-size: 20px;padding-left: 5px;">
                    AuctionUp
                </div>
            </div>

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
                <div style="width: 30px; height: 30px;  margin-right: 70px;">
                    <img src="assets/img/user.png" width="100%" height="100%">
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
    
    
    
    <!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
    <section style="background: var(--bs-secondary-text-emphasis);--bs-body-color: var(--bs-body-bg);color: var(--bs-body-bg);height: 30px;padding-top: 2px;"><em style="margin-left: 70px;margin-right: 0px;font-family: Abel, sans-serif;cursor: pointer; font-style: normal;">My Auctions&nbsp;</em><em style="font-family: Abel, sans-serif;margin-left: 40px;cursor: pointer;font-style: normal;">My Bids/Favorites</em><em style="font-family: Abel, sans-serif;font-weight: bold;margin-left: 40px;cursor: pointer;font-style: normal;">Community Auctions</em><span class="float-end float-lg-end float-xl-end float-xxl-end" style="font-family: Abel, sans-serif;text-align: left;position: static;display: inline;margin-left: 0px;margin-right: 100px; cursor:pointer;font-style: normal;" id="logout" onclick="logout()">Logout</span></section>
    
    

   
   
    
    <div   class="container" style="width: 100%;height: 350px;margin-top: 0px;" >
    
    <form id="myForm" action = "UserPage" method = "post">
    	<input type="hidden" id="dataField" name="data">
    
        <div class="row" style="width: 100%;height: 350px;">
        

 			<%

       			ArrayList<Auction> myAuction = new ArrayList<Auction>();
        		myAuction = (ArrayList<Auction>) session.getAttribute("communityAuction");
        		
   				for(int i = 0; i < myAuction.size(); i++) {
            	Auction auction = new Auction();
           	 	auction = myAuction.get(i);

            %>
            	
            
        <div   style="margin-top: 20px;lex:0 0 auto;width:33.33333333%;" class="auction" id="<%=auction.getAuctionId()%>">
            
            <% if(auction.getImagePath() == null){ %>
                				<!-- <img src="Images/AwaitingPhoto.jpeg"  style="height: 250px; width: 100%;"> -->
                				<div style="width: 100%;height: 60%;"><img width="100" height="80" style="width: 100%;height: 100%;" src="Images/AwaitingPhoto.jpeg"></div>
                			
                			<% }else{%>
                				<%-- <img src=".<%=auction.getImagePath()%>"  style="height: 250px; width: 100%;"> --%>
                				<div style="width: 100%;height: 60%;"><img width="100" height="80" style="width: 100%;height: 100%;" src=".<%=auction.getImagePath()%>"></div>
                			
                			<% } %>
            
               <%--  <div style="width: 100%;height: 60%;"><img width="100" height="80" style="width: 100%;height: 100%;" src=".<%=auction.getImagePath()%>"></div> --%>
                <div style="width: 100%;height: 35%;margin-top: 0px;">
                    <p class="lead" style="width: 100%;margin-bottom: 0px;margin-top: 10px;">Car: <%=auction.getCarYear()%> <%=auction.getCarMake()%> <%=auction.getCarModel()%></p> 
               				
                			
                			
                    <p style="width: 100%;margin-bottom: 0px;">Color: <%=auction.getCarColor()%></p>
                    
                    <%if(auction.getCurrentBid() != null){ %>
                			
                				<% carPrice = currencyFormatter.format(Integer.parseInt(auction.getCurrentBid()));%>
                				<%-- <p style="width: 100%;margin-bottom: 0px;">Current Bid: $<%=auction.getCurrentBid()%></p> --%>
                				<p style="width: 100%;margin-bottom: 0px;">Current Bid: <span style="color: rgb(13, 181, 41);"><%=carPrice%></span></p>
                			
                			<% }else{ %>
                				
                				<%String number = auction.getStartingBid();  System.out.println("NUMBER: " + number);%>
                				
                			
                				<% carPrice = currencyFormatter.format(Integer.parseInt(auction.getStartingBid()));%> 
                				<%-- <p style="width: 100%;margin-bottom: 0px;">Current Bid: $<%=auction.getStartingBid()%></p> --%>
                				<p style="width: 100%;margin-bottom: 0px;">Current Bid: <span style="color: rgb(13, 181, 41);"><%=carPrice%></span></p>
                				
                			<% } %>
                			
                			 <% session.setAttribute("userEmail", userEmail );%>
                    
                    <p style="width: 100%;margin-bottom: 0px;">Time Remaining: <span id="countdown<%=auction.getAuctionId()%>" style="color: red;"></span></p>
                    <p style="width: 100%;">Winning</p>
                </div>
            </div>
            
            <script src="userPage.js"></script>
<script >
     
     
     // Set the end time for the countdown
     var endTime<%=auction.getAuctionId()%> = new Date('<%=auction.getExpirationDate()%>').getTime();

     // Start the countdown
     startCountdown("<%=auction.getAuctionId()%>", endTime<%=auction.getAuctionId()%>);
     
     
  
    
</script> 
            
           <%} %> 
           
          


        </div>
        
       
    </form>  
  
    </div>
     
   
    
    
    
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
  		
  		 <form action="AddAuctionServlet" method="post">
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
  		 						 	<div style="width: 93%; height: 85%; margin-left: 10px; border: 1px solid rgb(151,151,151); border-radius: 6px;background: #FFFFFF;display: flex;justify-content: center;align-items: center;">
  		 						 		<img alt="" src="Images/add.png" style="width: 50px; height: 50px;">
  		 						 		<!-- <input name="imagePath" type="file" style="width: 445px; height: 265px; font-size: 15px; opacity: 0%;  "> -->
  		 						 		
  		 						 	</div>
  		 						 		
  		 						 		    
  		 						 	
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
                      			<input name="carYear" class="addAuctionInputs" type="text" >
                      		</div>
                   		 </div>
                   		 
                   		 
                   		 	 <div style="width: 425px; height: 60px; padding-top: 10px;">
						 	<div  class="addAuctionLabels" >
                          		Make
                      		</div>
                      		<div  style="width: 420px; height: 30px;  margin-top: -25px;">
                      			<input name="carMake" class="addAuctionInputs" type="text" >
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
                      			<input name="startingBid" class="addAuctionInputs" type="text" >
                      		</div>
                   		 </div>
                   		 
                   		 
                   		 						 <div style="width: 425px; height: 60px; padding-top: 10px;">
						 	<div  class="addAuctionLabels">
                          		Price
                      		</div>
                      		<div  style="width: 420px; height: 30px;  margin-top: -25px;">
                      			<input name="carPrice" class="addAuctionInputs" type="text" >
                      		</div>
                   		 </div>
					
					
					
					
												 <div style="width: 425px; height: 60px; padding-top: 10px;">
						 	<div  class="addAuctionLabels">
                          		Expiration Date (*Required)
                      		</div>
                      		<div  style="width: 420px; height: 30px;  margin-top: -25px;">
                      			<input name="expirationDate" class="addAuctionInputs" type="text" >
                      		</div>
                   		 </div>
                   		 
                   		 
                   		 
                   		 <div style="width: 425px; height: 60px; padding-top: 10px;">
						 	
                      		<div  style="width: 420px; height: 30px;  margin-top: -20px;">
                      			<!-- <input type="submit" style="width: 420px; height: 30px; font-size: 15;"> -->
                      			<button style="width: 400px; height: 30px; font-size: 15px; color: rgb(255, 255, 255); border-color: #42b8fe; border-radius: 6px;background: linear-gradient(-163deg, #0ce4fe 18%, #27cffe 44%, #42b8fe 80%, #4daefd 100%), #27cffe;margin-left: 5px;">Submit</button>
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