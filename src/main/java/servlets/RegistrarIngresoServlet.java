package servlets;

import DB.ConexionDB; // Asegúrate de que esta ruta de importación sea correcta.
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/RegistrarIngresoServlet")
public class RegistrarIngresoServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/sof_artmueble";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Luciana.2012";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String descripcion = request.getParameter("descripcion");
        double monto = Double.parseDouble(request.getParameter("monto"));
        String fecha = request.getParameter("fecha");

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Obtener la conexión a través de la clase ConexionDB
            connection = ConexionDB.getConnection(); // Asumiendo que tienes un método estático getConnection()

            // SQL para insertar un nuevo ingreso
            String sql = "INSERT INTO ingresos (descripcion, monto, fecha) VALUES (?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, descripcion);
            preparedStatement.setDouble(2, monto);
            preparedStatement.setString(3, fecha);
            
            // Ejecutar la inserción
            int rowsAffected = preparedStatement.executeUpdate();
            String mensaje;
            if (rowsAffected > 0) {
                mensaje = "Registro de ingreso exitoso!";
            } else {
                mensaje = "Error al registrar el ingreso.";
            }
            request.setAttribute("mensaje", mensaje);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("mensaje", "Error de conexión a la base de datos: " + e.getMessage());
        } finally {
            // Cerrar recursos
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        // Redirigir de nuevo a la misma página
        request.getRequestDispatcher("GenerarIngreso.jsp").forward(request, response);
    }
}
