<%-- 
    Document   : Login
    Created on : Nov 26, 2020, 10:07:44 PM
    Author     : Ignatius Dwiki I
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BewareTask!</title>
    </head>
    <body>
        <div align="center">
         <h1>Login</h1>
         <form action="<%=request.getContextPath()%>/login" method="post">
          <table style="with: 100%">
           <tr>
            <td>Name</td>
            <td><input type="text" name="name" /></td>
           </tr>
           <tr>
            <td>Password</td>
            <td><input type="password" name="password" /></td>
           </tr>

          </table>
          <input type="submit" value="Submit" />
         </form>
        </div>
</body>
</html>
