package util;


import java.sql.Connection;
import java.sql.DriverManager;
//import com.mysql.cj.jdbc.*;
import java.sql.Statement;

public class DBConnection {
	public static Connection createConnection() {
		
		Connection con = null;
		String url="jdbc:mysql://localhost:3306/calevents";
		String username = "root";
		String password = "";
		
		try
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
                                
                                
                        }
			catch(ClassNotFoundException e) {
				e.printStackTrace();
			}
			con = DriverManager.getConnection(url,username,password);
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}

}
