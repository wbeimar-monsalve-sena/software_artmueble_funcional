package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import DB.ConexionDB;

@WebServlet("/RegistroProductoServlet")
public class RegistroProductoServlet extends HttpServlet {
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
        // Obtener los parámetros del formulario
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String precioStr = request.getParameter("precio");
        String categoria = request.getParameter("categoria");

        double precio = 0;
        try {
            precio = Double.parseDouble(precioStr);
        } catch (NumberFormatException e) {
            request.setAttribute("mensaje", "Error: Precio inválido.");
            request.getRequestDispatcher("registro_productos.jsp").forward(request, response);
            return;
        }

        try {
            // Obtener la conexión a la base de datos desde la clase ConexionDB
            Connection connection = ConexionDB.getConnection();

            // Preparar la consulta SQL para insertar un nuevo producto
            String sql = "INSERT INTO productos (nombre, descripcion, precio, categoria) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nombre);
            statement.setString(2, descripcion);
            statement.setDouble(3, precio);
            statement.setString(4, categoria);

            // Ejecutar la inserción
            int filasInsertadas = statement.executeUpdate();

            // Cerrar la conexión
            statement.close();
            connection.close();

            // Configurar el mensaje de éxito
            if (filasInsertadas > 0) {
                request.setAttribute("mensaje", "¡Registro exitoso!");
            } else {
                request.setAttribute("mensaje", "Error al registrar el producto.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("mensaje", "Error al registrar el producto: " + e.getMessage());
        }
        
        // Redirigir a la página de registro de productos
        request.getRequestDispatcher("registro_productos.jsp").forward(request, response);
    }
}
