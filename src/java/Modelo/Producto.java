package Modelo;

//@author Henry Joe Wong Urquiza
 
public class Producto {
    //Las columnas que tiene la tabla Producto
    private int codigoProducto;
    private String nombre;
    private double precio;
    //Constructor de la clase sin parametros
    public Producto() {
    }
    //Constructor de la clase con parametros
    public Producto(int codigoProducto, String nombre, double precio) {
        this.codigoProducto = codigoProducto;
        this.nombre = nombre;
        this.precio = precio;
    }
    //Metodo toString de la clase que nos retorna
    //el nombre del producto
    @Override
    public String toString() {
        return nombre.toUpperCase();
    }
    //Metodos get y set de la clase
    public int getCodigoProducto() {
        return codigoProducto;
    }

    public void setCodigoProducto(int codigoProducto) {
        this.codigoProducto = codigoProducto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }



}
