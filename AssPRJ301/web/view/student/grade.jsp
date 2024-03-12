<%-- 
    Document   : grade
    Created on : Mar 12, 2024, 11:13:04 AM
    Author     : Dat
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="grade" method="POST">
            <input type="hidden" name="stdid" value="${requestScope.stdid}"/>
            Subject: 
            <select name="selectSub">
                <c:forEach items="${requestScope.subjects}" var="sub">
                    <option value="${sub.subid}">${sub.subname}</option>
                </c:forEach>
            </select>
            <input type="submit" value="Display" />
        </form>
    </body>
</html>
