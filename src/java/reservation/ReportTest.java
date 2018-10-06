/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reservation;

import Connection.ServerConnection;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JRDesignQuery;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;

/**
 *
 * @author DELL
 */
public class ReportTest {
    public static void main(String[] args) {
        try {
            String current_date = "2018-09-08";
            ServerConnection.setConnection();
            
            if (ServerConnection.getConnectionStatus()) {
                Connection con = ServerConnection.getConnection();
                Statement st = con.createStatement();
                String query = "SELECT pbe.event_ID, pbe.event_name, COUNT(*) FROM reservation r, public_booked_events pbe WHERE r.event_id = pbe.event_ID AND MONTH(r.date) = MONTH('" +current_date+ "') GROUP BY pbe.event_ID, pbe.event_name, r.event_id";
                
                String reportPath = "C:\\Users\\DELL\\Desktop\\project folder\\CalEventsMerge01\\src\\java\\reservation\\event_reservation_report.jrxml";
                Map<String, Object> parameters = new HashMap<String, Object>();
                parameters.put("current_month", current_date);
                
                //loading the design from the file path
                JasperDesign jasperDesign = JRXmlLoader.load(reportPath);
                
                //Designing the query for the report
                JRDesignQuery newQuery = new JRDesignQuery();
                
                //setting the query text
                newQuery.setText(query);
                
                //seeting the query for the report design
                jasperDesign.setQuery(newQuery);
                
                //compile the jasper report for the design
                JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
                
                //creating a JasperPrint object to fill the report
                JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, con);
                JasperViewer.viewReport(jasperPrint);
                
                
            }
            
        } catch (ClassNotFoundException | SQLException | JRException ex) {
            Logger.getLogger(ReservationReportManagement.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ReservationReportManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
