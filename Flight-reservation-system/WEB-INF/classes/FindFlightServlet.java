import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class FindFlightServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String fromCity = request.getParameter("from_city");
        String toCity = request.getParameter("to_city");
        String departure = request.getParameter("departure_date");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/findflights", "root", ""
            );

            String sql = "SELECT * FROM flights WHERE from_city=? AND to_city=? AND departure_date=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, fromCity);
            ps.setString(2, toCity);
            ps.setString(3, departure);

            ResultSet rs = ps.executeQuery();

            out.println("<html><body style='font-family:Arial;background:#f3f6fd;padding:20px;'>");
            out.println("<h2>Available Flights</h2>");

            if (!rs.isBeforeFirst()) {
                out.println("<p>No flights found.</p>");
            } else {
                out.println("<table border='1' cellspacing='0' cellpadding='8'>");
                out.println("<tr><th>Flight No</th><th>From</th><th>To</th><th>Departure</th><th>Arrival</th><th>Price</th><th>Company</th></tr>");
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("flight_no") + "</td>");
                    out.println("<td>" + rs.getString("from_city") + "</td>");
                    out.println("<td>" + rs.getString("to_city") + "</td>");
                    out.println("<td>" + rs.getDate("departure_date") + "</td>");
                    out.println("<td>" + rs.getDate("arrival_date") + "</td>");
                    out.println("<td>" + rs.getInt("price") + "</td>");
                    out.println("<td>" + rs.getString("company_name") + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
            }

            out.println("</body></html>");
            con.close();

        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }
}
