<%-- 
    Document   : EditTask
    Created on : Nov 27, 2020, 11:25:50 AM
    Author     : Mystery-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
       
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
