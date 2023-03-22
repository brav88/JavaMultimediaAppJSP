<%-- 
    Document   : updateMovie
    Created on : 14 mar. 2023, 19:10:09
    Author     : Samuel
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    int id = Integer.parseInt(request.getParameter("txtId"));
    String name = request.getParameter("txtName");
    String director = request.getParameter("txtDirector");
    String date = request.getParameter("txtDate");
    String genre = request.getParameter("txtGenre");
    String country = request.getParameter("txtCountry");

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/MultiMedia", "root", "Admin$1234");
    
    PreparedStatement statement = connection.prepareStatement("UPDATE Movies SET name = ?, director = ?, date = ?, genre = ?, country = ? WHERE id = ?");
    statement.setString(1, name);
    statement.setString(2, director);
    statement.setString(3, date);
    statement.setString(4, genre);
    statement.setString(5, country);
    statement.setInt(6, id);      
    
    int rowsAffected = statement.executeUpdate();

    if (rowsAffected == 1) {
        RequestDispatcher rd = request.getRequestDispatcher("getMovies.jsp");
        rd.forward(request, response);
    } else {
        out.println("<h1 style='color:red'>Unhandled error updating the TV Show</h1>");
        RequestDispatcher rd = request.getRequestDispatcher("getMovies.jsp");
        rd.include(request, response);
    }
%>
