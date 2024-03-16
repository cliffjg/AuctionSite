
document.querySelectorAll('.auction').forEach(function(element) {
	element.addEventListener('click', function(event) {
	
	// Get the ID of the clicked auction
	var auctionId = event.currentTarget.id;
            
	
	console.log("Clicked auction ID: " + auctionId);
            
            
	// Creating form for submission
	var form = document.createElement('form');
	form.setAttribute('method', 'post');
	form.setAttribute('action', 'UserPage');

	// Create an input element to hold the auction ID
	var input = document.createElement('input');
	input.setAttribute('type', 'hidden');
	input.setAttribute('name', 'auctionID');
	input.setAttribute('value', auctionId);
            


	// Add the input element to the form
	form.appendChild(input);
	

	// Append the form to the document body
	document.body.appendChild(form);

	// Submit the form
	form.submit();
            
            
          
	});
});
    

    
function startCountdown(auctionId, endTime) {
    
    // Update the countdown every second
	var countdown = setInterval(function() {
        // Get the current time
		var now = new Date().getTime();
        
        // Calculate the time remaining
        var distance = endTime - now;
        
        // Calculate days, hours, minutes, and seconds
        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);
        
        // Display the countdown
        document.getElementById("countdown" + auctionId).innerHTML = days + "d " + hours + "h "
        + minutes + "m " + seconds + "s ";
        
       // document.getElementById("countdown" + auctionId).style.color = red;
        
        // If the countdown is over, display a message
        if (distance < 0) {
            clearInterval(countdown);
            document.getElementById("countdown" + auctionId).innerHTML = "EXPIRED";
        }
    }, 1000);
}

   
document.getElementById("logout").onclick = function(){
	window.location.href = "login.jsp";
	   
};  

    
    
    
function logout() {
	history.replaceState(null, null, location.href);
	
	window.onpopstate = function () {
		history.go(1);
	};
}
    
    
function submitForm(data) {
	
	console.log("Data to submit:", data);
	// Set the value of the hidden input field
	document.getElementById("dataField").value = data;
        	    
	// Submit the form
	document.getElementById("myForm").submit();
	
}
        	


function off() {
	
	//set the overflow to visible when user presses cancel button
	document.body.style.overflow = 'visible';
	
	//clear the carDescription textarea input field
	var elements = document.getElementById("carDescription").value= "";
	
	//Need to error check this
	//document.getElementById("imagePath").value= "";
	
	//clear all text input fields in addAuction overlay
	elements = document.getElementsByTagName("input");
	for (var i=0; i < elements.length; i++) {
		if (elements[i].type == "text") {
    		elements[i].value = "";
  		}
  	
  	
	}
	
	document.getElementById("overlay").style.display = "none";
}
   							
function on() {
	document.body.style.overflow = 'hidden';
	document.getElementById("overlay").style.display = "block";
	
}


    