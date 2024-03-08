<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import="userpackage.Message" %>
<%@ page import="userpackage.Users" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>


</head>
<body style="background-color: #d9d9d9">

	 <form id="myForm" action = "MessagePage" method = "post">
	 
	 		<div id="messagebox" style="border: solid;  height: 500px; width: 400px; overflow: auto; padding: 10px;">

	 			<!-- <div style="background-color: #DCF8C6; float: right; padding: 5px;">Hello</div>
	 			
	 			

	 			<div style="background-color: #EAEAEA; float: left; padding: 5px;">Hello</div> -->
	 			
	 			<!-- <div style="padding: 5px; background-color: #DCF8C6; float: right; padding: 10px; padding-left: 90%; box-sizing: border-box;">Hello</div> -->
	 			
	 			
	 			<%
	 			
	 				 String userEmail = (String)session.getAttribute("userEmail");
	 				session.setAttribute("userEmail", userEmail);
	 				
	 				System.out.println("\n\nWhat is going on in this: " + userEmail);
	 				

       				ArrayList<Message> messageArrayList = new ArrayList<Message>();
        			messageArrayList = (ArrayList<Message>) session.getAttribute("messageArrayList");

   					for(int i = 0; i < messageArrayList.size(); i++) {
                	Message message = new Message();
               	 	message = messageArrayList.get(i);
               	 	
               	 	if(message.getSendMessage() == null){


            	%>
            	
            			<div  style="padding: 10px;">
	 			
	 				<div style="padding-left: 200px; ">
	 					<div style="word-wrap: break-word; border: solid; padding:5px; border-radius: 10px; background-color: #DCF8C6; padding-left: 10px;"> <%=message.getReceiveMessage() %></div>
	 					<div style="font-size: 10px; padding:2px; padding-left: 10px;">Sent: <%=message.getMessageDateTime() %></div>
	 				
	 				</div>
	 				<!-- <div style="word-wrap: break-word; padding-left: 200px; border: solid;">Hello my name is Michael Jackson and i want to change my password</div> -->
	 			
	 			</div>
            	
            		
            	
            	<% 
            		} else{
            			
            			
            	%>
            	
            	
            					<div  style="padding: 10px;">
	 			
	 						<div style="padding-right: 200px; ">
	 							<div style="word-wrap: break-word; border: solid; padding:5px; border-radius: 10px; background-color: #EAEAEA; padding-left: 10px;"><%=message.getSendMessage() %></div>
	 							<div style="font-size: 10px; padding:2px; padding-left: 10px;">Received: <%=message.getMessageDateTime() %></div>
	 				
	 						</div>	
	 			
	 					</div>		
            			
            			
            			
            			
            	<% 		
            		}
               	 	
               	 	
               	 	
               	 	
               	 	
               	 	
               	 	}
               	 %>
	 			
	 			
	 <!-- 			<div  style="padding: 10px;">
	 			
	 				<div style="padding-left: 200px; ">
	 					<div style="word-wrap: break-word; border: solid; padding:5px; border-radius: 10px; background-color: #DCF8C6; padding-left: 10px;">Hello my name is Michael Jackson and i want to change my password</div>
	 					<div style="font-size: 10px; padding:2px; padding-left: 10px;">Sent: 03/04/2024 @ 19:14</div>
	 				
	 				</div>
	 				<div style="word-wrap: break-word; padding-left: 200px; border: solid;">Hello my name is Michael Jackson and i want to change my password</div>
	 			
	 			</div>
	 			
	 			
	 				 			
	 			<div  style="padding: 10px;">
	 			
	 				<div style="padding-right: 200px; ">
	 					<div style="word-wrap: break-word; border: solid; padding:5px; border-radius: 10px; background-color: #EAEAEA;; padding-left: 10px;">Hello my name is Steven and i can help change your password. Give me a moment so i can verify your identity</div>
	 					<div style="font-size: 10px; padding:2px; padding-left: 10px;">Received: 03/04/2024 @ 19:14</div>
	 				</div>
	 				<div style="word-wrap: break-word; padding-left: 200px; border: solid;">Hello my name is Michael Jackson and i want to change my password</div>
	 			
	 			</div>
	 			
	 				 			
	 			<div  style="padding: 10px;">
	 			
	 				<div style="padding-left: 200px; ">
	 					<div style="word-wrap: break-word; border: solid; padding:5px; border-radius: 10px; background-color: #DCF8C6; padding-left: 10px;">Thank you.</div>
	 					<div style="font-size: 10px; padding:2px; padding-left: 10px;">Sent: 03/04/2024 @ 19:14</div>
	 				</div>
	 				<div style="word-wrap: break-word; padding-left: 200px; border: solid;">Hello my name is Michael Jackson and i want to change my password</div>
	 			
	 			</div>
	 			
	 				 			
	 			<div  style="padding: 10px;">
	 			
	 				<div style="padding-right: 200px; ">
	 					<div style="word-wrap: break-word; border: solid; padding:5px; border-radius: 10px; background-color: #EAEAEA;; padding-left: 10px;">What is your address?</div>
	 					<div style="font-size: 10px; padding:2px; padding-left: 10px;">Received: 03/04/2024 @ 19:14</div>
	 				</div>
	 				<div style="word-wrap: break-word; padding-left: 200px; border: solid;">Hello my name is Michael Jackson and i want to change my password</div>
	 			
	 			</div>
	 			 -->
	 	
	 		</div>
	 		
	 		
	 		<script type="text/javascript">
	 				var container = document.getElementById('messagebox');
	 	    		container.scrollTop = container.scrollHeight;
	 	    </script>
	 		
	 		
	 		<div style="padding-top: 10px;">
	 		
	 			<input name = "message" placeholder="Enter message here!" style="width: 350px;"></input>
	 			<button>Submit</button>
	 		
	 		</div>
	 		
	 		<div style="padding: 20px;">
	 			<button>Check for new Messages</button>
	 		
	 		</div>
	 		
	 		<div style="padding-left: 50px;">
	 			<button>Leave the chat</button>
	 		
	 		</div>
	 		
	 		
	 		
	 		
	</form>
	
	<div style="padding-left: 50px;">
	 			<button onclick="goBack()" >Back to Admin Page</button>
	 		
	 		</div>
	
		
	<script>
		
		function goBack(){
			window.location.href = "adminPage.jsp";
		}
	
	</script>

</body>
</html>

