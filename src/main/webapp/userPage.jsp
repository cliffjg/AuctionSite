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
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/-Login-form-Page-BS4--Login-form-Page-BS4.css">
    <link rel="stylesheet" href="assets/css/Div-Overlay-Black.css">
    <link rel="stylesheet" href="assets/css/Footer-Dark-Multi-Column-icons.css">
    <link rel="stylesheet" href="assets/css/Signup-page-with-overlay.css">
</head>

<body>

<!--    	<script>
   		function submitForm(data) {
   								
   			console.log("Data to submit:", data);
   			// Set the value of the hidden input field
   			document.getElementById("dataField").value = data;
   							        	    
   			// Submit the form
   			document.getElementById("myForm").submit();
		}
   			
   	</script> -->


	<jsp:include page="header.jsp" />


<%-- 	<%String userEmail = session.getAttribute("userEmail").toString();  --%>
	
	<% ArrayList<Users> users = (ArrayList<Users>)session.getAttribute("users");
		/* ArrayList<Users> auction = (ArrayList<Users>)session.getAttribute("allAuctions"); */
	
		NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance();
		
		String carPrice = null; 
	%>
	

     
     
    <!--////////////////////////////////////////////////////////////////////////////////////////  -->
    
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
   
    <div class="container" style="height: auto;">
    
    <form id="myForm" action = "UserPageServlet" method = "post">
    	<input type="hidden" id="dataField" name="data">
    	
    	
        <div class="row" style="margin-top: 20px;height: 100%;">
        
        	<%

       			ArrayList<Auction> myAuction = new ArrayList<Auction>();
        		/* myAuction = (ArrayList<Auction>) session.getAttribute("communityAuction"); */
        		myAuction = (ArrayList<Auction>) session.getAttribute("allAuctions");
        		
        		
   				for(int i = 0; i < myAuction.size(); i++) {
            	Auction auction = new Auction();
           	 	auction = myAuction.get(i);

            %>
            	
        
        
       
        <div class="col-md-4" style="height: 100%; margin-top: 10px;cursor: pointer;"  onclick="submitForm(<%=auction.getAuctionId()%>)">
        
        	<%-- <div>Auction Id: <%=auction.getAuctionId()%></div> --%>
        	
        	                	<div style="width: 100%;height: 60%;"><img style="width: 100%;height: 250px;" src=".<%=auction.getImagePath()%>"></div>
                	<div style="width: 100%;height: 40%;padding-top: 10px;">
                    	<h5 class="fw-normal">Car: <%=auction.getCarYear()%> <%=auction.getCarMake()%> <%=auction.getCarModel()%></h5>
                    	<span>Color: <%=auction.getCarColor()%><br></span>
                    	<%if(auction.getCurrentBid() != null){ %>
                    		<% carPrice = currencyFormatter.format(Integer.parseInt(auction.getCurrentBid()));%>
                    		
                    		<span>Current Bid:&nbsp;<span style="color: rgb(0, 128, 0);"><%=carPrice%></span></span>
                    	
                    	<% }else{ %>
                				
                			<%String number = auction.getStartingBid(); %>
                				
                			
                			<% carPrice = currencyFormatter.format(Integer.parseInt(auction.getStartingBid()));%> 
                			<span>Current Bid:&nbsp;<span style="color: rgb(0, 128, 0);"><%=carPrice%></span></span>
                			
                		<%} %>	
                		<% session.setAttribute("userEmail", users.get(0).getUserEmail());%>
                		
                		

                    	<span><br>Time Remaining:&nbsp;<span id="countdown<%=auction.getAuctionId()%>" style="color: rgb(255,0,0);"></span></span>
                    	 
						<%if(users.get(0).getUserEmail().equals(auction.bidderEmail)){ %>

	                    	<span><br><span style="color: rgb(0, 128, 0);">Currently Winning!</span></span>
	                    	
	                    <%} %>	
                	</div>
        	
        	
        	

      					
        </div>
            	
            	
                <script src="assets/JavaScript/userPageErrorTest.js"></script>


<script >
     
     
     // Set the end time for the countdown
     var endTime<%=auction.getAuctionId()%> = new Date('<%=auction.getExpirationDate()%>').getTime();

     // Start the countdown
     startCountdown("<%=auction.getAuctionId()%>", endTime<%=auction.getAuctionId()%>);
     
      
   
    
</script>  
               	
       	
            

			<%
   				}
			%>



            

        </div>
    
    
    	
    
    </form>
    
    </div>
    

    
    <!--///////////////////////////////////////////////////////////////////////////////////////////  -->
    
    

     
      <jsp:include page="footer.jsp" />
    
    
    <script src="assets/JavaScript/userPageErrorTest.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>

</body>

</html>