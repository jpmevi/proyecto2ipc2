/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Entity.Archivo_Orden;
import Entity.Orden_Examen;
import Entity.Paciente;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
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
@WebServlet(name = "GenerarOrden", urlPatterns = {"/GenerarOrden"})
public class GenerarOrden extends HttpServlet {

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
            out.println("<title>Servlet GenerarOrden</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GenerarOrden at " + request.getContextPath() + "</h1>");
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
        String copaciente = String.valueOf(request.getSession().getAttribute("PAC"));
        String medico = String.valueOf(request.getSession().getAttribute("Medico"));
        Orden_Examen oe = new Orden_Examen(String.valueOf(request.getParameter("descripcion")), copaciente, medico, request.getParameter("examen"));
        int codigo = oe.insertarOrden_Examen();

        //Crea una carpeta para guardar los reportes
        File directorio = new File(getServletContext().getRealPath(File.separator) + "/Ordenes");
        directorio.mkdirs();

        //Establecemos el path
        String path = getServletContext().getRealPath(File.separator) + "/Ordenes/orden" + copaciente + codigo + ".pdf";

        PdfWriter writer = new PdfWriter(path);
        PdfDocument pdfDoc = new PdfDocument(writer);
        Document document = new Document(pdfDoc);
        String orden_m = "Codigo de la orden : " + codigo;
        String doctor = "Codigo del medico que genero la orden : " + medico;
        String paciente = "Codigo del paciente que debe realizar examen: " + copaciente;
        String examen = "Codigo de examen: " + request.getParameter("examen");
        String desc = "Descripcion: " + request.getParameter("descripcion");
        Paragraph para1 = new Paragraph(orden_m);
        Paragraph para2 = new Paragraph(doctor);
        Paragraph para3 = new Paragraph(paciente);
        Paragraph para4 = new Paragraph(examen);
        Paragraph para5 = new Paragraph(desc);
        document.add(para1);
        document.add(para2);
        document.add(para3);
        document.add(para4);
        document.add(para5);
        document.close();
        //Creamos el archivo
        String pdfFileName = "Ordenes/orden" + copaciente + codigo + ".pdf";
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
        Archivo_Orden ao = new Archivo_Orden(fileInputStream, codigo);
        
        
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
