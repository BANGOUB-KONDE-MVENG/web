/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.formationfrontend.actionServlet;

import fr.utbm.formation.entity.Client;
import fr.utbm.formation.entity.CourseSession;
import fr.utbm.formation.entity.Location;
import fr.utbm.formation.repository.ClientDAO;
import fr.utbm.formation.repository.CourseSessionDAO;
import fr.utbm.formation.repository.LocationDAO;
import java.io.IOException;
import java.util.List;
import javax.faces.view.Location;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;

/**
 *
 * @author jacques
 */
public class Confirmationinscriptionservlet extends HttpServlet {

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
       
      // je recupère les variables venant du formulaire
         String nom = request.getParameter("nom");
         String prenom = request.getParameter("prenom");
         String adresse = request.getParameter("adresse");
         String courriel = request.getParameter("courriel");
         String telephone = request.getParameter("telephone");
         String idform=request.getParameter("id");
         int idvrai=Integer.parseInt(idform);
         
          CourseSessionDAO csDAO = new CourseSessionDAO();
           CourseSession cs = csDAO.getCourseSession(idvrai);
           
           Client cli = new Client();
           cli.setFisrtname(prenom);
           cli.setLastname(nom);
           cli.setAddress(adresse);
           cli.setEmail(courriel);
           cli.setPhone(telephone);
           cli.setCourseSession(cs);
           
           ClientDAO cliDAO = new ClientDAO();
           cliDAO.addClient(cli);
          
        // pour le toolSearch
        LocationDAO lDAO = new LocationDAO();
        List<Location> l = lDAO.getAllLocation();
        request.setAttribute("locations", l);
        
        //j'envoi un méssage au user pour le notifier de son inscription
        String message="votre inscription a bien été prise en compte";
        request.setAttribute("message", message);
        List<CourseSession> listCS = csDAO.getAllCourseSession();
        request.setAttribute("coursesession", listCS);
        this.getServletContext().getRequestDispatcher(
        "/jsp/inscriptionformation.jsp").forward( request, response );
        processRequest(request, response); 
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
