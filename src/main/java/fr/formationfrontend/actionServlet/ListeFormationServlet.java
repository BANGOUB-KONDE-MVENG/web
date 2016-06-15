/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.formationfrontend.actionServlet;

import fr.utbm.formation.entity.CourseSession;
import fr.utbm.formation.entity.Location;
import fr.utbm.formation.repository.CourseSessionDAO;
import fr.utbm.formation.repository.LocationDAO;
import java.util.List;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author jacques
 */
//@WebServlet(name = "ListeFormationServlet", urlPatterns = {"/ListeFormationServlet"})
public class ListeFormationServlet extends HttpServlet {

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
       
        CourseSessionDAO Listedesformations = new CourseSessionDAO();
        List<CourseSession> listes = Listedesformations.getAllCourseSession();
           
        request.setAttribute("listeCourse", listes);
        
        // pour le toolSearch
        LocationDAO lDAO = new LocationDAO();
        List<Location> l = lDAO.getAllLocation();
        request.setAttribute("locations", l);
		
	this.getServletContext().getRequestDispatcher(
        "/jsp/listeformation.jsp").forward( request, response );
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
       // processRequest(request, response);
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
