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

@WebServlet("/ServletRegistroUsuario")
public class ServletRegistroUsuario extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Asegúrate de registrar el driver JDBC manualmente si es necesario
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Error al cargar el controlador JDBC", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String nombreUsuario = request.getParameter("nombreUsuario");
        String contrasena = request.getParameter("contrasena");
        String correo = request.getParameter("correo");

        // Validar que los datos no sean nulos o vacíos
        if (nombre == null || apellido == null || nombreUsuario == null || contrasena == null || correo == null ||
            nombre.isEmpty() || apellido.isEmpty() || nombreUsuario.isEmpty() || contrasena.isEmpty() || correo.isEmpty()) {
            response.sendRedirect("error.jsp?message=Por favor, complete todos los campos.");
            return;
        }

        try {
            // Obtener la conexión a la base de datos desde la clase ConexionDB
            Connection connection = ConexionDB.getConnection();

            // Preparar la consulta SQL para insertar un nuevo usuario
            String sql = "INSERT INTO usuarios (nombre, apellido, nombre_usuario, contraseña, correo) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nombre);
            statement.setString(2, apellido);
            statement.setString(3, nombreUsuario);
            statement.setString(4, contrasena);
            statement.setString(5, correo);

            // Ejecutar la inserción
            int filasInsertadas = statement.executeUpdate();

            // Verificar si la inserción fue exitosa
            if (filasInsertadas > 0) {
                // Redirigir a una página de éxito
                response.sendRedirect("bienvenida.jsp");
            } else {
                // Redirigir a una página de error
                response.sendRedirect("error.jsp");
            }

            // Cerrar la conexión
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body><h3>Error al registrar el usuario: " + e.getMessage() + "</h3></body></html>");
        }
    }
}
