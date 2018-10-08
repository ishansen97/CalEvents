package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.Customer;
import util.DBConnection;

public class CustomerServiceImp implements ICustomerService {

	
	@Override
	public void customerRegister(Customer register) {
		
		//String userID = Register.ge
		String name = register.getFullName();
		String address=register.getAddress();
		String contact_number=register.getContactNumber(); 
		String email=register.getEmail();
		//String userType=register.getUserType();
		//String userName=register.getUserName();
		String password=register.getPassword();
		
		Connection con = null;
		PreparedStatement preparedStatement = null;
	
	try
	{
		con = DBConnection.createConnection();
		String query ="insert into customer(cus_id,name,address,contact_number,email,password) values (NULL,?,?,?,?,?)";
		
		preparedStatement = con.prepareStatement(query);

		preparedStatement.setString(1,name);
		preparedStatement.setString(2,address);
		preparedStatement.setString(3,contact_number);
		preparedStatement.setString(4,email);
		//preparedStatement.setString(5,userType);
		//preparedStatement.setString(6,userName);
		preparedStatement.setString(5,password);
		
		
		preparedStatement.executeUpdate();
		
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			
		}finally {
			
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				 e.getMessage();
			}
		}
	
		
		
}
        
        
     
	@Override
	public boolean loginCheck( String pass, String email) {
		
		
			String sql =" select *  from customer where password=? AND email=? "; 
			
			Connection con = null;

			try
			{
				con = DBConnection.createConnection();
		
				PreparedStatement st = con.prepareStatement(sql);
				//st.setString(1, uname);
				st.setString(1, pass);
				st.setString(2, email);
				
				ResultSet rs  = st.executeQuery();
				
			if(rs.next())
			{
				
                                
				System.out.println();
				return true;
			}
			
			}catch(Exception e){
				e.printStackTrace();
			}
			return false;
		
		
	}


	@Override
	public String GetID( String pass, String email) {
		
		
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		String id = null ;
		try
		{
			con = DBConnection.createConnection();	
			statement=con.createStatement();
			String sql1 =" select cus_id  from customer where password='"+pass+"'"; 
			
			resultSet = statement.executeQuery(sql1);
			while(resultSet.next()) {
				id = resultSet.getString("cus_id");
			}
		
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return id;
	}


	@Override
	public String updateProfile(String user, Customer c) {
		
		Connection con = null;
		PreparedStatement statement = null;

		
		if(user != null) {
			
			String name = c.getFullName();
			String  address = c.getAddress();
			String contact_number = c.getContactNumber();
			String email = c.getEmail();
			
			
			try {
				
				con = DBConnection.createConnection();
				String sq = "update customer set cus_id=?, name=?,address=?,contact_number=?,email=? where cus_id="+user;
			
				statement = con.prepareStatement(sq);
				statement.setString(1, user);
				statement.setString(2, name);
				statement.setString(3, address);
				statement.setString(4, contact_number);
				statement.setString(5, email);
				
				statement.executeUpdate();
			
			
			}			
			
		 catch (SQLException e) {
			e.getMessage();
		} finally {
	
		try {
			if (statement != null) {
				statement.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			 e.getMessage();
		}
		}
	}

		return user;
	}
        
        
}

