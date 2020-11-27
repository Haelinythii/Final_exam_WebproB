<%-- 
    Document   : EditTag
    Created on : Nov 27, 2020, 3:59:56 PM
    Author     : feral
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Tag</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <body>
        <sql:setDataSource
            var="bewaretaskasp"
            driver="com.mysql.cj.jdbc.Driver"
            url="jdbc:mysql://localhost:3306/bewaretaskasp"
            user="root" password=""
        />
        
        <%  System.out.println("SESSION REQ NOW: " + request.getParameter("taskid"));
            System.out.println("SESSION REQ NOW: " + session.getAttribute("userID"));%>
        
        <sql:query var="TagList" dataSource="${bewaretaskasp}">
            SELECT * FROM tag where idUser = <%=session.getAttribute("userID")%>;
        </sql:query>
        <sql:query var="ConfirmedTagList" dataSource="${bewaretaskasp}">
            SELECT distinct tt.task_id, tt.tag_id, t.TagName FROM tag_task tt, tag t where tt.tag_id = t.id and (task_id = <%=session.getAttribute("EditedTasktag")%> or task_id = <%=request.getParameter("taskid")%>);
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
                        <form action="<%=request.getContextPath()%>/AddTaskTagServlet" method="post">
                            <h5 class="mt-3">Available Tag(s) list:</h5>
                            <% if(request.getParameter("taskid") == null) { %>
                            <input type="text" hidden name="taskid" value="<%=session.getAttribute("EditedTasktag")%>">
                            <% } else { %>
                            <input type="text" hidden name="taskid" value="<%=request.getParameter("taskid")%>">
                            <% } %>
                            <select name="tag">
                                <c:forEach var="data" items="${TagList.rows}">
                                    <option value="${data.id}"><c:out value="${data.TagName}" /></option>
                                </c:forEach>

                            </select>
                            <button class="btn btn-primary">Add Tag</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
                            
        <div class="container my-5">
            <div class="card">
                <div class="card-header">
                    <div class="card-title" id="loginTitle">
                        <h3>Delete Tag</h3>
                    </div>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <form action="<%=request.getContextPath()%>/DeleteTagServlet" method="post">
                            <h5 class="mt-3">Available Tag(s) list:</h5>
                            <% if(request.getParameter("taskid") == null) { %>
                            <input type="text" hidden name="taskid" value="<%=session.getAttribute("EditedTasktag")%>">
                            <% } else { %>
                            <input type="text" hidden name="taskid" value="<%=request.getParameter("taskid")%>">
                            <% } %>
                            <select name="tag">
                                <c:forEach var="data" items="${TagList.rows}">
                                    <option value="${data.id}"><c:out value="${data.TagName}" /></option>
                                </c:forEach>

                            </select>
                            <button class="btn btn-primary">Delete Tag</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
                            
        <table class="table table-bordered">
            <thead style="background-color:#ff8559">
                <tr>
                    <th>Task's Tag</th>
                </tr>
            </thead>
            <tbody>
                <% int counter = 1;%>
                <c:forEach var="data" items="${ConfirmedTagList.rows}">
                <tr>
                    <td><%=counter%>. <c:out value="${data.TagName}" /></td>
                    <td>
                        <form action="<%=request.getContextPath()%>/DeleteTaskTagServlet" method="post">
                            <input type="text" name="tagid"  value="${data.tag_id}" />
                            <input type="submit" name="submit" class="btn btn-success mt-3" id="btnLogin" value="delete tag" />
                        </form>
                    </td>
                </tr>
                <%counter++;%>
                </c:forEach>
            </tbody>
        </table>

        <button type="button" class="btn btn-primary float-right" data-toggle="modal" data-target="#ModalCenter">New tag</button>  
        
        <div class="modal fade" id="ModalCenter" tabindex="-1" role="dialog" aria-labelledby="ModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalCenterTitle">Add New Tag</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="<%=request.getContextPath()%>/addnewtag" method="POST">
                            <div class="form-group">
                                <h6>New Tag:</h6>
                                <input type="text" class="form-control" name="tagname">
                            </div>
                            <button class="btn btn-primary mt-3">Add New Tag</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
                            
                            
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    
    </body>
</html>
