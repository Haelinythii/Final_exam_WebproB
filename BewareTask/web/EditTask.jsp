<%-- 
    Document   : EditTask
    Created on : Nov 27, 2020, 11:25:50 AM
    Author     : Mystery-PC
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
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
                        <form action="<%=request.getContextPath()%>/EditTaskServlet" method="post">
                            <h3>New Tag's Name </h3>
                            <input type="text" hidden name="taskid" value="${taskVar.rows[0].id}" />
                            <input type="text" name="editedTaskName" value ="${taskVar.rows[0].TaskName}" /><br>
                            <input type="date" name="deadline"><br>
                            <input type="submit" name="submit" class="btn btn-success mt-3" id="btnLogin" value="Edit task" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
