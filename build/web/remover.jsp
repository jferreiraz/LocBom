<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html14/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Remover</title>
    </head>
    <body>
        <%
        session.removeAttribute("email");
        session.removeAttribute("nome");
        response.sendRedirect("login.jsp");
        %>
    </body>
</html>
