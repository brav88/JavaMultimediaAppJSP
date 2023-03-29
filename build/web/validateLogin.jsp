<%-- 
    Document   : validateLogin
    Created on : 14 mar. 2023, 20:36:56
    Author     : Samuel
--%>

<%@page import="java.sql.*, java.util.*" session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String email = request.getParameter("txtEmail");
    String pwd = request.getParameter("txtPwd");

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/MultiMedia", "root", "Admin$1234");    
    PreparedStatement statement = connection.prepareStatement("SELECT * FROM Users WHERE email = ? AND pwd = ?");    
    statement.setString(1, email);
    statement.setString(2, pwd);

    ResultSet resultSet = statement.executeQuery();

    while (resultSet.next()) {          
        session.setAttribute("email", email);
    
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }
    
    RequestDispatcher rd = request.getRequestDispatcher("login.jsp?error=You must log in");
    rd.include(request, response);
%>
