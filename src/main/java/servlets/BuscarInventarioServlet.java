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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombreProducto = request.getParameter("nombreProducto");
        String categoria = request.getParameter("categoria");

        List<String[]> productos = new ArrayList<>();
        String error = null;
        boolean busquedaRealizada = false;

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Usar la conexión de tu clase ConexionDB
            conn = ConexionDB.getConnection();

            StringBuilder query = new StringBuilder("SELECT id, nombre, descripcion, precio, categoria FROM productos WHERE 1=1");

            if (nombreProducto != null && !nombreProducto.trim().isEmpty()) {
                query.append(" AND nombre LIKE ?");
            }
            if (categoria != null && !categoria.trim().isEmpty()) {
                query.append(" AND categoria LIKE ?");
            }

            System.out.println("Consulta SQL: " + query.toString()); // Impresión para depuración

            stmt = conn.prepareStatement(query.toString());

            int paramIndex = 1;
            if (nombreProducto != null && !nombreProducto.trim().isEmpty()) {
                stmt.setString(paramIndex++, "%" + nombreProducto + "%");
            }
            if (categoria != null && !categoria.trim().isEmpty()) {
                stmt.setString(paramIndex++, "%" + categoria + "%");
            }

            rs = stmt.executeQuery();

            if (!rs.isBeforeFirst()) {
                System.out.println("No se encontraron productos.");
            } else {
                while (rs.next()) {
                    System.out.println("Producto encontrado: " + rs.getString("nombre")); // Impresión para depuración
                    String[] producto = new String[5];
                    producto[0] = String.valueOf(rs.getInt("id"));
                    producto[1] = rs.getString("nombre");
                    producto[2] = rs.getString("descripcion");
                    producto[3] = String.valueOf(rs.getDouble("precio"));
                    producto[4] = rs.getString("categoria");
                    productos.add(producto);
                }
            }

            busquedaRealizada = true;
        } catch (SQLException e) {
            error = "Error al buscar productos: " + e.getMessage();
        } finally {
            // Cerrar ResultSet, PreparedStatement y la conexión de forma segura
            try { if (rs != null) rs.close(); } catch (SQLException ignored) {}
            try { if (stmt != null) stmt.close(); } catch (SQLException ignored) {}
            try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
        }

        // Enviar los datos a la JSP
        request.setAttribute("productos", productos);
        request.setAttribute("error", error);
        request.setAttribute("busquedaRealizada", busquedaRealizada);
        request.getRequestDispatcher("buscar_inventario.jsp").forward(request, response);
    }
}
