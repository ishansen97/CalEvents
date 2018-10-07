package Event;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;

/**
 *
 * @author hp
 */
@WebServlet(urlPatterns = {"/MyServlet"})
public class MyServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            /* TODO output your page here. You may use following sample code. */
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MyServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            out.println("hello");

            // String empImgPath = request.getSession(false).getAttribute("empImgPath").toString();
            String id = request.getParameter("id");
            String event_name = request.getParameter("eventName");
            out.println("Event name : " + event_name);
            String description = request.getParameter("description");
            String location = request.getParameter("location");
            out.println(location);
            String date = request.getParameter("start_date");
            out.println(date);
            String start_time = request.getParameter("start_time") + ":00";
            String end_time = request.getParameter("end_time") + ":00";
            //avatar = "../Event/Images/"+ id +".png";
            Date start_date = Date.valueOf(date);
            out.println("between date and time");
            out.println("Date: " + start_date);
            Time start = Time.valueOf(start_time);
            Time end = Time.valueOf(end_time);

            // obtains the upload file part in this multipart request
            //   Part filePart = request.getPart("avatar");
            //obtains input stream of the upload file
            // inputStream = filePart.getInputStream();
            //Change the output path accordingly
            //OutputStream output = new FileOutputStream(empImgPath+id+".png");
            //byte[] buffer = new byte[1024];
            //while (inputStream.read(buffer) > 
            //  output.write(buffer);
            out.println("start time : " + start_time + "\n");
            out.println("end time : " + end_time + "\n");

            out.println("before");

            Event event = new Event(event_name, description, location, start_date, start, end);
            out.println("Working");
            out.print("new id:" + event.generateEventId());

            
            
//            String evtImgPath = request.getSession(false).getAttribute("evtImgPath").toString();
//            String eventId = event.generateEventId();
//
//            InputStream inputStream = null;
//            String oldAvatar = null;
//            String avatar = null;

//            avatar = "../User/Images/" + id + ".png";
//
//            // obtains the upload file part in this multipart request
//            Part filePart = request.getPart("avatar");
//
//            // obtains input stream of the upload file
//            inputStream = filePart.getInputStream();

            // Change the output path accordingly
//            OutputStream output = new FileOutputStream(evtImgPath + eventId + ".png");
//            byte[] buffer = new byte[1024];
//            while (inputStream.read(buffer) > 0) {
//                output.write(buffer);
//            }

            
            
            
            
            
            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/calendartest", "root", "");
            Statement st = con.createStatement();
            int stime = 0;
            int etime = 0;
            String sql = "SELECT * FROM public_events WHERE date = '" + date + "' AND location_ID='" + location + "' AND start_time='" + start_time + "' AND end_time='" + end_time + "'";

            ResultSet rs = st.executeQuery(sql);

            if (rs.next()) {
                out.println("<script>");
                out.println("alert('Select Another Time')");
                out.println("</script>");
            } else {
                while (rs.next()) {
                    stime = rs.getInt("start_time");
                    etime = rs.getInt("end_time");
                }

                /*if(Integer.parseInt(start_time) >= stime && Integer.parseInt(end_time) <= etime)
                {
                    out.println("<script>");
                    out.println("alert('Select another time please')");
                    out.println("</script>");
                }
                else
                {*/
                if (event.isInserted()) {
                    out.println("row is inserted");
                    response.sendRedirect(request.getContextPath() + "/Event/eventListP.jsp");
                } else {
                    out.println("row is not inserted");
                }
                //}
            }

        } catch (Exception ex) {
            PrintWriter out = response.getWriter();
            ex.printStackTrace();
            out.println("inside catch block");

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
