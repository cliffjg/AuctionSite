<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import="userpackage.Model.Message" %>
<%@ page import="userpackage.Model.Users" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AuctionUp Message Admin</title>
<link rel="icon" type="image/png" href="Images/auction.png">


</head>
<body style="background-color: #d9d9d9">

	<form id="backToUserPageServletForm" action = "BackToUserPageServlet" method = "post">
        	<a  onclick="document.getElementById('backToUserPageServletForm').submit();" style="cursor: pointer; width 200px; height: 50px; border: solid 1px; color black;">

        		<span style="color: #404040;">Go Back Home</span>
        	</a>
        	
        </form>

	<%String userEmail = (String)session.getAttribute("userEmail"); %>
	
	
	<p>You are speaking with admin@gmail.com</p>


	 <form id="myForm" action = "UserMessageServlet" method = "post">
	 
	 		<div id="messagebox" style="border: solid;  height: 500px; width: 400px; overflow: auto; padding: 10px;">


	 			
	 			<%
	 				session.setAttribute("userEmail", userEmail);

       				ArrayList<Message> messageArrayList = new ArrayList<Message>();
        			messageArrayList = (ArrayList<Message>) session.getAttribute("messageArrayList");

   					for(int i = 0; i < messageArrayList.size(); i++) {
                	Message message = new Message();
               	 	message = messageArrayList.get(i);
               	 	
               	 
               	 	
					
   					if(message.getSendMessage() != null && message.getSendMessage().equals("----------User left the chat----------") ||
   								message.getSendMessage() != null && message.getSendMessage().equals("----------User started the chat----------")
   								){  
                 %>	
                   	 	<div style="text-align: center;  padding-bottom: 2px;"><%=message.getSendMessage()%></div>
    	 			 	<div style="text-align: center;  font-size: 10px;">Logged: <%=message.getMessageDateTime() %></div>
                   	 	
                 <%	
                   	 	
       				}else  if(message.getSendMessage() == null && message.getReceiveMessage().equals("----------Admin left the chat----------") ||
       						message.getSendMessage() == null && message.getReceiveMessage().equals("----------Admin started the chat----------")
       						){
                 %>	
                   	 	<div style="text-align: center;  padding-bottom: 2px;"><%=message.getReceiveMessage()%></div>
    	 			 	<div style="text-align: center;  font-size: 10px;">Logged: <%=message.getMessageDateTime() %></div>
                   	 	
                 <%	
                   	 	
       				}else  if(message.getSendMessage() == null){


            	%>
            	
            			<div  style="padding: 10px;">
	 			
	 						<div style="padding-right: 200px; ">
	 							<div style="word-wrap: break-word; border: solid; padding:5px; border-radius: 10px; background-color: #EAEAEA; padding-left: 10px;"><%=message.getReceiveMessage() %></div>
	 							<div style="font-size: 10px; padding:2px; padding-left: 10px;">Received: <%=message.getMessageDateTime() %></div>
	 				
	 						</div>	
	 			
	 					</div>	
            		
            	
            	<% 
            		} else {
            			
            			
            	%>
            	
            	<div  style="padding: 10px;">
	 			
	 				<div style="padding-left: 200px; ">
	 					<div style="word-wrap: break-word; border: solid; padding:5px; border-radius: 10px; background-color: #DCF8C6; padding-left: 10px;"> <%=message.getSendMessage() %></div>
	 					<div style="font-size: 10px; padding:2px; padding-left: 10px;">Sent: <%=message.getMessageDateTime() %></div>
	 				
	 				</div>

	 			</div>
	     			
            			
            	<% 		
            		} /* for the else statement */
 	 	
               	 	
               	 	} /* for loop */
               	 %>
	 			
	 			

	 	
	 		</div>
	 		
	 		<script type="text/javascript">
	 				/* Message scroll is set to the bottom for newer messages*/
	 				var container = document.getElementById('messagebox');
	 	    		container.scrollTop = container.scrollHeight;
	 	    </script>
	 		
	 		
	 		<div style="padding-top: 10px;">
	 		
	 			<input name = "message" placeholder="Enter message here!" style="width: 350px;"></input>
	 			<button>Submit</button>
	 		
	 		</div>
	 		
	 		<div style="padding: 50px;">
	 			<button>Check for new Messages</button>
	 			<button name="userStartChat" id="userStartChat" value="userStartChat">Start chat</button>
	 			<button name="userLeaveChat" id="userLeaveChat" value="leaveChat">End this chat</button>
	 		
	 		</div>


	</form>
	
	
	        
	
	

</body>
</html>

