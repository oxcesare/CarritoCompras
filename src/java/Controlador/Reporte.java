package Controlador;

import Modelo.Conexion;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JasperManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

//@autor Henry Joe Wong Urquiza
public class Reporte extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        createReport(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        createReport(request, response);
    }

    protected void createReport(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Mostrar el reporte en formato PDF
        response.setContentType("application/pdf");
        java.sql.Connection cn;
        try {
            cn = Conexion.getConexion();
            //El que obtiene el diseño del reporte
            JasperReport jasperReport = null;
            Map parameterMap = new HashMap();
            //La direccion del reporte
            String reporteJasper = request.getSession().getServletContext().getRealPath("reporte/reporteDeVentas.jasper");
            //Cargamos el reporte
            jasperReport = JasperManager.loadReport(new FileInputStream(reporteJasper));
            //Llenamos con informacion al reporte
            JasperPrint jasperPrint = JasperManager.fillReport(jasperReport, parameterMap, cn);
            OutputStream oS = null;
            oS = response.getOutputStream();
            //Y lo convertimos a PDF el reporte
            JasperManager.printReportToPdfStream(jasperPrint, oS);
            cn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        }


    }
}
