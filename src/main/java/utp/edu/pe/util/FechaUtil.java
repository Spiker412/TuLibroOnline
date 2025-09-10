package utp.edu.pe.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class FechaUtil {

    // Devuelve fecha en formato dd/MM/yyyy
    public static String formatearFecha(Date fecha) {
        if(fecha == null) return "";
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        return sdf.format(fecha);
    }

    // Devuelve fecha y hora en formato dd/MM/yyyy HH:mm:ss
    public static String formatearFechaHora(Date fecha) {
        if(fecha == null) return "";
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        return sdf.format(fecha);
    }
}
