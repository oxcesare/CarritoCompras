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
            <form method="post" action="Controlador">
                <%-- Llamamos a la accion Registrar Venta --%>
                <input type="hidden" name="accion" value="RegistrarVenta" />
                <table border="1">
                        <tr style="background-color: chocolate">
                            <td colspan="5">Carrito de Compras</td>
                        </tr>
                        <tr style="background-color: chocolate">
                            <td>Cliente:</td>
                            <td colspan="4"><input type="text" name="txtCliente" value="" /></td>
                        </tr>
                        <tr style="background-color: chocolate">
                            <td>Nombre</td>
                            <td>Precio</td>
                            <td>Cantidad</td>
                            <td>Descuento</td>
                            <td>Sub. Total</td>
                        </tr>
                        <%-- Los productos que tenemos en la sesion que se llama carrito --%>
                        <%
                                    ArrayList<DetalleVenta> lista = (ArrayList<DetalleVenta>)session.getAttribute("carrito");
                                    if(lista!=null){
                                        for (DetalleVenta d : lista) {
                        %>
                                        <tr>
                                            <td><%= d.getProducto()%></td>
                                            <td><%= d.getProducto().getPrecio()%></td>
                                            <td><%= d.getCantidad()%></td>
                                            <td><%= d.getDescuento()%></td>
                                            <td><%= (d.getProducto().getPrecio() * d.getCantidad())-d.getDescuento()%></td>
                                        </tr>
                        <%
                                        }
                                    }
                        %>
                        <tr >
                            <td colspan="5"><input type="submit" value="Registrar Venta" name="btnVenta" /></td>
                        </tr>
                    </table>
                </form>
        </div>


    </body>
</html>
