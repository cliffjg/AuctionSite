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
			/* ArrayList<Message> auctionMessage = (ArrayList<Message>)session.getAttribute("auctionMessage"); */
			ArrayList<Message> auctionMessage = (ArrayList<Message>)session.getAttribute("auctionMessage");
		%>
		
		
	

	<jsp:include page="header.jsp" />
	<jsp:include page="tabBar.jsp" />
	

	



	<div style="width: 100%; margin-left: 30px; margin-top: 30px;">
		<p>Previous messages about auction: </p>
		
 		<%
 			String destinationEmail = (String)session.getAttribute("destinationEmail");
 			System.out.println("AuctionMessage Size: "+auctionMessage.size());
			for(int i = 0; i < auctionMessage.size(); i++) {
        	Message m = new Message();
       	 	m = auctionMessage.get(i);
       	%>
 	 

 			<%
 				if(m.getSendMessage() != null){
 			%>
 					<p><%=m.getUserEmail() %>: <%=m.getSendMessage()%></p>
 			
 			<%
 				} 			
 			%>
 			

 	
 		<%
		 
			} 
		  
		%> 
		
	</div>
		
		
		<form action="ReplySellerServlet" method="post">
		
			<div style="width: 100%; height: 300px; margin-left: 30px; margin-top: 30px;">
				<p>Conversation ID: <%=auctionMessage.get(0).getConversationID()%></p>
				<p>Auction ID: <%=auctionMessage.get(0).getAuctionID()%></p>
				<p>From: <%=users.get(0).getUserEmail()%></p>
				<p >To: <%=destinationEmail%></p>
				<p>Type your message:</p>
				<input name="message" type="text">
			
				<button type="submit">Send</button>
		
			</div>

		 
		</form>

 <jsp:include page="footer.jsp" />

<script src="assets/JavaScript/userPageErrorTest.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>          
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=65f1335b449f2a64b6d20ec9" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!--   <script src="assets/js/webflow.js" type="text/javascript"></script> -->
</body>
</html>