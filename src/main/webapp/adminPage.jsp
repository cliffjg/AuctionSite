<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import="userpackage.Auction" %>
<%@ page import="userpackage.Users" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
</head>
<body>

	<!-- <form action="MessagePage" method="post"> -->
		<div>This is the admin page</div>
		
				<%String userEmail = (String) session.getAttribute("userEmail");; %>
				
				<p><%=userEmail%></p>
				
				
				
				<div style="font-size: 2em;">UsersList</div>
				
				<!-- <form action="MessagePage" method="post"> -->
				
				<%
					
					session.setAttribute("admin", userEmail);
       				ArrayList<Users> usersArrayList = new ArrayList<Users>();
        			usersArrayList = (ArrayList<Users>) session.getAttribute("usersArrayList");
        			

   					for(int i = 0; i < usersArrayList.size(); i++) {
                	Users users = new Users();
               	 	users = usersArrayList.get(i);
               	 	
               	 	
            	%>
            	
            	<%-- <%session.setAttribute("userEmail", users.getUserEmail());%> --%>
            	
            	<div style="padding: 10px;">
            		<button >Open</button>
            			<span style="padding-left: 10px;" ><%=users.getUserEmail() %></span>
            			<span><%=users.getPassword() %></span>
            			<span><%=users.getAddress() %></span>
            			<span><%=users.getPhoneNumber() %></span>
            			
            			<!-- <form action="MessagePage" method="post"> -->
            				<button class="auction" id="<%=users.getUserEmail()%>">Message</button>
            			<!-- </form> -->
            			
            			<br>
            			
            			
            	
            	</div>
            		
            	
            	<%} %>
         <!-- </form>  -->  	
         
     <script>
     
  
     document.querySelectorAll('.auction').forEach(function(element) {
         element.addEventListener('click', function(event) {
            
             var userEmail = event.currentTarget.id;
             
            
             console.log("Clicked userEmail: " + userEmail);
             
             
       
             var form = document.createElement('form');
             form.setAttribute('method', 'post');
             form.setAttribute('action', 'MessagePage');

             
             var input = document.createElement('input');
             input.setAttribute('type', 'hidden');
             input.setAttribute('name', 'userEmail');
             input.setAttribute('value', userEmail);
             
         
             form.appendChild(input);
         
             document.body.appendChild(form);

             form.submit();
             
             
           
         });
     });
     
     
     </script>    
         
         
         
            	
</body>
</html>