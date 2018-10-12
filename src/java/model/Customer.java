package model;

public class Customer {
	
	private String name;
	private String address;
	private String contact_number;
	private String email;
	//private String userType; 
	//private String userName;
	private String password;
	
	
	public String getFullName() {
		return name;
	}
	public void setFullName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContactNumber() {
		return contact_number;
	}
	public void setContactNumber(String contact_number) {
		this.contact_number = contact_number;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	

}
