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
            Lecturer's name: ${requestScope.l.lname}<br>
            Gender: <c:if test="${l.lgender}">
                Nam
            </c:if> 
                <c:if test="${!l.lgender}">
                Nữ
            </c:if> <br>
            Email:${requestScope.l.lmail}<br>
            Contact:${requestScope.l.lphone} 
        </div>

    </body>
</html>
