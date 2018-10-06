/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reservation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.view.JasperViewer;

/**
 *
 * @author DELL
 */
public class Test {
    public static void main(String[] args) throws SQLException {
//        try {
//            String reportPath = "C:\\Users\\DELL\\Desktop\\project folder\\CalEventsMerge01\\src\\java\\reservation\\event_reservation_report.jrxml";
//            String pdfPath = "C:\\Users\\DELL\\Desktop\\project folder\\CalEventsMerge01\\src\\java\\reservation\\parameterizedPDF.pdf";
//            JRDataSource jrdatasource = new JREmptyDataSource();
//            JasperReport jasperReport = JasperCompileManager.compileReport(reportPath);
//            
//            Map<String, Object> parameters = new HashMap<String, Object>();
//            parameters.put("Name", "Ishan");
//            parameters.put("Title", "Parameterized Report");
//            parameters.put("Age", 21);
//            parameters.put("Occupation", "Student");
//            parameters.put("Address", "Piliyandala");
//            
//            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, jrdatasource);
//            JasperExportManager.exportReportToPdfFile(jasperPrint, pdfPath);
//        } catch (Exception ex) {
//            
//        }
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/calevents", "root", "");
            String reportPath = "C:\\Users\\DELL\\Desktop\\project folder\\Reports\\display_report1.jrxml";
            JasperReport jr = JasperCompileManager.compileReport(reportPath);
            JasperPrint jp = JasperFillManager.fillReport(jr, null, con);
            JasperViewer.viewReport(jp);
            
        } catch (JRException ex) {
            Logger.getLogger(Test.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Test.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
