package Employee;

import Connection.ServerConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Time {

    //Declaring global variables
    private static final String error = "Error in connecting to server";
    private static String sql;
    protected static Date openingTime = null;
    protected static Date closingTime = null;
    private static ResultSet rs;

    public String getOpeningTime() throws ClassNotFoundException, SQLException {

	// Setting server instance
	ServerConnection.setConnection();

	// Declaring local variables
	String OHR = null;

	if (ServerConnection.getConnectionStatus()) {
	    Connection con = ServerConnection.getConnection();

	    Statement st = con.createStatement();

	    sql = "SELECT time FROM business_hours WHERE business_hours.type = 'OHR'";
	    rs = st.executeQuery(sql);
	    while (rs.next()) {
		openingTime = rs.getTime("time");
	    }
	    String openingTimeToString = openingTime.toString();

	    return openingTimeToString;
	}
	return error;
    }

    public String getClosingTime() throws ClassNotFoundException, SQLException {

	// Setting server instance
	ServerConnection.setConnection();

	// Declaring local variables
	String OHR = null;
	String newClosingTimeToString = null;

	if (ServerConnection.getConnectionStatus()) {
	    Connection con = ServerConnection.getConnection();

	    Statement st = con.createStatement();

	    sql = "SELECT time FROM business_hours WHERE business_hours.type = 'CHR'";
	    rs = st.executeQuery(sql);
	    while (rs.next()) {
		closingTime = rs.getTime("time");
	    }
	    String closingTimeToString = closingTime.toString();

	    try {
		// 15minutes will be added from the time of closing time
		SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
		Date d = df.parse(closingTimeToString);
		Calendar cal = Calendar.getInstance();
		cal.setTime(d);
		cal.add(Calendar.MINUTE, 15);
		newClosingTimeToString = df.format(cal.getTime());
		
	    } catch (ParseException e) {
		System.out.print(e);
	    }

	    return newClosingTimeToString;
	}
	return error;

    }

}
