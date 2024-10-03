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

@WebServlet("/ActualizarProductoServlet")
public class ActualizarProductoServlet extends HttpServlet {
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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProductoStr = request.getParameter("idProducto");
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String precioStr = request.getParameter("precio");
        String categoria = request.getParameter("categoria");
        String mensaje = "";

        if (idProductoStr != null && !idProductoStr.isEmpty()) {
            try {
                Connection connection = ConexionDB.getConnection();

                if (nombre != null && !nombre.isEmpty()) {
                    // Actualizar producto
                    String sqlUpdate = "UPDATE productos SET nombre = ?, descripcion = ?, precio = ?, categoria = ? WHERE id = ?";
                    PreparedStatement statementUpdate = connection.prepareStatement(sqlUpdate);
                    statementUpdate.setString(1, nombre);
                    statementUpdate.setString(2, descripcion);
                    
                    double precio = 0.0;
                    if (precioStr != null && !precioStr.trim().isEmpty()) {
                        try {
                            precio = Double.parseDouble(precioStr);
                        } catch (NumberFormatException e) {
                            mensaje = "<h3 style='color: red;'>Precio no válido</h3>";
                        }
                    }
                    statementUpdate.setDouble(3, precio);
                    statementUpdate.setString(4, categoria);
                    statementUpdate.setInt(5, Integer.parseInt(idProductoStr));

                    int filasActualizadas = statementUpdate.executeUpdate();
                    if (filasActualizadas > 0) {
                        mensaje = "<h3 style='color: green;'>Actualización exitosa</h3>";
                    } else {
                        mensaje = "<h3 style='color: red;'>Error al actualizar el producto</h3>";
                    }
                    statementUpdate.close();
                } else {
                    // Buscar producto
                    String sqlSelect = "SELECT nombre, descripcion, precio, categoria FROM productos WHERE id = ?";
                    PreparedStatement statementSelect = connection.prepareStatement(sqlSelect);
                    statementSelect.setInt(1, Integer.parseInt(idProductoStr));
                    
                    ResultSet resultSet = statementSelect.executeQuery();
                    
                    if (resultSet.next()) {
                        // Producto encontrado
                        nombre = resultSet.getString("nombre");
                        descripcion = resultSet.getString("descripcion");
                        precioStr = String.valueOf(resultSet.getDouble("precio"));
                        categoria = resultSet.getString("categoria");
                    } else {
                        mensaje = "<h3 style='color: red;'>Producto no encontrado</h3>";
                    }
                    resultSet.close();
                    statementSelect.close();
                }

                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
                mensaje = "<h3 style='color: red;'>Error al procesar la solicitud: " + e.getMessage() + "</h3>";
            }
        } else {
            mensaje = "<h3 style='color: red;'>ID del producto no válido</h3>";
        }

        // Mostrar el formulario con los datos del producto (si se encontraron) o mensaje
        request.setAttribute("mensaje", mensaje);
        request.setAttribute("nombre", nombre);
        request.setAttribute("descripcion", descripcion);
        request.setAttribute("precio", precioStr);
        request.setAttribute("categoria", categoria);
        request.getRequestDispatcher("actualizacion_productos.jsp").forward(request, response);
    }
}
