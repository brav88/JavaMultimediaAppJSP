<%-- 
    Document   : updatePoster
    Created on : 21 mar. 2023, 19:26:51
    Author     : Samuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<%
    int id = Integer.parseInt(request.getParameter("Id"));
    File file;
    String filePath = "C:/Users/Samuel/Documents/NetBeansProjects/MultimediaJSP/web/images/";
    ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());

    List fileItems = upload.parseRequest(new ServletRequestContext(request));
    Iterator i = fileItems.iterator();
    while (i.hasNext()) {
        FileItem fi = (FileItem) i.next();
        if (!fi.isFormField()) {
            file = new File(filePath + id + ".jpg");
            fi.write(file);
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/multimedia", "root", "Admin$1234");
            Statement statement2 = con.createStatement();
            statement2.executeUpdate("UPDATE Movies SET poster = '" + id + ".jpg' WHERE Id =" + id);
        }
    }

    RequestDispatcher rd = request.getRequestDispatcher("getMovies.jsp");
    rd.forward(request, response);
%>


