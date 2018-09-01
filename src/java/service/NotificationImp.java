/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Notification;

import util.DBConnection;

/**
 *
 * @author Shashi Perera
 */
public class NotificationImp implements INotificationService{
    
   
	
        @Override
	public String updateNotification(String nid,Notification n) {
					
			if(nid != null)
			{
				
				
				String notify = n.getNotify();
				//String userID = n.getUserID();
				
					Connection con = null;
                                        PreparedStatement preparedStatement = null;

				
				try
				{
					con = DBConnection.createConnection();
			
					String sql="update notification set notify=?,nid=?,userID=? where nid='"+nid+"'";
					preparedStatement = con.prepareStatement(sql);
					
					preparedStatement.setString(1, notify);
					preparedStatement.setString(2, nid);
                                       // preparedStatement.setString(2, userID);

					
											
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

		return nid;
	}	


        @Override
	public boolean deleteNotification(String nid) {
		
		if (nid != null && !nid.isEmpty()) {
			
                Connection con = null;
		PreparedStatement preparedStatement = null;
			try{ 
				con = DBConnection.createConnection();
				String sql1="DELETE FROM notification WHERE nid="+nid;
				
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
	public boolean insertNotification(Notification n) {
		
                Connection con = null;
		PreparedStatement preparedStatement = null;
                
		
		String notify = n.getNotify();
		String userID = n.getUserID();
		
		

		
		try
		{
			con = DBConnection.createConnection();
			String q ="insert into notification(notify,userID) values (?,?)";
			
			preparedStatement = con.prepareStatement(q);
			preparedStatement.setString(1,notify);
			preparedStatement.setString(2,userID);
			
			
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
