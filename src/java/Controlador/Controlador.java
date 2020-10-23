/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Producto;
import Modelo.ProductoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ricardo
 */
@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {
ProductoDAO dao=new ProductoDAO();
Producto p = new Producto();
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
            out.println("<title>Servlet Controlador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controlador at " + request.getContextPath() + "</h1>");
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
       String accion=request.getParameter("accion");
       switch(accion){
           case "Listar":
                List<Producto>datos=dao.listar();
                request.setAttribute("datos", datos);
                request.getRequestDispatcher("productoindex.jsp").forward(request, response);
                break;
                case "Nuevo":
                  request.getRequestDispatcher("add.jsp").forward(request, response);
                break;
            case "Guardar":
                String id=request.getParameter("ingresoID");
                String nombre=request.getParameter("ingresoNombre");
                String existencia=request.getParameter("ingresoExistencia");
                String precio=request.getParameter("ingresoPrecio");
                String caducidad=request.getParameter("ingresoCaducidad");
                String marca=request.getParameter("ingresoMarca");
                String categoria=request.getParameter("ingresoCategoria");
                p.setID(id);
                p.setNombre(nombre);
                p.setExistencia(existencia);
                p.setPrecio(precio);
                p.setCaducidad(caducidad);
                p.setMarca(marca);
                p.setCategoria(categoria);
                dao.agregar(p);
                request.getRequestDispatcher("Controlador?accion=Listar").forward(request, response);
                break;
            case "Editar":
                String ide=request.getParameter("id");
                Producto pr=dao.listarID(ide);
                request.setAttribute("producto", pr);
                request.getRequestDispatcher("edit.jsp").forward(request, response);
                break;
            case "Actualizar":
                String id1=request.getParameter("ingresoID");
                String nombre1=request.getParameter("ingresoNombre");
                String existencia1=request.getParameter("ingresoExistencia");
                String precio1=request.getParameter("ingresoPrecio");
                String caducidad1=request.getParameter("ingresoCaducidad");
                String marca1=request.getParameter("ingresoMarca");
                String categoria1=request.getParameter("ingresoCategoria");
                p.setID(id1);
                p.setNombre(nombre1);
                p.setExistencia(existencia1);
                p.setPrecio(precio1);
                p.setCaducidad(caducidad1);
                p.setMarca(marca1);
                p.setCategoria(categoria1);
                dao.actualizar(p);
                request.getRequestDispatcher("Controlador?accion=Listar").forward(request, response);
                break;
            case "Eliminar":
                String id2=request.getParameter("id");
                dao.eliminar(id2);
                request.getRequestDispatcher("Controlador?accion=Listar").forward(request, response);
                 break;
            case "Buscar":
                String dato=request.getParameter("ingresoBuscar");
                List <Producto> lista = dao.buscar(dato);
                request.setAttribute("datos", lista);
                request.getRequestDispatcher("productoindex.jsp").forward(request, response);
                break;
           default: throw new AssertionError();
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
