package service;

import model.Customer;

public interface ICustomerService {

	public void customerRegister(Customer register);
	
	public boolean loginCheck(String uname,String pass,String utype);
	
	public String GetID(String uname,String pass,String utype);
	
	public String updateProfile(String user,Customer c);
        
        //public String updateNotify(String user, Customer c);
        //public static ResultSet viewFeedback(String customer) //
        //to view the method <%  ResultSet result = Feedback.viewFeedback("C002");
           //     int i = 0;
            //%>
        /* public static ResultSet getReservationDetails(String customer) throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        ResultSet res = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement stmt = con.createStatement();
            
            query = "SELECT pe.event_name,r.res_id,r.date FROM public_events pe, reservation r WHERE r.event_id = pe.event_ID AND r.cus_id = '" +customer+ "'";
            
            res = stmt.executeQuery(query);
        }
        
        return res;
    }
    */
	
}
