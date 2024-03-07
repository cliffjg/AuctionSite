<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import="userpackage.Auction" %>
    
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>This is the product page</div>
	
	<%-- <% String auctionID= request.getParameter("id");  %>
	<% session.setAttribute("auctionID", auctionID);  %>
	
	<div>The auctionID = <%=auctionID %></div> --%>
	
	 <form action = "BackToUserPage" method = "post">
	
		<button onclick="location.href='userpageTest.jsp'">Home</button>
	 </form>

	 <form action = "ProductPage" method = "post">
	 
	 	<%-- <% String auctionID= request.getParameter("id");  %> --%>
	 	<% String auctionID= request.getParameter("auctionID");  %>
	 	 <% auctionID= (String)session.getAttribute("auctionID");  %>
	 	 <%String userEmail = (String)session.getAttribute("userEmail"); %>
	 	 <%
				String bidderEmail = userEmail;
	 	 		session.setAttribute("bidderEmail", bidderEmail);
	 	 		session.setAttribute("auctionID", auctionID);
	 	 	
	 	 
		%>
	 	
		<%-- <% session.setAttribute("auctionID", auctionID);  %>
		<% request.setAttribute("auctionID", auctionID);%> --%>
	
	<div>
		
		The auctionID = <%=auctionID %>
		<br>The userEmail = <%=userEmail %>
	
	</div>
	 
		 <div>
		 	

		 	
		 	
		 	
		 	
		 	
		 	
        			
		 	<%Auction auction = new Auction(); %>
		 	
		 	<%auction = (Auction) session.getAttribute("auction"); %>
		 	
		 	<%-- <%auction = (Auction)session.getParameter("auction"); %> --%>
		 	<%-- <%auction = (Auction)session.getParameter("auction"); %> --%>
		 	
		 	<div>
		 	
		 	
		 					<% if(auction.getImagePath() == null){ %>
                				<img src="Images/AwaitingPhoto.jpeg"  style="height: 400px; width: 50%;">
                			
                			<% }else{%>
                				<img src=".<%=auction.getImagePath()%>"  style="height: 400px; width: 50%;">
                			
                			<% } %>
		 	
		 	
		 					<br>Car: <%=auction.getCarYear()%>
               				<%=auction.getCarMake()%>
                			<%=auction.getCarModel()%>
                			<br>Color: <%=auction.getCarColor()%>
                			<br>Starting Bid: $<%=auction.getStartingBid()%>
                			
                			<%-- 
                			<br>$<%=auction.getCarPrice()%>
                			<br><%=auction.getStartDate()%>
                			<br><%=auction.getExpirationDate()%>
                			<br><%=auction.getCarDescription()%>
                			 --%>
                			
                			<% if(auction.currentBid != null){ %>
                				<br>Current Bid: <span style="color: green;">$<%=auction.getCurrentBid()%></span>
                				<br>Bidder Email: <%=auction.getBidderEmail()%>
                			
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
		 	  				<% 
		 	  				
		 	  					if(!userEmail.equals(auction.getUserEmail())){
		 	  				
		 	  				%>
		 	  						
		 	  					
		 	  					
		 	  					
		 	  						
		 	  						<br><div>Bid: 
		 	  						<input type="number" id="bidderPrice" name="bidderPrice"></input>
		 	  						<button>
		 	  							Submit Bid
		 	  						</button>
		 	  						
		 	  					
		 	  					
		 	  		</div>
		 	  				
		 	  				
		 	  				<% 
		 	  					}
		 	  				%>
							
		 	
		 	</div>
		 	
		 </div>
		 
		 				

		 				
		 				
		 				<div>Bid History</div>
		 				
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
	 
	 
	 </form>




</body>
</html>