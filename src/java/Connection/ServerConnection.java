package Connection;
import java.sql.*;

public class ServerConnection {
    
    	//Creating a static variable 
	private static ServerConnection instance;
        static public Connection con = null;
        private static String url = "jdbc:mysql://localhost:3306/";
        private static String dbname = "calevents";
        private static String username = "root";
        private static String password = "";
         
	
	//Creating a private constructor(outside classes cannot access this)
	public ServerConnection(){}
	
	public static ServerConnection getInstance() {
            if(instance == null) {
                instance = new ServerConnection();
            }
            return instance;
	}
        //this shpuld run to establish the connection :3 not working neh :( wait i'll figure it out
        public static void setConnection()throws ClassNotFoundException, SQLException {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url+dbname,username,password);
        }
        
        public static Connection getConnection(){
            
            return con;
        }
        
        public static boolean getConnectionStatus(){
            if(con != null){
                return true;
            }
            else {
                return false;
            }
        }
        
    }

class test{
public static void main(String[] args){

    ServerConnection serv = ServerConnection.getInstance();
    Connection con = serv.getConnection();
     
    if(true==serv.getConnectionStatus()){
    System.out.println("Connected!!");
    }
    else{System.out.println("Fucked!!");
    }

}
}