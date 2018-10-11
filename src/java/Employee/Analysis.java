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

    public static ResultSet getYearlyAttendanceCount(String year) throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            query = "SELECT COUNT(Arrival_Time) AS Attendance_Count FROM attendance WHERE Arrival_Time <> '00:00:00' AND Year = " + year + " GROUP BY Department ORDER BY attendance.Department ASC";

            attendanceResultSet = st.executeQuery(query);
        }

        return attendanceResultSet;
    }

    public static ResultSet getMonthlyDepartmentAttendance(String year, String department) throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            query = "SELECT MONTH(Date) AS Month, COUNT(Arrival_Time) AS Attendance_Count FROM attendance WHERE Arrival_Time <> '00:00:00' AND YEAR(Date) = " + year + " AND department = '" + department + " Department' GROUP BY MONTH(Date) ORDER BY attendance.Department ASC";

            attendanceResultSet = st.executeQuery(query);
        }

        return attendanceResultSet;
    }

    public static double getYearStatDepartmentAttendance(String department) throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();
        int curYearCount = 0;
        double preYearCount = 0;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            String currCountQuery = "SELECT COUNT(*) AS Current_Year FROM attendance WHERE Department = '" + department + " Department' AND Year = YEAR(CURDATE())";
            ResultSet res = st.executeQuery(currCountQuery);
            while (res.next()) {
                curYearCount = res.getInt("Current_Year");
            }

            String preCountQuery = "SELECT COUNT(*) AS Previous_Year FROM attendance WHERE Department = '" + department + " Department' AND Year = YEAR(CURDATE())-1";
            ResultSet res01 = st.executeQuery(preCountQuery);
            while (res01.next()) {
                preYearCount = res01.getInt("Previous_Year");
            }
        }
        
        if(curYearCount == 0)
            curYearCount = 1;
        
        if(preYearCount == 0)
            preYearCount = 0.0;

        double sum = curYearCount - preYearCount;
        double totalPercentage = (sum / curYearCount);
        return totalPercentage;
    }

    public static String getYearStatDepartmentEmployment(String department) throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();
        int noOfNewEmployees = 0;
        int noOfTerminatedEmployees = 0;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            String employeedCountQuery = "SELECT COUNT(id) AS New_Employees FROM employees WHERE department = '" + department + " Department' AND YEAR(doe) = YEAR(CURDATE())";
            ResultSet res = st.executeQuery(employeedCountQuery);
            while (res.next()) {
                noOfNewEmployees = res.getInt("New_Employees");
            }
            
            String terminatedCountQuery = "SELECT COUNT(id) AS Terminated_Employees FROM employees WHERE department = '" + department + " Department' AND YEAR(dot) = YEAR(CURDATE())";
            ResultSet res01 = st.executeQuery(terminatedCountQuery);
            while (res.next()) {
                noOfTerminatedEmployees = res01.getInt("Terminated_Employees");
            }
        }
        return noOfNewEmployees+","+noOfTerminatedEmployees;
    }

    public static int getDepartmentEmployment(String department) throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();
        int noOfEmployees = 0;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            String empCountQuery = "SELECT COUNT(id) AS Department_Count FROM employees WHERE department = '" + department + " Department'";
            ResultSet res = st.executeQuery(empCountQuery);
            while (res.next()) {
                noOfEmployees = res.getInt("Department_Count");
            }
        }
        return noOfEmployees;
    }

    public static double getDepartmentLeaveCount(String department) throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();
        int noOfLeavesThisYear = 0;
        double noOfLeavesLastYear = 0.0;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            String thisYearLeaveCountQuery = "SELECT COUNT(employee_id) AS Leave_Count FROM employee_leave_schedule WHERE YEAR(date) = YEAR(CURDATE()) AND employee_id IN (SELECT id FROM employees WHERE department = '" + department + " Department')";
            ResultSet res = st.executeQuery(thisYearLeaveCountQuery);
            while (res.next()) {
                noOfLeavesThisYear = res.getInt("Leave_Count");
            }

            String lastYearLeaveCountQuery = "SELECT COUNT(employee_id) AS Leave_Count FROM employee_leave_schedule WHERE YEAR(date) = YEAR(CURDATE())-1 AND employee_id IN (SELECT id FROM employees WHERE department = '" + department + " Department')";
            ResultSet res01 = st.executeQuery(lastYearLeaveCountQuery);
            while (res01.next()) {
                noOfLeavesLastYear = res01.getDouble("Leave_Count");
            }
        }

        if (noOfLeavesThisYear == 0) {
            noOfLeavesThisYear = 1;
        }

        if (noOfLeavesLastYear == 0) {
            noOfLeavesLastYear = 1.0;
        }

        double noOfLeaves = ((noOfLeavesThisYear - noOfLeavesLastYear) / noOfLeavesLastYear);

        return noOfLeaves;
    }

    public static String getDepartmentLeaveStat(String department) throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();
        String noOfLeavesThisYear = null;
        String noOfLeavesLastYear = null;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            String thisYearLeaveCountQuery = "SELECT COUNT(employee_id) AS Leave_Count FROM employee_leave_schedule WHERE YEAR(date) = YEAR(CURDATE()) AND employee_id IN (SELECT id FROM employees WHERE department = '" + department + " Department')";
            ResultSet res = st.executeQuery(thisYearLeaveCountQuery);
            while (res.next()) {
                noOfLeavesThisYear = res.getString("Leave_Count");
            }

            String lastYearLeaveCountQuery = "SELECT COUNT(employee_id) AS Leave_Count FROM employee_leave_schedule WHERE YEAR(date) = YEAR(CURDATE())-1 AND employee_id IN (SELECT id FROM employees WHERE department = '" + department + " Department')";
            ResultSet res01 = st.executeQuery(lastYearLeaveCountQuery);
            while (res01.next()) {
                noOfLeavesLastYear = res01.getString("Leave_Count");
            }
        }

        return noOfLeavesThisYear + "," + noOfLeavesLastYear;
    }

    public static String getDepartmentEmploymentStat(String department) throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();
        String noOfTerminatedEmployees = null;
        int noOfNewEmployees = getDepartmentEmployment(department);

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            String currCountQuery = "SELECT COUNT(id) AS Terminated_Employees FROM employees WHERE department = '" + department + " Department' AND YEAR(dot) = YEAR(CURDATE())";
            ResultSet res = st.executeQuery(currCountQuery);
            while (res.next()) {
                noOfTerminatedEmployees = res.getString("Terminated_Employees");
            }
        }

        return noOfNewEmployees + "," + noOfTerminatedEmployees;
    }

    public static String getDepartmentGenderStat(String department) throws ClassNotFoundException, SQLException {

        ServerConnection.setConnection();
        int noOfMaleEmployees = 0;
        int noOfFemaleEmployees = 0;

        if (ServerConnection.getConnectionStatus()) {
            Connection con = ServerConnection.getConnection();
            Statement st = con.createStatement();

            String thisYearLeaveCountQuery = "SELECT COUNT(`id`) AS Male_Count FROM employees WHERE gender = 'Male' AND department = '" + department + " Department'";
            ResultSet res = st.executeQuery(thisYearLeaveCountQuery);
            while (res.next()) {
                noOfMaleEmployees = res.getInt("Male_Count");
            }

            String lastYearLeaveCountQuery = "SELECT COUNT(`id`) AS Female_Count FROM employees WHERE gender = 'Female' AND department = '" + department + " Department'";
            ResultSet res01 = st.executeQuery(lastYearLeaveCountQuery);
            while (res01.next()) {
                noOfFemaleEmployees = res01.getInt("Female_Count");
            }

        }
        return noOfMaleEmployees + "," + noOfFemaleEmployees;
    }
}
