package utp.edu.pe.util;

import java.util.regex.Pattern;

public class Validaciones {

    
    public static boolean emailValido(String email) {
        if (email == null) return false;
        // Regex simple para emails
        String regex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        return Pattern.matches(regex, email);
    }

    
    public static boolean passwordValida(String password) {
        if (password == null) return false;
        return password.length() >= 6;
    }
}
