package userpackage;

public class Message {
	
	String userEmail;
	String sendMessage;
	String receiveMessage;
	String messageDateTIme;
	
	public Message() {
		
	}
	
	public Message(String userEmail, String sendMessage, String receiveMessage, String messageDateTime) {
	
		this.userEmail = userEmail;
		this.sendMessage = sendMessage;
		this.receiveMessage = receiveMessage;
		this.messageDateTIme = messageDateTime;
		
	}
	
	public String getUserEmail() {
		return userEmail;	
	}
	
	public String getSendMessage() {
		return sendMessage;	
	}
	
	public String getReceiveMessage() {
		return receiveMessage;	
	}
	
	public String getMessageDateTime() {
		return messageDateTIme;	
	}

}
