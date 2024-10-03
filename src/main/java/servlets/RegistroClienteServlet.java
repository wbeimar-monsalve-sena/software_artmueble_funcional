package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import DB.ConexionDB;

@WebServlet("/RegistroClienteServlet")
public class RegistroClienteServlet extends HttpServlet {
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
        // Obtener los parámetros del formulario
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");

        try {
            // Obtener la conexión a la base de datos desde la clase ConexionDB
            Connection connection = ConexionDB.getConnection();

            // Preparar la consulta SQL para insertar un nuevo cliente
            String sql = "INSERT INTO clientes (nombre, email, telefono, direccion) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nombre);
            statement.setString(2, email);
            statement.setString(3, telefono);
            statement.setString(4, direccion);

            // Ejecutar la inserción
            int filasInsertadas = statement.executeUpdate();

            // Configurar el tipo de contenido para la respuesta
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            // Verificar si la inserción fue exitosa
            if (filasInsertadas > 0) {
                out.println("<html><body><h3>Registro exitoso</h3></body></html>");
            } else {
                out.println("<html><body><h3>Error al registrar el cliente</h3></body></html>");
            }

            // Cerrar la conexión
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body><h3>Error al registrar el cliente: " + e.getMessage() + "</h3></body></html>");
        }
    }
}