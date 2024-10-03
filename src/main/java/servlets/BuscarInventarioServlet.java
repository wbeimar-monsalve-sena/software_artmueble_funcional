package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import DB.ConexionDB;

@WebServlet("/BuscarInventarioServlet")
public class BuscarInventarioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ServletException("No se pudo cargar el driver JDBC", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombreProducto = request.getParameter("nombreProducto");
        String categoria = request.getParameter("categoria");

        List<String[]> productos = new ArrayList<>();
        boolean busquedaRealizada = false;

        try (Connection conn = ConexionDB.getConnection()) {
            if (nombreProducto != null && !nombreProducto.isEmpty()) {
                productos = buscarPorNombre(conn, nombreProducto);
                busquedaRealizada = true;
            }
            if (categoria != null && !categoria.isEmpty()) {
                productos = buscarPorCategoria(conn, categoria);
                busquedaRealizada = true;
            }
            if (productos.isEmpty()) {
                productos = listarTodoInventario(conn);
                busquedaRealizada = true;
            }

            request.setAttribute("productos", productos);
            request.setAttribute("busquedaRealizada", busquedaRealizada);
            request.getRequestDispatcher("consulta_inventario.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Ocurrió un error al realizar la búsqueda.");
            request.getRequestDispatcher("consulta_inventario.jsp").forward(request, response);
        }
    }

    private List<String[]> listarTodoInventario(Connection conn) throws SQLException {
        String query = "SELECT i.id, p.nombre AS nombre_producto, i.cantidad, p.categoria FROM inventario i JOIN productos p ON i.producto_id = p.id";
        return ejecutarConsulta(conn, query, null);
    }

    private List<String[]> buscarPorNombre(Connection conn, String nombreProducto) throws SQLException {
        String query = "SELECT i.id, p.nombre AS nombre_producto, i.cantidad, p.categoria FROM inventario i JOIN productos p ON i.producto_id = p.id WHERE p.nombre LIKE ?";
        return ejecutarConsulta(conn, query, "%" + nombreProducto + "%");
    }

    private List<String[]> buscarPorCategoria(Connection conn, String categoria) throws SQLException {
        String query = "SELECT i.id, p.nombre AS nombre_producto, i.cantidad, p.categoria FROM inventario i JOIN productos p ON i.producto_id = p.id WHERE p.categoria = ?";
        return ejecutarConsulta(conn, query, categoria);
    }

    private List<String[]> ejecutarConsulta(Connection conn, String query, String parametro) throws SQLException {
        List<String[]> productos = new ArrayList<>();
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            if (parametro != null) {
                stmt.setString(1, parametro);
            }
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String[] producto = new String[4];
                    producto[0] = String.valueOf(rs.getInt("id"));
                    producto[1] = rs.getString("nombre_producto");
                    producto[2] = String.valueOf(rs.getInt("cantidad"));
                    producto[3] = rs.getString("categoria");
                    productos.add(producto);
                }
            }
        }
        return productos;
    }
}
