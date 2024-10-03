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
import java.time.LocalDate;

@WebServlet("/RegistrarVentaServlet")
public class RegistrarVentaServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/sof_artmueble";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Luciana.2012";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String producto = request.getParameter("producto");
        String cantidadStr = request.getParameter("cantidad");
        String precioStr = request.getParameter("precio");
        String metodoPago = request.getParameter("metodo-pago");

        int cantidad = 0;
        double precio = 0.0;
        LocalDate fechaVenta = LocalDate.now(); // Obtiene la fecha actual

        // Validar y convertir cantidad y precio
        try {
            cantidad = Integer.parseInt(cantidadStr);
            precio = Double.parseDouble(precioStr);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Formato de cantidad o precio inválido.");
            request.getRequestDispatcher("registro_ventas.jsp").forward(request, response);
            return;
        }

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "INSERT INTO ventas (producto, cantidad, precio, metodo_pago, fecha_venta) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, producto);
            pstmt.setInt(2, cantidad);
            pstmt.setDouble(3, precio);
            pstmt.setString(4, metodoPago);
            pstmt.setDate(5, java.sql.Date.valueOf(fechaVenta));

            int rowsInserted = pstmt.executeUpdate();

            if (rowsInserted > 0) {
                request.setAttribute("mensaje", "Registro de venta exitoso");
            } else {
                request.setAttribute("error", "Error al registrar la venta.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al conectar con la base de datos.");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        request.getRequestDispatcher("registro_ventas.jsp").forward(request, response);
    }
}
