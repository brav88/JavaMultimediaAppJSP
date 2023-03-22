<%-- 
    Document   : deleteMovie
    Created on : 14 mar. 2023, 19:19:41
    Author     : Samuel
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/MultiMedia", "root", "Admin$1234");
    PreparedStatement statement = connection.prepareStatement("DELETE FROM Movies WHERE id = ?");
    statement.setInt(1, id);
    statement.executeUpdate();
%> 

<h2><a href="getMovies.jsp">Movie deleted! Go back!</a></h2> 