package Employee;

import Connection.ServerConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Performance {

    public static double getEmployeeYearlyAttendanceStat(String employee_id) throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();
        int thisYearAttendance = 0;
        int lastYearAttendance = 0;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            String currCountQuery = "SELECT COUNT(`Employee ID`) AS Year_Attendance FROM attendance WHERE `Employee ID` = '" + employee_id + "' AND YEAR = YEAR(CURDATE())";
            ResultSet res = st.executeQuery(currCountQuery);
            while (res.next()) {
                thisYearAttendance = res.getInt("Year_Attendance");
            }

            String preCountQuery = "SELECT COUNT(`Employee ID`) AS Year_Attendance FROM attendance WHERE `Employee ID` = '" + employee_id + "' AND YEAR = YEAR(CURDATE())-1";
            ResultSet res01 = st.executeQuery(preCountQuery);
            while (res01.next()) {
                lastYearAttendance = res01.getInt("Year_Attendance");
            }
        }
        double percentageAttendance = thisYearAttendance - lastYearAttendance;
        return (percentageAttendance / lastYearAttendance) * 100.0;
    }

    public static int getEmployeeThisYearAttendanceCount(String employee_id) throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();
        int thisYearAttendance = 0;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            String currCountQuery = "SELECT COUNT(`Employee ID`) AS Year_Attendance FROM attendance WHERE `Employee ID` = '" + employee_id + "' AND YEAR = YEAR(CURDATE())";
            ResultSet res = st.executeQuery(currCountQuery);
            while (res.next()) {
                thisYearAttendance = res.getInt("Year_Attendance");
            }
        }
        return thisYearAttendance;
    }
    
     public static int getEmployeeLastYearAttendanceCount(String employee_id) throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();
        int lastYearAttendance = 0;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            String currCountQuery = "SELECT COUNT(`Employee ID`) AS Year_Attendance FROM attendance WHERE `Employee ID` = '" + employee_id + "' AND YEAR = YEAR(CURDATE())-1";
            ResultSet res = st.executeQuery(currCountQuery);
            while (res.next()) {
                lastYearAttendance = res.getInt("Year_Attendance");
            }
        }
        return lastYearAttendance;
    }

    public static double getEmployeeLeaveStat(String employee_Id) throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();
        int noOfLeavesThisYear = 0;
        int noOfLeavesLastYear = 0;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            String thisYearLeaveCountQuery = "SELECT COUNT(employee_id) AS Leave_Count FROM employee_leave_schedule WHERE YEAR(date) = YEAR(CURDATE()) AND employee_id = '" + employee_Id + "'";
            ResultSet res = st.executeQuery(thisYearLeaveCountQuery);
            while (res.next()) {
                noOfLeavesThisYear = res.getInt("Leave_Count");
            }

            String lastYearLeaveCountQuery = "SELECT COUNT(employee_id) AS Leave_Count FROM employee_leave_schedule WHERE YEAR(date) = YEAR(CURDATE()) AND employee_id = '" + employee_Id + "'";
            ResultSet res01 = st.executeQuery(lastYearLeaveCountQuery);
            while (res01.next()) {
                noOfLeavesLastYear = res01.getInt("Leave_Count");
            }
        }

        if (noOfLeavesThisYear == 0) {
            noOfLeavesThisYear = 1;
        }

        if (noOfLeavesLastYear == 0) {
            noOfLeavesLastYear = 1;
        }

        double leaveTotal = (noOfLeavesThisYear - noOfLeavesLastYear);
        return (leaveTotal / noOfLeavesLastYear) * 100;
    }
    
    public static int getEmployeeThisYearLeaveCount(String employee_id) throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();
        int thisYearLeaveCount = 0;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            String currCountQuery = "SELECT COUNT(employee_id) AS Leave_Count FROM employee_leave_schedule WHERE YEAR(date) = YEAR(CURDATE()) AND employee_id = '" + employee_id + "'";
            ResultSet res = st.executeQuery(currCountQuery);
            while (res.next()) {
                thisYearLeaveCount = res.getInt("Leave_Count");
            }
        }
        return thisYearLeaveCount;
    }
    
    public static int getEmployeeLastYearLeaveCount(String employee_id) throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();
        int lastYearLeaveCount = 0;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            String currCountQuery = "SELECT COUNT(employee_id) AS Leave_Count FROM employee_leave_schedule WHERE YEAR(date) = YEAR(CURDATE())-1 AND employee_id = '" + employee_id + "'";
            ResultSet res = st.executeQuery(currCountQuery);
            while (res.next()) {
                lastYearLeaveCount = res.getInt("Leave_Count");
            }
        }
        return lastYearLeaveCount;
    }
    
        
    public static ResultSet getMonthlyEmployeeAttendance(String year, String employee_id) throws ClassNotFoundException, SQLException {
	
	ServerConnection.setConnection();
        ResultSet attendanceResultSet = null;

	if (ServerConnection.getConnectionStatus()) {
	    Connection con = ServerConnection.getConnection();
	    Statement st = con.createStatement();

	    String query = "SELECT MONTH(Date) AS Month, COUNT(Arrival_Time) AS Attendance_Count FROM attendance WHERE Arrival_Time <> '00:00:00' AND YEAR(Date) = "+year+" AND `Employee ID` = '"+employee_id+"' GROUP BY MONTH(Date) ORDER BY attendance.Department ASC";

	    attendanceResultSet = st.executeQuery(query);
	}

	return attendanceResultSet;
    }
}
