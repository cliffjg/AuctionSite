


document.getElementById("forgot-password-button").onclick = function () {
    location.href = "forgot.html";
};

//document.getElementById("login-button").onclick = function () {
//    location.href = "userpage.jsp";
//};

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

//function signupPage(){
//	window.location.assign("signup.jsp");
//}

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

// document.getElementById("email").onclick = function () {
//     location.href = "login.html";
// };

// var incorrectEmailPassword = document.getElementById("incorrect-email-password");

// function incorrect(){
// 	incorrectEmailPassword.style.visibility = "visible";
// }

function on() {
  	document.getElementById("overlay").style.display = "block";

      var mysql = require('mysql');

      var con = mysql.createConnection({
      host: "127.0.0.1",
      user: "root",
      password: "00000000",
      database: "mydb"
      });
  
      con.connect(function(err) {
          if (err) throw err;
          console.log("Connected!");
          var sql = "INSERT INTO customers (name, address) VALUES ('John', '1 dodo lane')";
          con.query(sql, function (err, result) {
          if (err) throw err;
          console.log("1 record inserted");
          });
      });

}
            
function off() {
   document.getElementById("overlay").style.display = "none";
}

function on1() {
    document.getElementById("overlay1").style.display = "block";
}
          
function off1() {
 document.getElementById("overlay1").style.display = "none";
}


function on2() {
    document.getElementById("overlay2").style.display = "block";
}
          
function off2() {
 document.getElementById("overlay2").style.display = "none";
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

function addImage() {
	
    //document.getElementById("selectedImage").style.display = "block";
    ////document.getElementById("addImageButton").style.visibility = "hidden";
    //document.getElementById("addImageButton").style.display = "none";
}


function addNewUser() {


    

}

          
//function off2() {
// document.getElementById("overlay2").style.display = "none";
//}


