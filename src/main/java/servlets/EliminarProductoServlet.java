package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import DB.ConexionDB;

@WebServlet("/EliminarProductoServlet")
public class EliminarProductoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void init() throws ServletException {
        try {
            // Cargar el driver JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ServletException("No se pudo cargar el driver JDBC", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProductoStr = request.getParameter("id");
        String mensaje = "";

        if (idProductoStr != null && !idProductoStr.isEmpty()) {
            try (Connection connection = ConexionDB.getConnection()) {
                // Verificar si el producto existe
                String sqlSelect = "SELECT id FROM productos WHERE id = ?";
                PreparedStatement statementSelect = connection.prepareStatement(sqlSelect);
                statementSelect.setInt(1, Integer.parseInt(idProductoStr));
                
                ResultSet resultSet = statementSelect.executeQuery();
                
                if (resultSet.next()) {
                    // El producto existe, proceder con la eliminación
                    String sqlDelete = "DELETE FROM productos WHERE id = ?";
                    PreparedStatement statementDelete = connection.prepareStatement(sqlDelete);
                    statementDelete.setInt(1, Integer.parseInt(idProductoStr));
                    
                    int filasEliminadas = statementDelete.executeUpdate();
                    if (filasEliminadas > 0) {
                        mensaje = "<h3 style='color: green;'>Producto eliminado exitosamente.</h3>";
                    } else {
                        mensaje = "<h3 style='color: red;'>Error al eliminar el producto.</h3>";
                    }
                    statementDelete.close();
                } else {
                    // El producto no existe
                    mensaje = "<h3 style='color: red;'>Producto no encontrado.</h3>";
                }
                
                resultSet.close();
                statementSelect.close();
                
            } catch (SQLException e) {
                e.printStackTrace();
                mensaje = "<h3 style='color: red;'>Error al procesar la solicitud: " + e.getMessage() + "</h3>";
            }
        } else {
            mensaje = "<h3 style='color: red;'>ID del producto no válido.</h3>";
        }

        // Enviar mensaje a la página JSP
        request.setAttribute("mensaje", mensaje);
        request.getRequestDispatcher("eliminacion_producto.jsp").forward(request, response);
    }
}
