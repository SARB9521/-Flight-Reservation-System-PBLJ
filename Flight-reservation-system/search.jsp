<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
    String from = request.getParameter("from");
    String to = request.getParameter("to");
    String departure = request.getParameter("departure");

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // Load MySQL driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Connect to database (update DB name if needed)
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/findflights", "root", "");

        stmt = conn.createStatement();

        String query = "SELECT * FROM flights WHERE from_city='" + from + 
                       "' AND to_city='" + to + 
                       "' AND departure_date='" + departure + "'";

        rs = stmt.executeQuery(query);

%>
<!DOCTYPE html>
<html>
<head>
    <title>Available Flights</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f3f3f3;
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        th {
            background: #007bff;
            color: white;
        }
        tr:hover {
            background: #f1f1f1;
        }
    </style>
</head>
<body>
    <h2>Available Flights</h2>
    <table>
        <tr>
            <th>Flight No</th>
            <th>From</th>
            <th>To</th>
            <th>Departure Date</th>
            <th>Arrival Date</th>
            <th>Price</th>
            <th>Company</th>
        </tr>
        <%
            boolean found = false;
            while (rs.next()) {
                found = true;
        %>
        <tr>
            <td><%= rs.getString("flight_no") %></td>
            <td><%= rs.getString("from_city") %></td>
            <td><%= rs.getString("to_city") %></td>
            <td><%= rs.getString("departure_date") %></td>
            <td><%= rs.getString("arrival_date") %></td>
            <td><%= rs.getInt("price") %></td>
            <td><%= rs.getString("company_name") %></td>
        </tr>
        <%
            }
            if (!found) {
        %>
        <tr><td colspan="7" style="text-align:center;">No flights found for your search.</td></tr>
        <%
            }
        %>
    </table>
</body>
</html>

<%
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
