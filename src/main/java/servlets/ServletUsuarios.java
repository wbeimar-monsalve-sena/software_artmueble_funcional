
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/ServletUsuarios")
public class ServletUsuarios extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String nombreUsuario = request.getParameter("nombreUsuario");
        String contrasena = request.getParameter("contrasena");

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // Registrar manualmente el driver (opcional)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Obtener la conexión a la base de datos desde la clase ConexionDB
            connection = ConexionDB.getConnection();

            // Preparar la consulta SQL
            String sql = "SELECT * FROM usuarios WHERE nombre_usuario = ? AND contraseña = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, nombreUsuario);
            statement.setString(2, contrasena);

            // Ejecutar la consulta
            resultSet = statement.executeQuery();

            // Verificar si se encontró el usuario
            if (resultSet.next()) {
                // Si las credenciales son correctas, redirigir a bienvenida.jsp
                response.sendRedirect("bienvenida.jsp");
            } else {
                // Si las credenciales son incorrectas, redirigir a error.jsp
                response.sendRedirect("error.jsp");
            }
        } catch (ClassNotFoundException e) {
            // Manejar el error si el driver no se encuentra
            e.printStackTrace();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body><h3>Error: Driver JDBC no encontrado</h3></body></html>");
        } catch (SQLException e) {
            // Manejar los errores de conexión o ejecución SQL
            e.printStackTrace();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body><h3>Error de conexión a la base de datos: " + e.getMessage() + "</h3></body></html>");
        } finally {
            try {
                // Cerrar recursos
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
