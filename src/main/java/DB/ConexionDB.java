package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionDB {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/sof_artmueble?useSSL=false&serverTimezone=UTC"; // Actualizado aquí
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Luciana.2012";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
}
