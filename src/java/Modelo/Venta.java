package Modelo;

// @author hwong
import java.sql.Timestamp;

public class Venta {
    //Las columnas que tiene la tabla Venta

    private int codigoVenta;
    private String cliente;
    private Timestamp fecha;
    //Constructor de la clase sin parametros

    public Venta() {
    }
    //Constructor de la clase con parametros

    public Venta(int codigoVenta, String cliente, Timestamp fecha) {
        this.codigoVenta = codigoVenta;
        this.cliente = cliente;
        this.fecha = fecha;
    }
    //Metodos get y set de la clase

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public int getCodigoVenta() {
        return codigoVenta;
    }

    public void setCodigoVenta(int codigoVenta) {
        this.codigoVenta = codigoVenta;
    }

    public Timestamp getFecha() {
        return fecha;
    }

    public void setFecha(Timestamp fecha) {
        this.fecha = fecha;
    }

}
