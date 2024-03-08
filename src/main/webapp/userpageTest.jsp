<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import="userpackage.Auction" %>



<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="UTF-8">
        <title>BuyMe</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        
	</head>

    <body  style="padding-bottom: 400px;">
    
		<div>
              	<button>
              		Hello 
              		
              		<%String userEmail = session.getAttribute("userEmail").toString(); %>
              		
              		
   					<%=userEmail%>
   				</button>
   				
   				<!-- <a href="login.jsp" onclick="logout()">Logout</a> -->
   				
   				<button  id="logout" onclick="logout()">Log out</button>
   				
   				<form id="myForm" action = "MessagePage" method = "post">
   				
   				<button  id="message" >Message</button>
   				
   				</form>
   				
   			</div>
        
          
          <form id="myForm" action = "UserPage" method = "post">
          
          
   			<div style="font-size: 2em">My Auctions</div>
   			
   			
   			<div>
   			
   			
   			   <div class= "grid-item" style= "
            			margin-top: 30px; 
            			display: grid; 
            			grid-template-columns: 1fr 1fr 1fr;
            			column-gap: 20px;
            			row-gap: 40px;
            		
            		" >

   				
   				<%

       				ArrayList<Auction> myAuction = new ArrayList<Auction>();
        			myAuction = (ArrayList<Auction>) session.getAttribute("myAuction");
        			
    			%>
   				
   				
   				<% 
   					for(int i = 0; i < myAuction.size(); i++) {
                	Auction auction = new Auction();
               	 	auction = myAuction.get(i);
               	 	
               	 	

            	%>
            

                		
                		<!-- <div  onclick="location.href='productPage.jsp'" style= "background-color:lightblue; height: 400px;"> -->
                		<div class="auction" id="<%=auction.getAuctionId()%>">

                			<% if(auction.getImagePath() == null){ %>
                				<img src="Images/AwaitingPhoto.jpeg"  style="height: 250px; width: 100%;">
                			
                			<% }else{%>
                				<img src=".<%=auction.getImagePath()%>"  style="height: 250px; width: 100%;">
                			
                			<% } %>
                		

                			
                			<%-- <br><%=auction.getAuctionId()%>
            				<br><%=auction.getUserEmail()%>
                			<br><%=auction.getCarImage()%> --%>
                			<br>Car: <%=auction.getCarYear()%>
               				<%=auction.getCarMake()%>
                			<%=auction.getCarModel()%>
                			<br>Color: <%=auction.getCarColor()%>
                			
                			
                			<%if(auction.getCurrentBid() != null){ %>
                			
                				<br>Current Bid: $<%=auction.getCurrentBid()%>
                				
                			
                			<% }else{ %>
                			
                				<br>Current Bid: $<%=auction.getStartingBid()%>
                				
                			<% } %>
                			
                			
                			<%-- <br>Current Bid: $<%=auction.getStartingBid()%> --%>
                			<%-- <br>$<%=auction.getCarPrice()%> --%>
                			<%-- <br><%=auction.getStartDate()%>
                			<br><%=auction.getExpirationDate()%> --%>
                			<br><%=auction.getCarDescription()%>
                			<%-- <br><%=auction.getImagePath()%> --%>
                			<%-- <br><%=auction.getCalculatedExpirationDate()%> --%>
                			<%-- <br><%=auction.getCalculatedExpirationDate()%> --%>
                			<div><%=auction.getCalculatedExpirationDate()%></div>
                			
                			
                			
                			 Countdown time: <span id="countdown<%=auction.getAuctionId()%>" style="color: red;"></span>
                			
                			
                			
                			<% session.setAttribute("userEmail", userEmail );%>
                			

                			
 </div>
                		
<!--  </a> --> 

 <script src="userPage.js"></script>
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
            
             <div> </div>
  
   				
   			
   			</div>
   			
   			
   			
   			<div style="font-size: 2em">My Bids</div> 
   			
   			<div class= "grid-item" style= "
            			margin-top: 30px; 
            			display: grid; 
            			grid-template-columns: 1fr 1fr 1fr;
            			column-gap: 20px;
            			row-gap: 40px;
            			background-color: lightpink;
            			
            		
            		" >
            		
            		
            		
            		
            </div>
   			
   			
   			
   			
   			
   			<div style="font-size: 2em; background-color: lightpink;">Community Auctions</div>
   			
   			   			
   			<div class= "grid-item" style= "
            			margin-top: 30px; 
            			display: grid; 
            			grid-template-columns: 1fr 1fr 1fr;
            			column-gap: 20px;
            			row-gap: 40px;
            			background-color: lightpink;
            			
            		
            		" >
            		

   				
   				<%

       				ArrayList<Auction> communityAuction = new ArrayList<Auction>();
   					communityAuction = (ArrayList<Auction>) session.getAttribute("communityAuction");
    			%>
   				
   				
   				<% 
   					for(int i = 0; i < communityAuction.size(); i++) {
                	Auction auction = new Auction();
               	 	auction = communityAuction.get(i);
               	 	
               	 	if(!auction.getUserEmail().equals(userEmail)){

            	%>
            

            		
            		
            			
                		 <div class="auction" id="<%=auction.getAuctionId()%>">

                			<% if(auction.getImagePath() == null){ %>
                				<img src="Images/AwaitingPhoto.jpeg"  style="height: 250px; width: 100%;">
                			
                			<% }else{%>
                				<img src=".<%=auction.getImagePath()%>"  style="height: 250px; width: 100%;">
                			
                			<% } %>


                			<%-- <br><%=auction.getAuctionId()%>
            				<br><%=auction.getUserEmail()%>
                			<br><%=auction.getCarImage()%> --%>
                			<br>Car: <%=auction.getCarYear()%>
               				<%=auction.getCarMake()%>
                			<%=auction.getCarModel()%>
                			<br>Color: <%=auction.getCarColor()%>
                			
                			<%if(auction.getCurrentBid() != null){ %>
                			
                				<br>Current Bid: $<%=auction.getCurrentBid()%>
                				
                			
                			<% }else{ %>
                			
                				<br>Current Bid: $<%=auction.getStartingBid()%>
                				
                			<% } %>
                			
                			
                			<%-- <br>$<%=auction.getCarPrice()%> --%>
                			<%-- <br><%=auction.getStartDate()%>
                			<br><%=auction.getExpirationDate()%> --%>
                			<br><%=auction.getCarDescription()%>
                			<%-- <br><%=auction.getImagePath()%> --%>
                			<br><%=auction.getCalculatedExpirationDate()%>
                			<%-- <br><%=setInterval(auction.getCalculatedExpirationDate(),1000)%> --%>
                			
                			<br>Countdown time: <span id="countdown<%=auction.getAuctionId()%>" style="color: red;"></span>
                			<% session.setAttribute("userEmail", userEmail );%>
                			
							
						 
							
                		
                		</div>
                		
                		
                		
          <script >
          
          // Set the end time for the countdown
          var endTime<%=auction.getAuctionId()%> = new Date('<%=auction.getExpirationDate()%>').getTime();

          // Start the countdown
          startCountdown("<%=auction.getAuctionId()%>", endTime<%=auction.getAuctionId()%>);
    
    
		</script>
                		
                		
                		
                		
                		
                		
                		
                		

            		<%
            		
               	 		}
           	 		}
            		%>
            
            
 			 </div>
            		
   				
                    
                    
         </form>
            
            
                    
         <script src="userPage.js"></script>
                  
       
    </body>
</html>



 