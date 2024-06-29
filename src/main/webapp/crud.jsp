<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CRUD Application</title>
    <jsp:include page="navbar.jsp" />
</head>
<body>
    <h1>User List</h1>
    <table border="1" cellpadding="10" cellspacing="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
          
            </tr>
        </thead>
        <tbody>
            <%
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/klu", "root", "admin");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM users");
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    
            %>
            <tr>
                <td><%= id %></td>
                <td><%= name %></td>
                <td><%= email %></td>
               
                <td>
                    <a href="edit.jsp?id=<%= id %>">Edit</a>
                    <a href="delete.jsp?id=<%= id %>">Delete</a>
                </td>
            </tr>
            <%
                }
                conn.close();
            %>
        </tbody>
    </table>
    <br>
    <a href="new.jsp">Add New User</a>
</body>
</html>