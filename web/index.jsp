<%-- Importaciones que son necesarias para que se muestre el JSP --%>
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
            <%-- Menu de opciones --%>
            <a href="index.jsp">Inicio</a> |
            <a href="registrarProducto.jsp">Registrar Producto</a> |
            <a href="registrarVenta.jsp">Registrar Venta</a> |
            <a href="verVentas.jsp">Consultar Ventas</a> |
            <a href="Reporte">Reporte Producto</a>
        </div>
        <br >
        <div>
            <table border="1">
                <tr style="background-color: chocolate">
                    <td colspan="4">Lista de Productos</td>

                </tr>
                <tr style="background-color: chocolate">
                    <td>Codigo</td>
                    <td>Nombre</td>
                    <td>Precio</td>
                    <td>Proceso</td>
                </tr>
                <%-- Lista de todos los productos --%>
                <%
                            ArrayList<Producto> lista = ProductoBD.obtenerProducto();
                            for (Producto p : lista) {
                %>
                <tr>
                    <td><%= p.getCodigoProducto()%></td>
                    <td><%= p.getNombre()%></td>
                    <td><%= p.getPrecio()%></td>
                    <%-- Enlaces a las paginas de actualizar o anadir al carrito --%>
                    <td><a href="actualizarProducto.jsp?id=<%= p.getCodigoProducto()%>">Modificar</a> |
                        <a href="anadirCarrito.jsp?id=<%= p.getCodigoProducto()%>">Añadir</a>
                    </td>
                </tr>
                <%
                            }
                %>

            </table>
        </div>


    </body>
</html>
