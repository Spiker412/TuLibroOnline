package utp.edu.pe.dao;

import utp.edu.pe.model.Usuario;

public interface UsuarioDao {
    boolean registrar(Usuario usuario); 
    Usuario login(String email, String password); 
    boolean existeEmail(String email); 
}
