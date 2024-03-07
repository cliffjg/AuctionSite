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

		<div>This is the admin page</div>
		
				<div style="font-size: 2em;">UsersList</div>
				<%

       				ArrayList<Users> usersArrayList = new ArrayList<Users>();
        			usersArrayList = (ArrayList<Users>) session.getAttribute("usersArrayList");
        			

   					for(int i = 0; i < usersArrayList.size(); i++) {
                	Users users = new Users();
               	 	users = usersArrayList.get(i);

            	%>
            	
            	<div style="padding: 10px;">
            		<button >Open</button>
            			<span style="padding-left: 10px;" ><%=users.getUserEmail() %></span>
            			<span><%=users.getPassword() %></span>
            			<span><%=users.getAddress() %></span>
            			<span><%=users.getPhoneNumber() %></span>
            			<button >Message</button>
            			<br>
            	
            	</div>
            		
            	
            	<%} %>
            	
            	

</body>
</html>