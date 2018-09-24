package Employee;

import Connection.ServerConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Business {

    private static String sql;
    private static ResultSet rs;
    private static String OHR;
    private static String CHR;
    private static String UCHR;

    public static String openingHour() throws ClassNotFoundException, SQLException {

        // Setting server connection
        ServerConnection.setConnection();

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();

            Statement st = con.createStatement();

            sql = "SELECT time FROM business_hours WHERE business_hours.type = 'OHR'";
            rs = st.executeQuery(sql);
            while (rs.next()) {
                OHR = rs.getString("time");
            }
            return OHR;
        }
        return "Error in retrieving opening business hours";

    }

    public static String closingHour() throws ClassNotFoundException, SQLException {

        // Setting server connection
        ServerConnection.setConnection();

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();

            Statement st = con.createStatement();

            sql = "SELECT time FROM business_hours WHERE business_hours.type = 'CHR'";
            rs = st.executeQuery(sql);
            while (rs.next()) {
                CHR = rs.getString("time");
            }

            try {
                // 15minutes will be added from the time of closing time
                SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
                Date d = df.parse(CHR);
                Calendar cal = Calendar.getInstance();
                cal.setTime(d);
                cal.add(Calendar.MINUTE, 15);
                UCHR = df.format(cal.getTime());

            } catch (Exception e) {
                System.out.print(e);
            }

            return UCHR;
        }
        return "Error in retrieving closing business hours";

    }

    public static boolean forceSignOut() throws ClassNotFoundException, SQLException {

        String NCHR = closingHour().replace(":", "");

        Date date = new Date();
        SimpleDateFormat timeFormat = new SimpleDateFormat("HHmmss");
        String currentTime = timeFormat.format(date);

        int CLOT = Integer.parseInt(NCHR);
        int CURT = Integer.parseInt(currentTime);

        int signOutTime = CLOT - CURT;

        if (signOutTime > 0) {
            return false;
        } else {
            return true;
        }
//        return false;
    }

    public static boolean isOpenForBusiness() throws ClassNotFoundException, SQLException {

        String NOHR = openingHour().replace(":", "");
        String NCHR = closingHour().replace(":", "");

        Date date = new Date();
        SimpleDateFormat timeFormat = new SimpleDateFormat("HHmmss");
        String currentTime = timeFormat.format(date);

        int OPNT = Integer.parseInt(NOHR);
        int CLOT = Integer.parseInt(NCHR);
        int CURT = Integer.parseInt(currentTime);

        int openingTime = OPNT - CURT;
        int closingTime = CLOT - CURT;

//        return true;
        if (openingTime < 0 && closingTime > 0) {
            return true;
        } else {
            return false;
        }

    }

}
