package servlets;

import DB.ConexionDB; // Importa tu clase de conexión a la base de datos
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/RegistrarEgresoServlet")
public class RegistrarEgresoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String descripcion = request.getParameter("descripcion");
        String montoStr = request.getParameter("monto");
        String fecha = request.getParameter("fecha");

        String mensaje; // Para almacenar el mensaje de éxito o error

        try (Connection connection = ConexionDB.getConnection()) {
            String sql = "INSERT INTO egresos (descripcion, monto, fecha) VALUES (?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, descripcion);
            statement.setBigDecimal(2, new BigDecimal(montoStr)); // Uso correcto de BigDecimal
            statement.setDate(3, java.sql.Date.valueOf(fecha)); // Conversión de fecha

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                mensaje = "Registro de egreso exitoso";
            } else {
                mensaje = "Error al registrar el egreso";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            mensaje = "Error en la conexión a la base de datos";
        }

        // Establecer el mensaje en la solicitud y redirigir de nuevo al JSP
        request.setAttribute("mensaje", mensaje);
        request.getRequestDispatcher("GenerarEgreso.jsp").forward(request, response);
    }
}
