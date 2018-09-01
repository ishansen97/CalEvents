/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Feedback;
import util.DBConnection;

/**
 *
 * @author Shashi Perera
 */

public class FeedbackServiceImp implements IFeedbackService{
    
   
	
	private static Connection con;
	private static PreparedStatement preparedStatement;
	
        
        @Override
	public String updateFeedback(String fid,Feedback f) {
					
			if(fid != null)
			{
				
				//String username = f.getUsername();
				String email = f.getEmail();
				String subject = f.getSubject();
				String comments = f.getComments();
				String userID = f.getUserID();
				
					
				
				try
				{
					con = DBConnection.createConnection();
                                    String sql="Update feedback set fid=?,email=?,subject=?,comments=?,userID=?  where fid="+fid;

				preparedStatement = con.prepareStatement(sql);
				preparedStatement.setString(1, fid);
				//preparedStatement.setString(, username);
				preparedStatement.setString(2, email);
				preparedStatement.setString(3, subject);
				preparedStatement.setString(4, comments);
				preparedStatement.setString(5, userID);
				
				
				preparedStatement.executeUpdate();				
				
			} catch (SQLException e) {
					e.getMessage();
				} finally {
			
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
		return fid;
	}

        @Override
	public boolean deleteFeedback(String fid) {
		
		if (fid != null && !fid.isEmpty()) {
			
                Connection con = null;
		PreparedStatement preparedStatement = null;
			try{ 
				con = DBConnection.createConnection();
				String sql1="DELETE FROM feedback WHERE fid="+fid;
				
				preparedStatement = con.prepareStatement(sql1);
				
			
				int result = preparedStatement.executeUpdate();	
                                if (result > 0)
                                    return true;
                                else
                                    return false;
				
			} catch (SQLException e) {
					e.getMessage();
                                        return false;
				} /*finally {
			
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (con != null) {
						con.close();
					}
				} catch (SQLException e) {
					 e.getMessage();
				}*/
			//}
		}
                else
                    return false;
	}



	@Override
	public boolean insertFeedback(Feedback f) {
		
                Connection con = null;
		PreparedStatement preparedStatement = null;
                
		String username = f.getUsername();
		String email = f.getEmail();
		String subject = f.getSubject();
		String comments = f.getComments();
		String userID = f.getUserID();
		
		

		
		try
		{
			con = DBConnection.createConnection();
			String q ="insert into feedback(email,subject,comments,userID) values (?,?,?,?)";
			
			preparedStatement = con.prepareStatement(q);
			//preparedStatement.setString(,username);
			preparedStatement.setString(1,email);
			preparedStatement.setString(2,subject);
			preparedStatement.setString(3,comments);
			preparedStatement.setString(4,userID);
			
			
                   int result = preparedStatement.executeUpdate();
                   if (result > 0)
                       return true;
                   else
                       return false;
                   
		}
			catch(SQLException e)
			{ 
                            return false;
			}
			 /*finally {
		
				 try {
					 if (preparedStatement != null) {
						 preparedStatement.close();
					 }
					 	if (con != null) {
					 		con.close();
					 	}
				 } catch (SQLException e) {
				 e.getMessage();
				 }*/
				 
				
		//}
	
	
	}
}
