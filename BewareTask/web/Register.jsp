<%-- 
    Document   : Register
    Created on : Nov 26, 2020, 10:06:03 PM
    Author     : Ignatius Dwiki I
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Beware Task!</title>
    </head>
    <body>
        <div align="center">
            <h1>Register</h1>
            <form action="<%= request.getContextPath() %>/register" method="post">
             <table style="with: 80%">
              <tr>
               <td>Username</td>
               <td><input type="text" name="name" /></td>
              </tr>
              <tr>
               <td>Password</td>
               <td><input type="password" name="password" /></td>
              </tr>
              <tr>
               <td>Email</td>
               <td><input type="text" name="email" /></td>
             </table>
             <input type="submit" value="Submit" />
            </form>
           </div>
    </body>
</html>
