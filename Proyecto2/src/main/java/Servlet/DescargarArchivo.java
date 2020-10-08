/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Entity.Archivo_Orden;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author potz
 */
@WebServlet(name = "DescargarArchivo", urlPatterns = {"/DescargarArchivo"})
public class DescargarArchivo extends HttpServlet {

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
            out.println("<title>Servlet DescargarArchivo</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DescargarArchivo at " + request.getContextPath() + "</h1>");
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
        String codigo = request.getParameter("orden");
        String descripcion = request.getParameter("descripcion");
        String medico = request.getParameter("medico");
        String examen = request.getParameter("examen");
        //Crea una carpeta para guardar los reportes
        File directorio = new File(getServletContext().getRealPath(File.separator) + "/OrdenesPaciente");
        directorio.mkdirs();
        //Establecemos el path
        String path = getServletContext().getRealPath(File.separator) + "/OrdenesPaciente/ordenes" + codigo + medico + ".pdf";
        PdfWriter writer = new PdfWriter(path);
        PdfDocument pdfDoc = new PdfDocument(writer);
        Document document = new Document(pdfDoc);
        String orden_m = "Codigo de la orden del examen : " + codigo;
        String descripcion2 = "Descripcion de la orden : " + descripcion;
        String medico2 = "Medico de la orden: " + medico;
        String examen2 = "Codigo del examen de la orden: " + examen;
        Paragraph para1 = new Paragraph(orden_m);
        Paragraph para2 = new Paragraph(descripcion2);
        Paragraph para3 = new Paragraph(medico2);
        Paragraph para4 = new Paragraph(examen2);
        document.add(para1);
        document.add(para2);
        document.add(para3);
        document.add(para4);
        document.close();
        //Creamos el archivo
        String pdfFileName = "/OrdenesPaciente/ordenes" + codigo + medico + ".pdf";
        File pdfFile = new File(path);
        response.setContentType("application/pdf");
        response.addHeader("Content-Disposition", "attachment; filename=" + pdfFileName);
        response.setContentLength((int) pdfFile.length());
        FileInputStream fileInputStream = new FileInputStream(pdfFile);
        OutputStream responseOutputStream = response.getOutputStream();
        int bytes;
        while ((bytes = fileInputStream.read()) != -1) {
                responseOutputStream.write(bytes);
            }
    


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
