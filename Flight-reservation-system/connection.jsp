<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/findflights";
    String username = "root";
    String password = "";  // leave empty if you didn’t set one

    Connection conn = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);
        application.setAttribute("DBConnection", conn);
        out.println("✅ Database connected successfully!");
    } catch (Exception e) {
        out.println("❌ Database connection failed: " + e.getMessage());
    }
%>
