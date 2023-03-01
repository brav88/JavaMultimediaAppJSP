<%-- 
    Document   : saveMovie
    Created on : 28 feb. 2023, 20:26:38
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
    Statement statement = connection.createStatement();

    String sql = "INSERT INTO Movies (id, name, director, date, genre, country) ";
    sql += "VALUES (" + id + ", '" + name + "', '" + director + "', '" + date + "', '" + genre + "', '" + country + "')";

    int rowsAffected = statement.executeUpdate(sql);

    if (rowsAffected == 1) {
        RequestDispatcher rd = request.getRequestDispatcher("getMovies.jsp");
        rd.forward(request, response);
    } else {
        out.println("<h1 style='color:red'>Unhandled error saving the TV Show</h1>");
        RequestDispatcher rd = request.getRequestDispatcher("getMovies.jsp");
        rd.include(request, response);
    }
%>
