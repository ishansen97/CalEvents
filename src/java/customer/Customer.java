package customer;

import Connection.ServerConnection;
import java.sql.*;

public class Customer {
    
    private String cus_id;
    private String fullName;
    private String address;
    private String contactNumber;
    private String email;
    private String userType; //to view all cutomers as admin
    private String userName;
    private String password;

    public Customer(String fullName, String address, String contactNumber, String email) {
        this.fullName = fullName;
        this.address = address;
        this.contactNumber = contactNumber;
        this.email = email;
    }

    public Customer(String email) {
        this.email = email;
    }
    
    
    
    public String generateCustomerId() throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement stmt = con.createStatement();
            query = "SELECT cus_id FROM customer ORDER BY cus_id DESC LIMIT 1";
            ResultSet result = stmt.executeQuery(query);
            
            if (result.next()) {
                String stringId = result.getString("cus_id");
                String[] stringIdArr = stringId.split("C0", 2);
                int intId = Integer.parseInt(stringIdArr[1]);
                intId++;
                
                if (intId >= 1 && intId < 10)
                    cus_id = "C00" + intId;
                else
                    cus_id = "C0" + intId;
            }
            else
                cus_id = "C001";
        }
        return cus_id;
    }
    
    public boolean isInserted() throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            query = "INSERT INTO customer (cus_id,name,address,contact_number,email) VALUES(?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, cus_id);
            ps.setString(2, fullName);
            ps.setString(3, address);
            ps.setString(4, contactNumber);
            ps.setString(5, email);
            
            int result = ps.executeUpdate();
            
            if (result > 0)
                return true;
            else
                return false;
        }
        else
            return false;
    }
    
    public boolean isEmailAvailable() throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            query = "SELECT email FROM customer WHERE email = '" +email+ "'";
            ResultSet result = st.executeQuery(query);
            
            if (result.next())
                return true;
            else
                return false;
        }
        else
            return false;
    }
    
    public static boolean passWordUpdated(Customer cus, String password) throws ClassNotFoundException, SQLException {
        ServerConnection.setConnection();
        String query = null;
        String customer_id = cus.getCus_id();
        
        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();
            query = "UPDATE customer SET password = '" +password+ "' WHERE cus_id = '" +customer_id+ "'";
            int result = st.executeUpdate(query);
            
            if (result > 0)
                return true;
            else
                return false;
        }
        else
            return false;
    }

    public String getCus_id() {
        return cus_id;
    }
    
    public String getFullName() {
            return fullName;
    }
    public void setFullName(String fullName) {
            this.fullName = fullName;
    }
    public String getAddress() {
            return address;
    }
    public void setAddress(String address) {
            this.address = address;
    }
    public String getContactNumber() {
            return contactNumber;
    }
    public void setContactNumber(String contactNumber) {
            this.contactNumber = contactNumber;
    }
    public String getEmail() {
            return email;
    }
    public void setEmail(String email) {
            this.email = email;
    }
    public String getUserType() {
            return userType;
    }
    public void setUserType(String userType) {
            this.userType = userType;
    }
    public String getUserName() {
            return userName;
    }
    public void setUserName(String userName) {
            this.userName = userName;
    }
    public String getPassword() {
            return password;
    }
    public void setPassword(String password) {
            this.password = password;
    }
	

}
