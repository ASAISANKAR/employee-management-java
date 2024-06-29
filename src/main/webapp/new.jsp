<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New User</title>
</head>
<body>
    <h1>Add New User</h1>
    <form action="insert.jsp" method="post">
        Id: <input type="text" name="id"><br>
        Name: <input type="text" name="name"><br>
        Email: <input type="email" name="email"><br>
        Branch: <input type="text" name="Branch"><br>
        Role: <input type="text" name="Role"><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>