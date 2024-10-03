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

@WebServlet("/GestionarClienteServlet")
public class GestionarClienteServlet extends HttpServlet {
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
        String idClienteStr = request.getParameter("idCliente");
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String mensaje = "";

        if (idClienteStr != null && !idClienteStr.isEmpty()) {
            try {
                Connection connection = ConexionDB.getConnection();
                
                if (nombre != null && !nombre.isEmpty()) {
                    // Actualizar cliente
                    String sqlUpdate = "UPDATE clientes SET nombre = ?, email = ?, telefono = ?, direccion = ? WHERE id = ?";
                    PreparedStatement statementUpdate = connection.prepareStatement(sqlUpdate);
                    statementUpdate.setString(1, nombre);
                    statementUpdate.setString(2, email);
                    statementUpdate.setString(3, telefono);
                    statementUpdate.setString(4, direccion);
                    statementUpdate.setInt(5, Integer.parseInt(idClienteStr));
                    
                    int filasActualizadas = statementUpdate.executeUpdate();
                    if (filasActualizadas > 0) {
                        mensaje = "<h3 style='color: green;'>Actualización exitosa</h3>";
                    } else {
                        mensaje = "<h3 style='color: red;'>Error al actualizar el cliente</h3>";
                    }
                    statementUpdate.close();
                } else {
                    // Buscar cliente
                    String sqlSelect = "SELECT nombre, email, telefono, direccion FROM clientes WHERE id = ?";
                    PreparedStatement statementSelect = connection.prepareStatement(sqlSelect);
                    statementSelect.setInt(1, Integer.parseInt(idClienteStr));
                    
                    ResultSet resultSet = statementSelect.executeQuery();
                    
                    if (resultSet.next()) {
                        // Cliente encontrado
                        nombre = resultSet.getString("nombre");
                        email = resultSet.getString("email");
                        telefono = resultSet.getString("telefono");
                        direccion = resultSet.getString("direccion");
                    } else {
                        mensaje = "<h3 style='color: red;'>Cliente no encontrado</h3>";
                    }
                    resultSet.close();
                    statementSelect.close();
                }
                
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
                mensaje = "<h3 style='color: red;'>Error al procesar la solicitud: " + e.getMessage() + "</h3>";
            }
        }
        
        // Mostrar el formulario con los datos del cliente (si se encontraron) o mensaje
        request.setAttribute("mensaje", mensaje);
        request.setAttribute("nombre", nombre);
        request.setAttribute("email", email);
        request.setAttribute("telefono", telefono);
        request.setAttribute("direccion", direccion);
        request.getRequestDispatcher("gestion_clientes.jsp").forward(request, response);
    }
}
