/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DataBase.Conexion;
import Entity.Consulta;
import Entity.Especialidad;
import Entity.Especializacion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author potz
 */
@WebServlet(name = "CrearEspecialidad", urlPatterns = {"/CrearEspecialidad"})
public class CrearEspecialidad extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CrearEspecialidad</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CrearEspecialidad at " + request.getContextPath() + "</h1>");
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
         try {
            // set all the preparedstatement parameters
            PreparedStatement st ;
            String query2 = "SELECT nombre FROM ESPECIALIDAD WHERE nombre='"+request.getParameter("especialidad")+"'";
            st = null;
            st = Conexion.getConnection().prepareStatement(query2);
            ResultSet result = st.executeQuery();
            if (!result.next()) {
                Especialidad especial = new Especialidad(request.getParameter("especialidad"));
                Especializacion esp = new Especializacion(request.getParameter("especialidad"),String.valueOf( request.getSession().getAttribute("Medic")));
                Consulta consulta = new Consulta(200.0, request.getParameter("especialidad"));
            } else {
               Especializacion esp = new Especializacion(request.getParameter("especialidad"),String.valueOf( request.getSession().getAttribute("Medic")));
            }
            st.close();
            response.sendRedirect("Administrador/Mensaje.jsp?mensaje=Especialidad creada con exito");
        } catch (Exception e) {
            // log exception
        }
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
