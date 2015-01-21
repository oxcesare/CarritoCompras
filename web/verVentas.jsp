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
        <div>
            <table border="1">
                <tr style="background-color: chocolate">
                    <td colspan="6">Lista de Ventas</td>

                </tr>
                <tr style="background-color: chocolate">
                    <td>Cod. Venta</td>
                    <td>Producto</td>
                    <td>Precio</td>
                    <td>Cantidad</td>
                    <td>Descuento</td>
                    <td>Sub. Total</td>
                </tr>
                <%
                            ArrayList<DetalleVenta> lista = VentaBD.obtenerVentas();
                            for (DetalleVenta d : lista) {
                %>
                <tr>
                    <td><%= d.getVenta().getCodigoVenta()%></td>
                    <td><%= d.getProducto()%></td>
                    <td><%= d.getProducto().getPrecio()%></td>
                    <td><%= d.getCantidad()%></td>
                    <td><%= d.getDescuento()%></td>
                    <td><%= (d.getProducto().getPrecio()*d.getCantidad())-d.getDescuento()%></td>
                </tr>
                <%
                            }
                %>

            </table>
        </div>


    </body>
</html>
