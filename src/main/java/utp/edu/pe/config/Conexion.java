
package utp.edu.pe.config;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Conexion {

    public static final String username = "root";
    public static final String password = "";
    public static final String database = "librosd";
    public static final String url = "jdbc:mysql://localhost:3305/" + database;

    public static Connection getConnection() {
        Connection cn = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            cn = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }

        return cn;
    }
}
