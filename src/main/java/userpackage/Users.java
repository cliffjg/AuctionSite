package userpackage;

public class Users {
	
	String userEmail;
	String password;
	String name;
	String address;
	String phoneNumber;
	
	public Users() {
		
		
	}
	
	
	public Users(String userEmail, String password, String name, String address, String phoneNumber) {
		this.userEmail = userEmail;
		this.password = password;
		this.address = address;
		this.phoneNumber = phoneNumber;
	}
	
	public String getUserEmail() {
		return userEmail;
	}
	
	public String getPassword() {
		return password;
	}
	
	public String getAddress() {
		return address;
	}
	
	public String getPhoneNumber() {
		return phoneNumber;
	}

}
