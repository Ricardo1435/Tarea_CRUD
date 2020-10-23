<%-- 
    Document   : productoindex
    Created on : 19/10/2020, 06:41:40 PM
    Author     : Ricardo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>      
        <!-- Enlazando a los archivos de JS y CSS-->
        <link href="CSS/estilos.css" rel="stylesheet">
        <script src="JS/funciones.js"></script>
        <title>Productos</title>
    </head>
    <body>
        <!-- Barra de Navegacion -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <a class="navbar-brand"> <i class="fas fa-store" ></i>&nbsp;&nbsp;TIENDA "LA ESQUINITA"</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link">Productos <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="index.html">Inicio <span class="sr-only">(current)</span></a>
                        </li>
                         <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              Más
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                             <a class="dropdown-item"> 
                                   <a class="dropdown-item" href="add.jsp">Ingresar Productos <i class="fas fa-pencil-alt"></i></a>
                             </a>
                            </div>
                        </li>
                    </ul>
                </div>
        </nav>
        
        <div class="container m-auto">
            <div class="navbar">
                <a class="btn btn-outline-success btn-bg my-3 mx-1" id="new" name="accion" value="Nuevo" href="add.jsp">Nuevo</a>
               <form class="form-inline" action="Controlador" method="POST">
                   <input type="search" class="form-control" name="ingresoBuscar">
                   <input type="submit" name="accion" value="Buscar" id="btnBuscar" class="btn btn-outline-success">
               </form>
              </div>
            </div>
        
        </div>
        <!-- Tabla-->
        <div class="p-4">
            <table class="table table-striped m-auto">
                <thead class="thead-dark" >
                <tr>
                 <th scope="col"><center>ID</center></th>
                 <th scope="col"><center>NOMBRE</center></th>
                 <th scope="col"><center>MARCA</center></th>
                 <th scope="col"><center>CATEGORIA</center></th>
                 <th scope="col"><center>EXISTENCIA</center></th>
                 <th scope="col"><center>PRECIO</center></th>
                 <th scope="col"><center>CADUCIDAD</center></th>
                 <th scope="col"><center>OPCIONES</center></th>
                </tr>
              </thead>
                <tbody id="tabla">
                    <c:forEach var="dato" items="${datos}">
                        <tr>
                            <td><center>${dato.getID()}</center></td>
                            <td><center>${dato.getNombre()}</center></td>
                            <td><center>${dato.getMarca()}</center></td>
                            <td><center>${dato.getCategoria()}</center></td>
                            <td><center>${dato.getExistencia()}</center></td>
                            <td><center>Q.  ${dato.getPrecio()}</center></td>
                            <td><center>${dato.getCaducidad()}</center></td>
                            <td>
                            <center> 
                                <form action="Controlador" method="POST">
                                <input type="hidden" name="id" value="${dato.getID()}">
                                <button class="btn btn-warning" type="submit" name="accion" value="Editar">Editar&nbsp;<i class="fas fa-edit"></i></button>
                                <button class="btn btn-danger" type="submit" name="accion" value="Eliminar">Borrar &nbsp;<i class="fas fa-eraser"></i></button>
                                </form>
                            </center>    
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <form action="Controlador" method="POST">
             <button type="submit" class="btn btn-primary my-3" id="btnListar" name="accion" value="Listar" title="Mostrar Alumnos"><i class="fas fa-clipboard-list fa-3x"></i></button>
             <p id="msjTexto2" class="alert alert-success" role="alert" style="display : none "></p>
           </form>
        </div>
         <!-- Seccion Final de la Página -->
       <div id="copyRight">
             <center>© Copyright RICANTOG</center>
        </div> 
    </body>
</html>
