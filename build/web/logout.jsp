<%-- 
    Document   : logout
    Created on : 28 mar. 2023, 19:18:52
    Author     : Samuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    session.invalidate();

    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
    rd.include(request, response);
%>