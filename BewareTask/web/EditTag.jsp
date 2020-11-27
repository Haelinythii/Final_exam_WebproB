<%-- 
    Document   : EditTag
    Created on : Nov 27, 2020, 3:59:56 PM
    Author     : feral
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Tag</title>
    </head>
    <body>
        <body>
        <sql:setDataSource
            var="bewaretaskasp"
            driver="com.mysql.cj.jdbc.Driver"
            url="jdbc:mysql://localhost:3306/bewaretaskasp"
            user="root" password=""
        />
        <sql:query var="taskVar" dataSource="${bewaretaskasp}">
            SELECT * FROM task where id = <%= request.getParameter("taskid")%> LIMIT 1;
        </sql:query>
       
        <%--ini pop up window harusnya?--%>
         <div class="container my-5">
            <div class="card">
                <div class="card-header">
                    <div class="card-title" id="loginTitle">
                        <h3>Add New Tag</h3>
                    </div>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <form action="<%=request.getContextPath()%>/addnewtag" method="post">
                            <h3>New Tag's Name </h3>
                            <input type="text" name="tagname" /><br>
                            <input type="submit" name="submit" class="btn btn-success mt-3" id="btnLogin" value="New Tag" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
