package userpackage.Model;


public class Message {
	

	
	String auctionID;
	String userEmail;
	String sendMessage;
	String destinationEmail;
	String receiveMessage;
	String messageDateTIme;
	String profilePicture;
	
	
	public Message() {
		
	}
	
	public Message(String userEmail, String sendMessage, String receiveMessage, String messageDateTime) {
	
		this.userEmail = userEmail;
		this.sendMessage = sendMessage;
		this.receiveMessage = receiveMessage;
		this.messageDateTIme = messageDateTime;
		
	}
	
	public Message(String auctionID, String userEmail, String sendMessage, String destinationEmail, String receiveMessage, String messageDateTime, String profilePicture) {
		
		this.auctionID = auctionID;
		this.userEmail = userEmail;
		this.sendMessage = sendMessage;
		this.destinationEmail = destinationEmail;
		this.receiveMessage = receiveMessage;
		this.messageDateTIme = messageDateTime;
		this.profilePicture = profilePicture;
		
	}
	
	public String getAuctionID() {
		return auctionID;
	}
	
	public String getUserEmail() {
		return userEmail;	
	}
	
	public String getSendMessage() {
		return sendMessage;	
	}
	
	public String getDestinationEmail() {
		return destinationEmail;
	}
	
	public String getReceiveMessage() {
		return receiveMessage;	
	}
	
	public String getMessageDateTime() {
		return messageDateTIme;	
	}
	
	public String getProfilePicture() {
		return profilePicture;
	}

	@Override
	public String toString() {
		return "Message [auctionID=" + auctionID + ", userEmail=" + userEmail + ", sendMessage=" + sendMessage
				+ ", destinationEmail=" + destinationEmail + ", receiveMessage=" + receiveMessage + ", messageDateTIme="
				+ messageDateTIme + ", profilePicture=" + profilePicture + "]\n";
	}
	
	
	
	
	
	

}


//public class Message {
//	
//	String userEmail;
//	String sendMessage;
//	String receiveMessage;
//	String messageDateTIme;
//	
//	public Message() {
//		
//	}
//	
//	public Message(String userEmail, String sendMessage, String receiveMessage, String messageDateTime) {
//	
//		this.userEmail = userEmail;
//		this.sendMessage = sendMessage;
//		this.receiveMessage = receiveMessage;
//		this.messageDateTIme = messageDateTime;
//		
//	}
//	
//	public String getUserEmail() {
//		return userEmail;	
//	}
//	
//	public String getSendMessage() {
//		return sendMessage;	
//	}
//	
//	public String getReceiveMessage() {
//		return receiveMessage;	
//	}
//	
//	public String getMessageDateTime() {
//		return messageDateTIme;	
//	}
//
//}
