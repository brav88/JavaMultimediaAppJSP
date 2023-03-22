<%-- 
    Document   : index.jsp
    Created on : 14 mar. 2023, 20:47:02
    Author     : Samuel
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
        <title>Movies</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-md navbar-dark bg-primary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Multimedia</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-link active" aria-current="page" href="index.html">Home</a>                       
                    </div>
                </div>
            </div>
        </nav> 

        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/MultiMedia", "root", "Admin$1234");
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM Movies ORDER BY id ASC");
        %>      

        <div class="container mt-3">
            <div class="row">
                <% while (resultSet.next()) {%>
                <div class="card" style="width: 18rem;margin-right: 20px;margin-top:10px">
                    <img src="images/<%=resultSet.getString("poster")%>" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"><%=resultSet.getString("name")%></h5>
                        <p class="card-text">Director: <%=resultSet.getString("director")%></p>
                        <p class="card-text">Date Release: <%=resultSet.getString("date")%></p>
                        <p class="card-text">Genre: <%=resultSet.getString("genre")%></p>
                        <a href="#" class="btn btn-primary">View Movie</a>
                    </div>
                </div>
                <% }%>
            </div>
        </div>
    </body>
</html>
