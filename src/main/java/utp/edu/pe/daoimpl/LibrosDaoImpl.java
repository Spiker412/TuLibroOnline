package utp.edu.pe.daoimpl;

import utp.edu.pe.dao.LibrosDao;
import utp.edu.pe.model.Libros;
import utp.edu.pe.config.Conexion;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LibrosDaoImpl implements LibrosDao {

    @Override
    public boolean registrar(Libros libro) {
        String sql = "INSERT INTO libros (titulo, autor, precio, stock, categoria, imagen_url) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection cn = Conexion.getConnection();
             PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setString(1, libro.getTitulo());
            ps.setString(2, libro.getAutor());
            ps.setBigDecimal(3, libro.getPrecio());
            ps.setInt(4, libro.getStock());
            ps.setString(5, libro.getCategoria());
            ps.setString(6, libro.getImagenUrl());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean actualizar(Libros libro) {
        String sql = "UPDATE libros SET titulo=?, autor=?, precio=?, stock=?, categoria=?, imagen_url=? WHERE id=?";
        try (Connection cn = Conexion.getConnection();
             PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setString(1, libro.getTitulo());
            ps.setString(2, libro.getAutor());
            ps.setBigDecimal(3, libro.getPrecio());
            ps.setInt(4, libro.getStock());
            ps.setString(5, libro.getCategoria());
            ps.setString(6, libro.getImagenUrl());
            ps.setLong(7, libro.getId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean eliminar(long id) {
        String sql = "DELETE FROM libros WHERE id=?";
        try (Connection cn = Conexion.getConnection();
             PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setLong(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Libros buscarPorId(long id) {
        String sql = "SELECT * FROM libros WHERE id=?";
        try (Connection cn = Conexion.getConnection();
             PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Libros(
                        rs.getLong("id"),
                        rs.getString("titulo"),
                        rs.getString("autor"),  
                        rs.getBigDecimal("precio"),
                        rs.getInt("stock"),
                        rs.getString("categoria"),
                        rs.getString("imagen_url")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Libros> listarTodos() {
        List<Libros> lista = new ArrayList<>();
        String sql = "SELECT * FROM libros";
        try (Connection cn = Conexion.getConnection();
             Statement st = cn.createStatement(); 
             ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {
                Libros libro = new Libros(
                        rs.getLong("id"),
                        rs.getString("titulo"),
                        rs.getString("autor"),
                        rs.getBigDecimal("precio"),
                        rs.getInt("stock"),
                        rs.getString("categoria"),
                        rs.getString("imagen_url")
                );
                lista.add(libro);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }
}
