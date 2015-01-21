package Modelo;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;

// @autor Henry Joe Wong Uruqiza
// Archivo: VentaBD.java
// Creado: 24FEBRERO2011 12:39:08 PM
public class VentaBD {

    //Metodo utilizado para insertar una Venta a nuestra Base de datos
    public static synchronized boolean insertarVenta(Venta varventa, ArrayList<DetalleVenta> detalle) {

        Connection cn = null;
        CallableStatement cl = null;
        boolean rpta = false;
        try {
            //Nombre del procedimiento almacenado y como espera tres parametros
            //le ponemos 3 interrogantes
            String call = "{CALL spI_venta(?,?)}";
            //Obtenemos la conexion
            cn = Conexion.getConexion();
            //Decimos que vamos a crear una transaccion
            cn.setAutoCommit(false);
            //Preparamos la sentecia
            cl = cn.prepareCall(call);
            //Como el codigo se autogenera y es del tipo OUT en el procedimiento
            //almacenado le decimos que es OUT y el del tipo Integer en Java
            cl.registerOutParameter(1, Types.INTEGER);
            //El siguiente parametro del procedimiento almacenado es el cliente
            cl.setString(2, varventa.getCliente());
            //Ejecutamos la sentencia y si nos devuelve el valor de 1 es porque
            //registro de forma correcta los datos
            rpta = cl.executeUpdate() == 1 ? true : false;
            //Codigo que se genero producto de la insercion ---> codigoVenta
            varventa.setCodigoVenta(cl.getInt(1));
            if (rpta) {
                for (DetalleVenta det : detalle) {
                    //Establecemos al detalle el codigo genero producto de la venta
                    det.setCodigoVenta(varventa.getCodigoVenta());
                    //Insertamos el detalle y le pasamos la conexion
                    rpta = DetalleVentaBD.insertarDetalleVenta(det, cn);
                    //Si nos devuelve false salimos del for
                    if (!rpta) {
                        break;
                    }
                }
                if (rpta) {
                    //Confirmamos la transaccion
                    cn.commit();
                } else {
                    //Negamos la transaccion
                    Conexion.deshacerCambios(cn);
                }
            } else {
                //Negamos la transaccion
                Conexion.deshacerCambios(cn);
            }
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        } catch (SQLException e) {
            e.printStackTrace();
            Conexion.deshacerCambios(cn);
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        } catch (Exception e) {
            e.printStackTrace();
            Conexion.deshacerCambios(cn);
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        }
        return rpta;
    }

    //Metodo utilizado para obtener todos los productos de nuestra base de datos
    public static synchronized ArrayList<DetalleVenta> obtenerVentas() {
        //El array que contendra todos nuestros productos
        ArrayList<DetalleVenta> lista = new ArrayList<DetalleVenta>();
        Connection cn = null;
        CallableStatement cl = null;
        ResultSet rs = null;
        try {
            //Nombre del procedimiento almacenado
            String call = "{CALL spF_venta_All()}";
            cn = Conexion.getConexion();
            cl = cn.prepareCall(call);
            //La sentencia lo almacenamos en un resulset
            rs = cl.executeQuery();
            //Consultamos si hay datos para recorrerlo
            //e insertarlo en nuestro array
            while (rs.next()) {
                Venta ven=new Venta();
                Producto pro=new Producto();
                DetalleVenta det=new DetalleVenta();
                ven.setCodigoVenta(rs.getInt("CodigoVenta"));
                ven.setCliente(rs.getString("Cliente"));
                ven.setFecha(rs.getTimestamp("Fecha"));
                pro.setCodigoProducto(rs.getInt("CodigoProducto"));
                pro.setNombre(rs.getString("Nombre"));
                pro.setPrecio(rs.getDouble("Precio"));
                det.setCantidad(rs.getDouble("Cantidad"));
                det.setDescuento(rs.getDouble("Descuento"));
                det.setVenta(ven);
                det.setProducto(pro);
                lista.add(det);
            }
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        } catch (SQLException e) {
            e.printStackTrace();
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        } catch (Exception e) {
            e.printStackTrace();
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        }
        return lista;
    }
}
