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

@WebServlet("/SignupServlet1")
public class SignupServlet1 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String mobile = request.getParameter("mobile");

        // JDBC variables
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // JDBC driver name and database URL
            String jdbcUrl = "jdbc:mysql://localhost:3306/avengers";
            String dbUser = "root";
            String dbPassword = "Girirkv@139";

            // Register JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Open a connection
            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // SQL query to insert data into the table
            String sql = "INSERT INTO user_table (name, email, password, mobile) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, password);
            stmt.setString(4, mobile);

            // Execute the query
            stmt.executeUpdate();

            // Redirect to a success page (you can modify this based on your requirements)
            response.sendRedirect("login.jsp");
        } catch (Exception e) {
            // Handle errors (you might want to log the exception)
            e.printStackTrace();

            // Redirect to an error page (you can modify this based on your requirements)
            response.sendRedirect("signup.jsp");
        } finally {
            // Close resources
            try {
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
