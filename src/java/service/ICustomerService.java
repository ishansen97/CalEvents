package service;

import model.Customer;

public interface ICustomerService {

	public void customerRegister(Customer register);
        
       // public String updateRegister(String user,Customer c);
        
	
	public boolean loginCheck(String pass,String email);
	
	public String GetID(String pass,String email);
	
	public String updateProfile(String user,Customer c);
        
       
	
}
