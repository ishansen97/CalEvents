package Employee;

import Connection.ServerConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Analysis {

    private static String query = null;
    private static ResultSet attendanceResultSet = null;
    private static ResultSet rs = null;
    private static String year = "YEAR(CURDATE())";
    private static String department = "Employee";

    public static ResultSet getYearlyAttendanceCount(String year) throws ClassNotFoundException, SQLException {

	ServerConnection.setConnection();

	if (ServerConnection.getConnectionStatus()) {
	    Connection con = ServerConnection.getConnection();
	    Statement st = con.createStatement();

	    query = "SELECT COUNT(Arrival_Time) AS Attendance_Count FROM attendance WHERE Arrival_Time <> '00:00:00' AND Year = "+year+" GROUP BY Department ORDER BY attendance.Department ASC";

	    attendanceResultSet = st.executeQuery(query);
	}

	return attendanceResultSet;
    }
    
    public static ResultSet getMonthlyDepartmentAttendance(String year, String department) throws ClassNotFoundException, SQLException {

	Analysis.year = year;
	Analysis.department = department;
	
	ServerConnection.setConnection();

	if (ServerConnection.getConnectionStatus()) {
	    Connection con = ServerConnection.getConnection();
	    Statement st = con.createStatement();

	    query = "SELECT MONTH(Date) AS Month, COUNT(Arrival_Time) AS Attendance_Count FROM attendance WHERE Arrival_Time <> '00:00:00' AND YEAR(Date) = "+year+" AND department = '"+department+" Department' GROUP BY MONTH(Date) ORDER BY attendance.Department ASC";

	    attendanceResultSet = st.executeQuery(query);
	}

	return attendanceResultSet;
    }
}
