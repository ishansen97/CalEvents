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

    public static String getEventDepartmentCount() throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            query = "SELECT COUNT(*) FROM employees WHERE department = 'Event Department'";

            rs = st.executeQuery(query);
            while (rs.next()) {
                result = rs.getString(1);
            }
            return result;
        }
        return result;
    }

    public static String getMenuDepartmentCount() throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            query = "SELECT COUNT(*) FROM employees WHERE department = 'Menu Department'";

            rs = st.executeQuery(query);
            while (rs.next()) {
                result = rs.getString(1);
            }
            return result;
        }
        return result;
    }

    public static String getPaymentDepartmentCount() throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            query = "SELECT COUNT(*) FROM employees WHERE department = 'Payment Department'";

            rs = st.executeQuery(query);
            while (rs.next()) {
                result = rs.getString(1);
            }
            return result;
        }
        return result;
    }

    public static String getFacilityDepartmentCount() throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            query = "SELECT COUNT(*) FROM employees WHERE department = 'Facility Department'";

            rs = st.executeQuery(query);
            while (rs.next()) {
                result = rs.getString(1);
            }
            return result;
        }
        return result;
    }

    public static String getKitchenDepartmentCount() throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            query = "SELECT COUNT(*) FROM employees WHERE department = 'Kitchen Department'";

            rs = st.executeQuery(query);
            while (rs.next()) {
                result = rs.getString(1);
            }
            return result;
        }
        return result;
    }

    public static String getGalleryDepartmentCount() throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            query = "SELECT COUNT(*) FROM employees WHERE department = 'Gallery Department'";

            rs = st.executeQuery(query);
            while (rs.next()) {
                result = rs.getString(1);
            }
            return result;
        }
        return result;
    }

    public static String getCustomerDepartmentCount() throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            query = "SELECT COUNT(*) FROM employees WHERE department = 'Customer Department'";

            rs = st.executeQuery(query);
            while (rs.next()) {
                result = rs.getString(1);
            }
            return result;
        }
        return result;
    }

    public static String getEmployeeDepartmentCount() throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            query = "SELECT COUNT(*) FROM employees WHERE department = 'Employee Department'";

            rs = st.executeQuery(query);
            while (rs.next()) {
                result = rs.getString(1);
            }
            return result;
        }
        return result;
    }

}
