<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.*" %>
<%@page import="java.util.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%-- Obtenemos el id o el codigo del producto que deseamos añadir al carrito --%>
<%
    Producto p=ProductoBD.obtenerProducto(Integer.parseInt(request.getParameter("id")));
%>
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
        <form method="post" action="Controlador">
            <div>
                <input type="hidden" name="accion" value="AnadirCarrito" />
                <table border="1">
                    <tr>
                        <td>Codigo</td>
                        <td><input type="text" name="txtCodigo" value="<%= p.getCodigoProducto()%>" readonly /></td>
                    </tr>
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" name="txtNombre" value="<%= p.getNombre()%>" readonly /></td>
                    </tr>
                    <tr>
                        <td>Precio</td>
                        <td><input type="text" name="txtPrecio" value="<%= p.getPrecio()%>" readonly /></td>
                    </tr>
                    <tr>
                        <td>Cantidad Pedir</td>
                        <td><input type="text" name="txtCantidad" value="0" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Añadir" name="btnAnadir" /></td>
                    </tr>
                </table>
            </div>
        </form>

    </body>
</html>
