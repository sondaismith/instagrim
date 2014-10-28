/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.servlets;

import java.util.UUID;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.datastax.driver.core.BatchStatement;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.DataType;
import com.datastax.driver.core.Session;
import com.datastax.driver.core.Metadata;
import com.datastax.driver.core.ResultSet;
import com.oracle.jrockit.jfr.ContentType;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import uk.ac.dundee.computing.aec.instagrim.stores.LoggedIn;

/**
 *
 * @author NeXType
 */
@WebServlet(name = "Delete", urlPatterns = {"/Delete"})
public class Delete extends HttpServlet {

    private Cluster cluster;
    
    public void connect(String node) 
    {
        cluster = Cluster.builder().addContactPoint(node).build();
        Metadata metadata = cluster.getMetadata();
        System.out.printf("Connected to cluster: %s\n", metadata.getClusterName());
    }
    
    public void init(ServletConfig config) throws ServletException{
        System.out.println("Trying to connect to Instagrim database cluster...");
        this.connect("127.0.0.1");
    }
    
    
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Delete</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Delete at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        response.sendRedirect("/Instagrim");
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
            throws ServletException, IOException 
    {
        UUID id = UUID.fromString(request.getParameter("picid"));
        System.out.println(request.getParameter("picid"));
        String username = (String) request.getParameter("username");
        java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy");
        String dateUp = request.getParameter("dateuploaded");
        java.util.Date dt = null;
        try{
            dt = dateFormat.parse(dateUp);
        }
        catch(Exception e){response.sendRedirect("/Instagrim");}
        System.out.println(username);
        System.out.println(dt);
        Session session = cluster.connect("instagrim");
        BatchStatement batch = new BatchStatement();
        PreparedStatement psDeletePicRecord = session.prepare("DELETE FROM pics where picid =?;");
        System.out.println("First statement in Delete.java doPost() was excepted.");
        PreparedStatement psDeletePicListRecord = session.prepare("DELETE FROM userpiclist where picid =?;");
        System.out.println("Second statement Delete.java doPost() was excepted.");
        //BoundStatement bsDeletePicRecord = new BoundStatement(psDeletePicRecord);
        //BoundStatement bsDeletePicListRecord = new BoundStatement(psDeletePicListRecord);
        batch.add(psDeletePicRecord.bind(id));
        batch.add(psDeletePicListRecord.bind(id));
        System.out.println(session.execute(batch));
        System.out.println("Image successfully deleted.");
        //The code below would be used to display a message to the user that the image
        //was deleted, but I can't get it to work at the moment.
        request.setAttribute("deletemessage", "Image successfully deleted.");
        response.sendRedirect("/Instagrim/Images/"+username);
        //request.getRequestDispatcher("/Images/"+username).forward(request, response);
        //processRequest(request, response);
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
