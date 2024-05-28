import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RoomBookingServlet")
public class RoomBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        int numOfGuests = Integer.parseInt(request.getParameter("numOfGuests"));
        String roomType = request.getParameter("roomType");
        String[] selectedRooms = request.getParameterValues("selectedRooms");
        String checkInDate = request.getParameter("checkIn");
        String checkOutDate = request.getParameter("checkOut");

        // JDBC variables
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // JDBC driver name and database URL
            String jdbcUrl = "jdbc:mysql://localhost:3306/avengers";
            String dbUser = "root";
            String dbPassword = "Girirkv@039";

            // Register JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Open a connection
            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Insert booking details into the database
            String insertSql = "INSERT INTO booking_table (num_of_guests, room_type, selected_rooms, check_in, check_out) VALUES (?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(insertSql);
            stmt.setInt(1, numOfGuests);
            stmt.setString(2, roomType);
            stmt.setString(3, String.join(",", selectedRooms));
            stmt.setString(4, checkInDate);
            stmt.setString(5, checkOutDate);
            stmt.executeUpdate();

            // Redirect to a confirmation page
            response.sendRedirect("booking_confirmation.jsp");
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
