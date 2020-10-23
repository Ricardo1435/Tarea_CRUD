<%-- 
    Document   : add
    Created on : 22/10/2020, 09:59:54 AM
    Author     : Ricardo
--%>

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
        <script src="JS/funciones.js"></script>
        <link href="CSS/estilos.css" rel="stylesheet">
        <title>Agregar Productos</title>
    </head>
    <body>
         <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <a class="navbar-brand" href="#"> <i class="fas fa-store" ></i>&nbsp;&nbsp;TIENDA "LA ESQUINITA"</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link">Ingreso de Productos <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="index.html">Inicio <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="productoindex.jsp">Productos <span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                </div>
        </nav>
        
        <!-- Formulario -->
        <form class="bg-light container-md mt-5 mb-5 " action="Controlador" method="POST">
            <center><h2 class="mt-2 mb-2"> INGRESO DE PRODUCTOS &nbsp;&nbsp;&nbsp;<i class="fas fa-edit"></i></h2> </center>
            <div>
                <b><label for="ingresoID">ID</label></b>
                <input type="text" autocomplete="off" class="form-control" name="ingresoID" placeholder="Ingrese ID del producto" required="">
            </div>
            <div>
                <b><label for="ingresoNombre" class="mt-2">Nombre</label></b>
                <input type="text" autocomplete="off" class="form-control" name="ingresoNombre" placeholder="Ingrese el nombre del producto" required="">
            </div>
            <div>
                <b><label for="ingresoExistencia" class="mt-2">Cantidad en existencia</label></b>
                <input type="text" autocomplete="off" class="form-control" name="ingresoExistencia" placeholder="Ingrese la cantidad de existencia (en números)" required>
            </div>
            <div>
                <b><label for="ingresoPrecio" class="mt-2">Precio</label></b>
                <input type="text" autocomplete="off" class="form-control" name="ingresoPrecio" placeholder="Ingrese precio del producto (en números)" required>
            </div>
            <div>
                <b><label for="ingresoCaducidad" autocomplete="off" class="mt-2">Fecha de caducidad</label></b>
                <input type="text" class="form-control" name="ingresoCaducidad" placeholder="Ingrese fecha de caducidad de producto (no es obligatorio)">
            </div>
           <div>
            <b><label for="ingresoMarca" class="mt-2">Marca</label></b>
            <select class="custom-select" name="ingresoMarca" id="ingresoMarca" required>
                <option value="1" >Toledo</option>
                <option value="2" >Perry</option>
                <option value="3" >Dove</option>
                <option value="4" >Colgate</option>
                <option value="5" >Gallo</option>
                <option value="6" >B&B</option>
                <option value="7" >Suli</option>
                <option value="8" >Rosal</option>
                <option value="9" >Mazola</option>
                <option value="10" >Olmeca</option>
                <option value="11" >La jarrillita</option>
                <option value="12" >Incasa</option>
                <option value="13" >Club Extra</option>
                <option value="14" >Soda</option>
                <option value="15" >Chicky</option>
                <option value="16" >Coca Cola</option>
                <option value="17" >Pepsi</option>
                <option value="18" >Sprite</option>
                <option value="19" >Tampico</option>
                <option value="20" >De la Granja</option>
                <option value="21" >Laky</option>
                <option value="22" >Maruchan</option>
                <option value="23" >Foremost</option>
                <option value="24" >Fogata</option>
                <option value="25" >Bimbo</option>
            </select>
            </div>
            <div>
            <b><label for="ingresoCategoria" class="mt-2">Categoria</label></b>
            <select class="custom-select" name="ingresoCategoria" id="ingresoCategoria" required>
                <option value="1" >Bebidas</option>
                <option value="2" >Alimentos</option>
                <option value="3" >Embutidos</option>
                <option value="4" >Miscelaneos</option>
            </select>
            </div>
            <button type="submit" class="btn btn-primary my-3" id="btnGuardar" name="accion" value="Guardar">Guardar &nbsp;&nbsp;<i class="fas fa-save"></i></button> 
           <a href="productoindex.jsp"> <input type="button" value="Cancelar" class="btn btn-danger" id="btnCancelar"></a> 
        </form>
        
           <!-- Seccion Final de la Página -->
        <div id="copyRight">
             <center>© Copyright RICANTOG</center>
        </div> 
    </body>
</html>
