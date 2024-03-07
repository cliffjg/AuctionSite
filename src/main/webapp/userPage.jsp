<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="UTF-8">
        <title>BuyMe</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="headerstyle.css">
      
    </head>

    <body  style="padding-bottom: 400px">
    

            <div class="header">

                <div class="left-section">
                    <h1 class="site-tag" style="font-family: sans-serif;margin-left: 10px;" >
                        <span style="color: rgb(229, 50, 56);padding: 0px;font-style: italic;">B</span>
                        <span style="color: rgb(0, 100, 210);padding: 0px;font-style: italic;margin-left: -10px;">u</span>
                        <span style="color: rgb(245, 175, 2);font-style: italic;margin-left: -10px;">y</span>
                        <span style="color: rgb(134, 184, 23);font-style: italic;margin-left: -10px;">M</span>
                        <span style="color: rgb(229, 50, 56);font-style: italic;margin-left: -10px;">e</span>             
                    </h1>
            </div>

                <div class="center-section" onclick="on1()">
                    <input  class="search-bar" type="text" placeholder="Search..." style="padding-left: 10px;font-size:16;">
                    <button class="search-button">
                        <img src="Images/searchIcon.png" style="height: 20px;margin-top: 2px;">
                    </button>
                </div>

                <div class="right-section" style="font-family: sans-serif;">
                    <button onclick="on2()" class="add-button">&#43;</button>
                    
                    
                    
                    
                    
                    
                     <form action = "Userpage" method = "post">
                     
                    
                    
                    <div><button>Hello <%String userEmail = session.getAttribute("email").toString(); %>
   					<%=userEmail%></button></div>
                    
                    
                     </form>
                    
                  
                    
                    
                    
                    
                    
                    
                    <span class="user-login-name">
                   
                    
                    <%userEmail = session.getAttribute("email").toString(); %>
   					<%=userEmail%>
                    
                    
                    
                        <div class="dropdown" style="margin-left: -10px;">
                            <ul style="list-style-type:none;text-align: left;">
                                <li href="#" style="color: black;margin-left: -40px;" onclick="on()">Update Profile</li>
                                <li href="#" style="color: black;margin-left: -40px;padding-top: 10px;padding-bottom: 10px;">Link 2</li>
                                <li href="#" style="color: black;margin-left: -40px;">Create Ticket</li>
                            </ul>
                           
                        </div>
                    </span>
                    
                    
                        
                    	<button onclick="logOutScreen()" class="logout-button" id="log-out" name="log-out" href="Logout">Logout</button>
                 
                    
                </div>

            </div>

         
                
        <div style="margin-top: 20px;height: 45px;display: flex;border: 1px solid;border-color: rgb(176, 176, 176);border-top:none;border-right: none;border-left: none;">
            
          
            	
            	<div  onclick="switchToMyList()"  id="mylistings" class="listings-highlight" style="border: 2px solid;border-color: rgb(176, 176, 176);border-bottom: none;border-top-left-radius: 5px;border-top-right-radius: 5px;">
                	<input type="radio" id="myTrigger" name="myTrigger" value="My Listings" style="display: none" />
    					<label style="height: 40px;width: 150px; text-align: center; " for="myTrigger"><a style="color:black;text-decoration: none;position:relative; top:35%;" href="">My Listings</a></label>
    				
            	</div>
            	
    		
    	
            <div onclick="switchToCommunityList()" id="communitylistings" class="listings-highlight" style="background: #e4e4e4;border: 2px solid;border-color: rgb(176, 176, 176);border-bottom: none;border-top-left-radius: 5px;border-top-right-radius: 5px;">
                           
    		<input type="radio" id="myTrigger" name="myTrigger" style="display: none" />
   				<label for="myTrigger"><a style="color:black;text-decoration: none;position:relative; top:35%;" href="">Community Listings</a></label>
        
                <div style="display:block;">
                    
                </div> 
            </div>
        </div>  
        
        

        

        
        
        <script src="app.js" charset="utf-8"></script>
       
    </body>
</html>



 
