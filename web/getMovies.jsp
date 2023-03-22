<%-- 
    Document   : getMovies
    Created on : 28 feb. 2023, 20:01:29
    Author     : Samuel
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
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
                        <a class="nav-link" href="getMovies.jsp">Movies</a>                        
                        <a class="nav-link" href="moviesPoster.jsp">Movies Poster</a>                        
                    </div>
                </div>
            </div>
        </nav>
        <%
            String search = request.getParameter("txtSearch");
            String id = request.getParameter("id");

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/MultiMedia", "root", "Admin$1234");
            Statement statement = connection.createStatement();

            String sql = "";

            if (search == null) {
                sql = "SELECT * FROM Movies ORDER BY id ASC";
            } else {
                sql = "SELECT * FROM Movies WHERE name LIKE '%" + search + "%' ORDER BY id ASC";
            }

            ResultSet editResultSet = null;
            if (id != null) {
                Statement statementEdit = connection.createStatement();
                editResultSet = statementEdit.executeQuery("SELECT * FROM Movies WHERE id = " + id);
                editResultSet.next();
            }

            ResultSet resultSet = statement.executeQuery(sql);
        %>        
        <div class="container mt-3">
            <div class="card">
                <div class="card-header">
                    Create a movie
                </div>
                <div class="card-body">
                    <% if (editResultSet != null) {%>                                     
                    <form method="POST" action="updateMovie.jsp">
                        <% } else { %>                                     
                        <form method="POST" action="saveMovie.jsp">
                            <% } %>   
                            <div class="row">
                                <div class="col-4">
                                    <div class="form-floating mb-3">
                                        <% if (editResultSet != null) {%>                                     
                                        <input class="form-control" type="number" value="<%=editResultSet.getInt("id")%>" name="txtId">
                                        <% } else { %>                                     
                                        <input class="form-control" type="number" name="txtId">
                                        <% } %>                                     
                                        <label>Id</label>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="form-floating mb-3">
                                        <% if (editResultSet != null) {%>                                     
                                        <input class="form-control" type="text" value="<%=editResultSet.getString("name")%>" name="txtName">
                                        <% } else { %>                                     
                                        <input class="form-control" type="text" name="txtName">
                                        <% } %>
                                        <label>Name</label>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="form-floating mb-3">
                                        <% if (editResultSet != null) {%>                                     
                                        <input class="form-control" type="text" value="<%=editResultSet.getString("director")%>" name="txtDirector">
                                        <% } else { %>                                     
                                        <input class="form-control" type="text" name="txtDirector">
                                        <% } %>
                                        <label>Director</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <div class="form-floating mb-3">
                                        <% if (editResultSet != null) {%>                                     
                                        <input class="form-control" type="date" value="<%=editResultSet.getString("date")%>" name="txtDate">
                                        <% } else { %>                                     
                                        <input class="form-control" type="date" name="txtDate">
                                        <% } %>
                                        <label>Date</label>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="form-floating mb-3">
                                        <% if (editResultSet != null) {%>                                     
                                        <input class="form-control" type="text" value="<%=editResultSet.getString("genre")%>" name="txtGenre">
                                        <% } else { %>                                     
                                        <input class="form-control" type="text" name="txtGenre">
                                        <% } %>
                                        <label>Genre</label>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="form-floating mb-3">
                                        <% if (editResultSet != null) {%>                                     
                                        <input class="form-control" type="text" value="<%=editResultSet.getString("country")%>" name="txtCountry">
                                        <% } else { %>                                     
                                        <input class="form-control" type="text" name="txtCountry">
                                        <% } %>
                                        <label>Country</label>
                                    </div>
                                </div>                              
                            </div>
                            <% if (editResultSet != null) {%>                                     
                            <button style="float: right" class="btn btn-primary" type="submit">Update</button>                            
                            <a href="deleteMovie.jsp?id=<%=editResultSet.getInt("id")%>" class="btn btn-danger">Delete</a>                            
                            <% } else { %>                                     
                            <button style="float: right" class="btn btn-primary" type="submit">Save</button>
                            <% } %>
                        </form>


                </div>
                <% if (editResultSet != null) {%>    
                <div class="card-footer">
                    <form action="updatePoster.jsp?Id=<%=editResultSet.getString("id")%>" method="post" enctype="multipart/form-data">
                        <div class="col-4">
                            <div class="form-floating mb-3">
                                <input type="file" name="file" size="50"/>                                
                            </div>
                        </div>
                        <button style="float: right" class="btn btn-primary" type="submit">Change poster</button>         
                    </form>
                </div>           
                <% } %>
            </div>
            <hr>

            <div>
                <div class="row">
                    <div class="col-2">
                        <form action="getMovies.jsp">
                            <div class="form-floating mb-3">
                                <input class="form-control" type="text" name="txtSearch">
                                <label>Movie name:</label>                              
                            </div>                                                                       
                            <button style="float: right" class="btn btn-primary" type="submit">Search</button>
                        </form>
                    </div>                          
                </div>
            </div>

            <hr>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Name</th>
                        <th scope="col">Director</th>
                        <th scope="col">Date</th>
                        <th scope="col">Genre</th>
                        <th scope="col">Country</th>                        
                    </tr>
                </thead>
                <tbody>
                    <% while (resultSet.next()) {%>
                    <tr onclick="window.location.href = 'getMovies.jsp?id=<%=resultSet.getString("id")%>'">
                        <td><%=resultSet.getInt("id")%></td>
                        <td><%=resultSet.getString("name")%></td>
                        <td><%=resultSet.getString("director")%></td>
                        <td><%=resultSet.getString("date")%></td>
                        <td><%=resultSet.getString("genre")%></td>
                        <td><%=resultSet.getString("country")%></td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>
    </body>
</html>
