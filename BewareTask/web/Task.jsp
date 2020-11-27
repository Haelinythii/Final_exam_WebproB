<%-- 
    Document   : Task.jsp
    Created on : Nov 27, 2020, 10:51:15 AM
    Author     : Mystery-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-expand-md navbar-light shadow-sm navbar-custom">
            
        </nav>
        <div class="container my-5">
            <div class="card">
                <div class="card-header">
                    <div class="card-title" id="loginTitle">
                        <h3>Add new task</h3>
                    </div>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <form action="<%=request.getContextPath()%>/TaskServlet" method="post">
                            <input type="text" name="taskname" /><br>
                            <input type="submit" name="submit" class="btn btn-success mt-3" id="btnLogin" value="AddTask" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="container">
            <h1>Your Task List</h1>
            <table class="table table-bordered">
                <thead style="background-color:#ff8559">
                    <tr>
                        <th>No.</th>
                        <th>Task</th>
                        <th>Due Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        int count = 1;
                        while (count < 5) {

                    %>
                    <tr>
                        <td><%=count%></td>
                        <td></td>
                        <td></td>
                        <td><a href="#EditTask" class="btn btn-primary">Edit</a><a href="#DeleteTask" class="btn btn-primary ml-1">Delete</a></td>
                    </tr>
                    <% 
                            count++;
                        }
                    %>
                </tbody>
            </table>
        </div>
            
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    </body>
</html>
