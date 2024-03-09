<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">



<head>
	<meta charset="UTF-8">
	<title>BuyMe</title>
	<link rel="stylesheet" href="style.css"></link>
</head>




<body class="content">

	<%//////////////////////SITE LOGO//////////////////////////////////////////%>	
	<div class="left-section">
		<h1 class="site-tag" style="font-family: sans-serif;margin-left: 10px;" >
			<span style="color: rgb(231, 0, 0);padding: 0px;font-style: italic;">B</span>
            <span style="color: blue;padding: 0px;font-style: italic;margin-left: -10px;">u</span>
            <span style="color: rgb(235, 235, 96);font-style: italic;margin-left: -10px;">y</span>
            <span style="color: green;font-style: italic;margin-left: -10px;">M</span>
           	<span style="color: rgb(231, 0, 0);font-style: italic;margin-left: -10px;">e</span>
                    
       </h1>
    </div>


		<%/*/////////////////////BOX THAT HOLDS INPUT <-to-> LOGIN BUTTON//////////////////////////////////////////*/%>
		<div class="box">
			<div class="login-section">
				<h2 class="login-font">Log in</h2>
			</div>

			<div class="input-section">

				
				<%/*/////////////////////* FORM */////////////////////////////////////////*/%>	
				<form action = "Login" method = "post">
				
				
				
					<%/*/////////////////////USER EMAIL INPUT/////////////////////////////////////////*/%>	
					<div style="padding-bottom: 10px;">
	 
					  
					 	<input id="userEmail" name="userEmail" class="input-box" type="email"
							placeholder="Email" style="padding-top: 5px; padding-bottom: 5px;" ></input> 
					 
					</div>
				
				
				
				
					<%/*/////////////////////USER PASSWORD INPUT/////////////////////////////////////////*/%>	
					<div style="padding-bottom: 10px;">
				
				
						<input name="pass" class="password-box" type="password"
							placeholder="Password" style="padding-top: 5px; padding-bottom: 5px;" ></input>
				
					</div>
				


					<%/*/////////////////////REMEMBER ME/FORGOT PASSWORD CHECKBOX/////////////////////////////////////////*/%>	
					<div style="text-align: center">
						<input type="checkbox" class="remember-me-box">Remember me</input>
						<p id="forgot-password-button" class="forgot-password-button">Forgot password?</p>
					</div>



					<%/*/////////////////////LOGIN BUTTON/////////////////////////////////////////*/%>				
					<button  id="login-button"   class="login-button">Log in</button>
				
				
				
					<%/*/////////////////////ERROR MESSAGE/////////////////////////////////////////*/%>		
					<div id="incorrect-email-password" name="incorrect-email-password"
						style="visibility: hidden; color: red; padding-top: 5px;">*Email and Password are incorrect!</div>

			
				</form>
				

			</div>
			

		</div>




	<%/*/////////////////////SIGN UP/CREATE ACCOUNT /////////////////////////////////////////*/%>		
	<div class="signup-box">
		<p>
			Don't have an Account? 
			<span  class="signup"  id="createAccount" name="createAccount">Signup today.</span>
		</p>   
	</div>
	
	

	<script src="login.js" charset="utf-8"></script>

</body>
</html>