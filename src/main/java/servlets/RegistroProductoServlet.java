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
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body><h3>Error: Precio inválido.</h3></body></html>");
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

            // Configurar el tipo de contenido para la respuesta
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            // Verificar si la inserción fue exitosa
            if (filasInsertadas > 0) {
                out.println("<html><body><h3>¡Registro exitoso!</h3></body></html>");
            } else {
                out.println("<html><body><h3>Error al registrar el producto</h3></body></html>");
            }

            // Cerrar la conexión
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body><h3>Error al registrar el producto: " + e.getMessage() + "</h3></body></html>");
        }
    }
}
