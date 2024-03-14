<%-- 
    Document   : info
    Created on : Mar 14, 2024, 10:25:14 PM
    Author     : Dat
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lecturer Info</title>
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
            <strong>Lecturer's name:</strong> ${requestScope.l.lname}<br>
            <strong>Gender:</strong> <c:if test="${l.lgender}">
                Nam
            </c:if> 
                <c:if test="${!l.lgender}">
                Nữ
            </c:if> <br>
            <strong>Email:</strong>${requestScope.l.lmail}<br>
            <strong>Contact:</strong>${requestScope.l.lphone} 
        </div>

    </body>
</html>
