<%-- 
    Document   : info
    Created on : Mar 14, 2024, 11:31:45 PM
    Author     : Dat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Info</title>
        <style>
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
            }
        </style>
    </head>
    <body>
        <h2>User detail</h2>
        <div>
            <strong>Student's name:</strong> ${requestScope.s.sname}<br>
            <strong>Email:</strong>${requestScope.s.smail}<br>
            <strong>Contact:</strong>${requestScope.s.sphone}<br>
            <strong>Address: </strong>${requestScope.s.saddress}
        </div>
    </body>
</html>
