package Employee;

import Connection.ServerConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Data {

    private static String result = null;
    private static String query = null;
    private static ResultSet rs = null;

    public static String getDepartmentCount(String department) throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            query = "SELECT COUNT(*) FROM employees WHERE department = '"+department+"'";

            rs = st.executeQuery(query);
            while (rs.next()) {
                result = rs.getString(1);
            }
            return result;
        }
        return result;
    }
    
}
