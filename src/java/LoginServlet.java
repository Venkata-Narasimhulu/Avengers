import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // JDBC variables
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // JDBC driver name and database URL
            String jdbcUrl = "jdbc:mysql://localhost:3306/avengers";
            String dbUser = "root";
            String dbPassword = "Girirkv@139";

            // Register JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Open a connection
            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // SQL query to check if username and password match
            String sql = "SELECT * FROM user_table WHERE email = ? AND password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            rs = stmt.executeQuery();

            // If a matching record is found, redirect to home.jsp; otherwise, stay on login.jsp
            if (rs.next()) {
                response.sendRedirect("home.html");
            } else {
                // Incorrect credentials, stay on login.jsp
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            // Handle errors (you might want to log the exception)
            e.printStackTrace();

            // Redirect to an error page (you can modify this based on your requirements)
            response.sendRedirect("error.jsp");
        } finally {
            // Close resources
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
