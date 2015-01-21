<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.*" %>
<%@page import="java.util.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>.:Programando con Café - Carrito de Compras - Ing. Henry Wong</title>
    </head>
    <body>
        <h1>Programando con Café<br>Ing. Henry Joe Wong Urquiza</h1>
        <div>
            <a href="index.jsp">Inicio</a> |
            <a href="registrarProducto.jsp">Registrar Producto</a> |
            <a href="registrarVenta.jsp">Registrar Venta</a> |
            <a href="verVentas.jsp">Consultar Ventas</a> |
            <a href="Reporte">Reporte Producto</a>
        </div>
        <br >
        <%-- En el action del formulario le decimos que llama al Controlador --%>
        <form method="post" action="Controlador">
            <div>
                <input type="hidden" name="accion" value="RegistrarProducto" />
                <table border="1">
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" name="txtNombre" value="" /></td>
                    </tr>
                    <tr>
                        <td>Precio</td>
                        <td><input type="text" name="txtPrecio" value="0" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Registrar" name="btnRegistrar" /></td>
                    </tr>
                </table>
            </div>
        </form>

    </body>
</html>
