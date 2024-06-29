<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String Branch = request.getParameter("Branch");
    String Role = request.getParameter("Role");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/klu", "root", "admin");
        String sql = "UPDATE users SET name=?, email=?, Branch=?, Role=? WHERE id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, Branch);
        ps.setString(4, Role);
        ps.setInt(5,id);
        ps.executeUpdate();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.sendRedirect("emp-management.jsp");
%>
