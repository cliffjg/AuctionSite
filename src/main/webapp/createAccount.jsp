<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<title>BuyMe</title>
<link rel="stylesheet" href="style.css"></link>
<!-- <script src="app.js" charset="utf-8" defer></script> -->

<!-- <script src="LoginCreateForget.js" charset="utf-8" defer></script> -->

</head>

<body class="content">

		    <div style="width: 475px; height: 64px; display: flex; justify-content: left;align-items: center;margin-top: 50px; border: 1px solid; color: black;">
                <div style="width: 60px; height: 60px; ">
                    <img src="Images/auction.png" width="100%" height="100%" >
                </div>
                <div style="width: 100px; height: 64px; font-size: 20px;padding-left: 5px;display: flex; justify-content: center;align-items: center;font-family: sans-serif;" >
                    AuctionUp
                </div>
                <div style="width: 300px; height: 64px; display: flex; justify-content: right;margin-top: 50px;">
            		<span style="font-weight: 100; font-size: 12px; padding-left: 100px;">Already
						have an account? <span name="login-on-top" id="login-on-top" class="login-on-top"
							style="color: blue;" >Log in.</span>
					</span>
            	</div>
               
                
            </div>
            

		<div class="box">
			<div class="login-section">
				<h2 class="login-font">Create an account</h2>
			</div>

			<div class="input-section">
			
				<form action="CreateAccount" method="post" >

				<div style="padding-bottom: 10px;">
					<input name="first-name" class="input-box" type="text"
						placeholder="First name"
						style="padding-top: 5px; padding-bottom: 5px;"></input>
				</div>

				<div style="padding-bottom: 10px;">
					<input name="last-name" class="input-box" type="text"
						placeholder="Last name"
						style="padding-top: 5px; padding-bottom: 5px;"></input>
				</div>

				<div style="padding-bottom: 10px;">
					<input name="email" class="input-box" type="email"
						placeholder="Email (*Required Field)"
						style="padding-top: 5px; padding-bottom: 5px;"></input>
				</div>

				<div style="padding-bottom: 10px;">
					<input name="pass" class="password-box" type="password"
						placeholder="Password (*Required Field)"
						style="padding-top: 5px; padding-bottom: 5px;"></input>
				</div>

				<button class="login-button" onclick="on()">Submit</button>


				<%String checkInput = (String)request.getAttribute("checkInput"); %>
				
				<%if(checkInput != null){ %>
				
				 <%if(checkInput.equals("error")){ %>
					<div id="require-email-password" name="require-email-password"
					style="visibility: visible; color: red; padding-top: 5px;">*Email
					is already in database!</div>
					
					<div id="require-email-password" name="require-email-password"
					style="visibility: visible; color: red; padding-top: 5px;">*Please
					try again!</div>
				<%-- <% } %> --%> 

				

				<%}else if(checkInput.equals("success")){ %>
					<div id="incorrect-email-password" name="incorrect-email-password"
					style="visibility: visible; color: green; padding-top: 5px;">✓
					Successfully created!</div>

				<% }else if(checkInput.equals("errorUserEmailPassword")) {%> 
				
				
						<div id="require-email-password" name="require-email-password"
					style="visibility: visible; color: red; padding-top: 5px;">*Both
					Email and Password are required!</div>
				<% } %> 
				
				<% } %> 
				
					

				
				</form>


			</div>

		</div>


	<div class="signup-box" style="font-size: 15px;">
		<p>By signing up, you agree to our terms of service.</p>
	</div>



	<script src="createAccount.js" defer></script>
	<!-- <script src="app.js" charset="utf-8"></script> -->


</body>
</html>