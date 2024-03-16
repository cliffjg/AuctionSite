


document.getElementById("forgot-password-button").onclick = function () {
    location.href = "forgot.html";
};


document.getElementById("login-on-top").onclick = function () {
    location.href = "login.html";
};

function logInScreen() {
    window.location.assign("login.jsp")
}

function logOutScreen() {
   window.location.assign("logout.html")
//    location.href = "logout.html";
}



document.getElementById("createAccount").onclick = function () {
            window.location.href = "createAccount.jsp";
        };
        
document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("createAccount").onclick = function () {
        window.location.href = "createAccount.jsp";
    };
});

document.getElementById("signup").onclick = function () {
        window.location.href = "signup.jsp";
    };


function userPage() {
    var x = document.getElementById("email").value
    console.log(x);
     if(x != "") {
        window.location.assign("userpage.jsp");
        console.log("Im in here");
     }else{
        console.log("Error")
        var incorrectEmailPassword = document.getElementById("incorrect-email-password");
        
            incorrectEmailPassword.style.visibility = "visible";
        
     }

 }






function switchToMyList(){

		
		document.getElementById("community-listings").style.display = 'none';
		document.getElementById("my-listings").style.display = 'grid';
		//document.getElementById("mylistings").style.background = '#e4e4e4';
		document.getElementById("communitylistings").style.background = 'white';
	
}

function switchToCommunityList(){

		
		document.getElementById("my-listings").style.display = 'none';
		document.getElementById("community-listings").style.display = 'grid';
		//document.getElementById("communitylistings").style.background = '#e4e4e4';
		document.getElementById("mylistings").style.background = 'white';
	
}



function tabPages() {
  var myListings = document.getElementById("my-listings");
  var communityListings = document.getElementById("community-listings");
  
  if (myListings.style.display === "none") {
    
    communityListings.style.display = "none";
    myListings.style.display = "grid";
  } else {
    myListings.style.display = "none";
    communityListings.style.display = "grid";
  }
}



