<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));

    String name = "";
    String email = "";
    String Branch = "";
    String Role = "";
    

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/klu", "root", "admin");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE id=?");
        ps.setInt(1,id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            name = rs.getString("name");
            email = rs.getString("email");
            Branch = rs.getString("Branch");
            Role = rs.getString("Role");
            
        }
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
</head>
<body>
    <h1>Edit User</h1>
    <form action="update.jsp" method="post">
        <input type="hidden" name="id" value="<%= id %>">
        Name: <input type="text" name="name" value="<%= name %>"><br>
        Email: <input type="email" name="email" value="<%= email %>"><br>
        Branch: <input type="text" name="Branch" value="<%= Branch %>"><br>
        Role: <input type="text" name="Role" value="<%= Role %>"><br>
        <input type="submit" value="Update">
    </form>
</body>
</html>
