
package utp.edu.pe.dao;

import utp.edu.pe.model.Libros;
import java.util.List;

public interface LibrosDao {
    boolean registrar(Libros libro);
    boolean actualizar(Libros libro);
    boolean eliminar(long id);
    Libros buscarPorId(long id);
    List<Libros> listarTodos();
}


