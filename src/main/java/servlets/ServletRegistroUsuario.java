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

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Error al cargar el controlador JDBC", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String nombreUsuario = request.getParameter("nombreUsuario");
        String contrasena = request.getParameter("contrasena");
        String correo = request.getParameter("correo");

        // Validación básica
        if (nombre == null || apellido == null || nombreUsuario == null || contrasena == null || correo == null ||
            nombre.isEmpty() || apellido.isEmpty() || nombreUsuario.isEmpty() || contrasena.isEmpty() || correo.isEmpty()) {
            request.setAttribute("mensajeError", "Por favor, complete todos los campos.");
            request.getRequestDispatcher("registro_usuario.jsp").forward(request, response);
            return;
        }

        try {
            Connection connection = ConexionDB.getConnection();
            String sql = "INSERT INTO usuarios (nombre, apellido, nombre_usuario, contraseña, correo) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nombre);
            statement.setString(2, apellido);
            statement.setString(3, nombreUsuario);
            statement.setString(4, contrasena);
            statement.setString(5, correo);

            int filasInsertadas = statement.executeUpdate();

            // Comprobar si la inserción fue exitosa
            if (filasInsertadas > 0) {
                request.setAttribute("mensajeExito", "Registro exitoso.");
            } else {
                request.setAttribute("mensajeError", "Error al registrar el usuario.");
            }

            // Reenviar a la misma página con el mensaje
            request.getRequestDispatcher("registro_usuario.jsp").forward(request, response);

            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("mensajeError", "Error al registrar el usuario: " + e.getMessage());
            request.getRequestDispatcher("registro_usuario.jsp").forward(request, response);
        }
    }
}

