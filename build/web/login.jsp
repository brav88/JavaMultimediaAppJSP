<%-- 
    Document   : login.jsp
    Created on : 14 mar. 2023, 20:30:55
    Author     : Samuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
    </head>
    <body>
        <%
            String error = request.getParameter("error");
        %>    
        <section class="vh-100" style="background-color: #9de2ff;">
            <div class="container" style="margin-top: 20px;width:300px">                
                <div class="card"> 
                    <div class="card-header">
                        Login
                    </div>
                    <div class="card-body"> 
                        <form method="post" action="validateLogin.jsp">
                            <div class="form-floating mb-3">
                                <input class="form-control" type="email" name="txtEmail">
                                <label>Email</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input class="form-control" type="password" name="txtPwd">
                                <label>Password</label>
                            </div>
                            <button style="float: right" class="btn btn-primary" type="submit">Login</button>     
                        </form>
                    </div>
                    <% if (error != null) {%>  
                    <div class="card-footer">
                        <div class="alert alert-danger" role="alert">
                            <label class><%=error%></label>
                        </div>
                    </div>
                    <% }%>  
                </div>
            </div>
        </section>
    </body>
</html>
