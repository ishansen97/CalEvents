/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package report;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JRDesignQuery;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import util.DBConnection;

/**
 *
 * @author Shashi Perera
 */
@WebServlet(name = "reportServlet", urlPatterns = {"/reportServlet"})
public class reportServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
  try{
                    Connection con;
            Statement statement = null;

            con = DBConnection.createConnection();
            // statement = con.createStatement();
            String query = "SELECT * from reservation order by seats DESC LIMIT 5";

            String reportPath = "G:\\Yr 2 Semester 2\\ITP\\Grp project\\WebApplication4\\src\\java\\report\\maxReservations.jrxml";
            // Map<String, Object> parameters = new HashMap<String, Object>();

////                //loading the design from the file path
            JasperDesign jasperDesign = JRXmlLoader.load(reportPath);
////                
////                //Designing the query for the report
            JRDesignQuery newQuery = new JRDesignQuery();
////                
////                //setting the query text
            newQuery.setText(query);
//////                
//////                //seeting the query for the report design
            jasperDesign.setQuery(newQuery);
//////                
//////                //compile the jasper report for the design
            JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
//////                
//////                //creating a JasperPrint object to fill the report
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, con);
       
                JasperExportManager.exportReportToPdfFile(jasperPrint, "C://Users//Shashi Perera//Desktop//report//maxReservations.pdf");
//         
           response.sendRedirect("maxReservations.jsp");
        } catch (JRException ex) {
           Logger.getLogger(reportServlet.class.getName()).log(Level.SEVERE, null, ex);

        }
        
        
    }
    }



