<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String Branch = request.getParameter("Branch");
    String Role = request.getParameter("Role");
    int id=Integer.parseInt(request.getParameter("id"));

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/klu", "root", "admin");
        String sql = "INSERT INTO users (id,name, email, Branch, Role) VALUES (?,?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1,id);
        ps.setString(2, name);
        ps.setString(3, email);
        ps.setString(4, Branch);
        ps.setString(5, Role);
        ps.executeUpdate();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.sendRedirect("emp-management.jsp");
%>
