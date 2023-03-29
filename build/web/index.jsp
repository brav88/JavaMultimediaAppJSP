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
        <%
            ResultSet resultSet = null;

            String email = (String)session.getAttribute("email");
            
            if (email == null) {
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp?error=You must log in");
                rd.include(request, response);
            }

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/MultiMedia", "root", "Admin$1234");
            Statement statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM Users where email = '" + email + "'");
            resultSet.next();
        %>     

        <nav class="navbar navbar-expand-md navbar-dark bg-primary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Multimedia</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">                        
                        <a class="nav-link" href="index.jsp">Home</a>                        
                    </div>
                    <div class="navbar-nav">                        
                        <a class="nav-link" href="getMovies.jsp">Movies</a>                        
                    </div>
                    <div class="navbar-nav">                        
                        <a class="nav-link" href="moviesPoster.jsp">Poster</a>                        
                    </div>
                    <div class="navbar-nav">                        
                        <a class="nav-link" data-bs-toggle="modal" data-bs-target="#exampleModal">Logout</a>                        
                    </div>
                </div>
            </div>
        </nav> 
        <section class="vh-100" style="background-color: #9de2ff;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-md-9 col-lg-7 col-xl-5">
                        <div class="card" style="border-radius: 15px;">
                            <div class="card-body p-4">
                                <div class="d-flex text-black">
                                    <div class="flex-shrink-0">
                                        <img src="profile_photos/<%=resultSet.getString("poster")%>"
                                             alt="Generic placeholder image" class="img-fluid"
                                             style="width: 180px; border-radius: 10px;">
                                    </div>
                                    <div class="flex-grow-1 ms-3">
                                        <h5 class="mb-1"><%=resultSet.getString("alias")%></h5>
                                        <p class="mb-2 pb-1" style="color: #2b2a2a;">Senior Journalist</p>
                                        <div class="d-flex justify-content-start rounded-3 p-2 mb-2"
                                             style="background-color: #efefef;">
                                            <div>
                                                <p class="small text-muted mb-1">Articles</p>
                                                <p class="mb-0">41</p>
                                            </div>
                                            <div class="px-3">
                                                <p class="small text-muted mb-1">Followers</p>
                                                <p class="mb-0">976</p>
                                            </div>
                                            <div>
                                                <p class="small text-muted mb-1">Rating</p>
                                                <p class="mb-0">8.5</p>
                                            </div>
                                        </div>
                                        <div class="d-flex pt-1">
                                            <button type="button" class="btn btn-outline-primary me-1 flex-grow-1">Chat</button>
                                            <button type="button" class="btn btn-primary flex-grow-1">Follow</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Logout</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Do you want to log out?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                        <a href='logout.jsp' type="button" class="btn btn-primary">Yes</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
