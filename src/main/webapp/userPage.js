 // Add event listener to all elements with class "auction"
    document.querySelectorAll('.auction').forEach(function(element) {
        element.addEventListener('click', function(event) {
            // Get the ID of the clicked auction
            var auctionId = event.currentTarget.id;
            
            // Now you can use the auctionId as needed, for example:
            console.log("Clicked auction ID: " + auctionId);
            
            
         // Create a form element
            var form = document.createElement('form');
            form.setAttribute('method', 'post');
            form.setAttribute('action', 'UserPage');

            // Create an input element to hold the auction ID
            var input = document.createElement('input');
            input.setAttribute('type', 'hidden');
            input.setAttribute('name', 'auctionID');
            input.setAttribute('value', auctionId);
            
            
            /* var userEmailToSend = document.createElement('input');
            input.setAttribute('type', 'hidden');
           	input.setAttribute('name', 'userEmail');
            input.setAttribute('value', userEmailToSend);  */

            // Add the input element to the form
            form.appendChild(input);
            /* form.apendChild(userEmailToSend); */

            // Append the form to the document body
            document.body.appendChild(form);

            // Submit the form
            form.submit();
            
            
          
        });
    });
    

 /*       
    
            // Set the end time for the countdown
        var endTime<%=auction.getAuctionId()%> = new Date('<%=auction.getExpirationDate()%>').getTime();

        // Update the countdown every second
        var countdown<%=auction.getAuctionId()%> = setInterval(function() {
            // Get the current time
            var now = new Date().getTime();
            
            // Calculate the time remaining
            var distance = endTime<%=auction.getAuctionId()%> - now;
            
            // Calculate days, hours, minutes, and seconds
            var days = Math.floor(distance / (1000 * 60 * 60 * 24));
            var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((distance % (1000 * 60)) / 1000);
            
            // Display the countdown
            document.getElementById("countdown<%=auction.getAuctionId()%>").innerHTML = days + "d " + hours + "h "
            + minutes + "m " + seconds + "s ";
            
            // If the countdown is over, display a message
            if (distance < 0) {
                clearInterval(countdown<%=auction.getAuctionId()%>);
                document.getElementById("countdown<%=auction.getAuctionId()%>").innerHTML = "EXPIRED";
            }
        }, 1000);
    
    
  */  
    
    
    
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
    
 /*document.getElementById("message").onclick = function(){
	//window.location.href = "messagePage.jsp";
	window.location.href = '/MessagPage';
	   
};  */  
    
    