
package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.mysql.cj.jdbc.Driver; // Importar el driver

@WebServlet("/RegistrarProyectoServlet")
public class RegistrarProyectoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private static final String URL = "jdbc:mysql://localhost:3306/Sof_ArtMueble";
    private static final String USER = "root";
    private static final String PASSWORD = "Luciana.2012";

    private static final String INSERT_PROJECT_SQL = 
        "INSERT INTO proyectos (nombre, descripcion, fecha_inicio, fecha_fin, estado) VALUES (?, ?, ?, ?, ?)";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String fechaInicio = request.getParameter("fecha_inicio");
        String fechaFin = request.getParameter("fecha_fin");
        String estado = request.getParameter("estado");

        String message = "Registro exitoso";

        try {
            // Registrar el driver (opcional si usas JDBC 4.0 o posterior)
            DriverManager.registerDriver(new Driver());

            try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PROJECT_SQL)) {

                preparedStatement.setString(1, nombre);
                preparedStatement.setString(2, descripcion);
                preparedStatement.setString(3, fechaInicio);
                preparedStatement.setString(4, fechaFin);
                preparedStatement.setString(5, estado);

                preparedStatement.executeUpdate();

            } catch (SQLException e) {
                e.printStackTrace();
                message = "Error al registrar el proyecto: " + e.getMessage();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            message = "Error al registrar el proyecto: " + e.getMessage();
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("/registro_proyectos.jsp").forward(request, response);
    }
}
