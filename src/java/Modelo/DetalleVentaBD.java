package Modelo;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

// @autor Henry Joe Wong Uruqiza
// Archivo: DetalleVentaBD.java
// Creado: 24FEBRERO2011 12:39:08 PM
public class DetalleVentaBD {

    //Metodo utilizado para insertar un Detalle de Venta a nuestra Base de datos
    //Obtenemos la conexion de Venta debido a que la clase Venta es la que inicia
    //la transaccion
    public static synchronized boolean insertarDetalleVenta(DetalleVenta varDetalle, Connection cn) {
        CallableStatement cl = null;
        boolean rpta = false;
        try {
            //Nombre del procedimiento almacenado y como espera tres parametros
            //le ponemos 3 interrogantes
            String call = "{CALL spI_detalleventa(?,?,?,?)}";
            //Preparamos la sentecia
            cl = cn.prepareCall(call);
            //Codigo de la venta
            cl.setInt(1, varDetalle.getCodigoVenta());
            //Codigo del producto
            cl.setInt(2, varDetalle.getCodigoProducto());
            //La cantidad
            cl.setDouble(3, varDetalle.getCantidad());
            //El descuento
            cl.setDouble(4, varDetalle.getDescuento());
            //Ejecutamos la sentencia y si nos devuelve el valor de 1 es porque
            //registro de forma correcta los datos
            rpta = cl.executeUpdate() == 1 ? true : false;
            Conexion.cerrarCall(cl);
        } catch (SQLException e) {
            e.printStackTrace();
            Conexion.cerrarCall(cl);
        } catch (Exception e) {
            e.printStackTrace();
            Conexion.cerrarCall(cl);
        }
        return rpta;
    }
}
