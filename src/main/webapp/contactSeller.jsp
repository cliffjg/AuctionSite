<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import="userpackage.Model.Auction" %>
<%@ page import="userpackage.Model.Message" %>
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
    <title>AuctionUp Contact Seller</title>
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

		<% 
			ArrayList<Users> users = (ArrayList<Users>)session.getAttribute("users");
		
		%>
	

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
   
	
	

	<form action="ContactSellerServlet" method="post">
	
		<%String sellerEmail = (String)session.getAttribute("sellerEmail");%>
		<%Auction auction = (Auction) session.getAttribute("auction");  %>
		<%ArrayList<Message> auctionMessage = (ArrayList<Message>)session.getAttribute("auctionMessage"); %>
		
		
		<%session.setAttribute("users", users); %>
		
		<%session.setAttribute("sellerEmail", sellerEmail); %>
		
		<div style="width: 100%; height: 300px; margin-left: 30px; margin-top: 30px;">
			<p>Auction ID: <%=auction.getAuctionId() %></p>
			<p>From: <%=users.get(0).getUserEmail()%></p>
			<p >To: <%=sellerEmail%></p>
			<p>Type your message:</p>
			<input name="message" type="text">
			<button>Send</button>
		
		</div>
		
		<%--  <p><%=auctionMessage.get(0).toString()%></p> --%>
		
		
		<div style="width: 100%; margin-left: 30px; margin-top: 30px;">
					<p>Previous messages about auction: </p>
		
 		<%
			for(int i = 0; i < auctionMessage.size(); i++) {
        	Message m = new Message();
       	 	m = auctionMessage.get(i);
       	%>
 	 

			<p><%=m.getUserEmail() %>: <%=m.getSendMessage()%></p>
 

 			<%-- <%
 				if(m.getSendMessage() != null){
 			%>
 					<p><%=m.getUserEmail() %>: <%=m.getSendMessage()%></p>
 			
 			<%
 				} 			
 			%>
 			
 			<%
 				if(m.getReceiveMessage() != null){
 			%>
 					<p><%=m.getDestinationEmail()%>: <%=m.getReceiveMessage()%></p>
 			
 			<%
 				} 			
 			%> --%>
 	
 	
 		<%
		 
			} 
		  
		%> 
		
		</div>
		
		

 			
 			
 			
 
 <%-- 
       	 	<p>AuctionID: <%=m.getAuctionID() %></p>
       	 	<p>User Email: <%=m.getUserEmail() %></p>
       	 	<p>Send Message: <%=m.getSendMessage()%></p>
       	 	<p>Destination Email: <%=m.getDestinationEmail()%></p>
       	 	<p>Receive Message: <%=m.getReceiveMessage()%></p>
       	 	<p>Message Date and Time: <%=m.getMessageDateTime()%></p>
       	 	<p>Profile Picture: <%=m.getProfilePicture()%></p>
       	 	<br><p></p>

	 --%>	
	
		<%-- <%
		 
			} 
		  
		%>  --%>
		 
		
		 
		
	</form>
	

 <jsp:include page="footer.jsp" />

<script src="assets/JavaScript/userPageErrorTest.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>          
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=65f1335b449f2a64b6d20ec9" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="assets/js/webflow.js" type="text/javascript"></script>
</body>
</html>