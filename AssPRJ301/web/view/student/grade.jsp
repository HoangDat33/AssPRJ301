<%-- 
    Document   : grade
    Created on : Mar 12, 2024, 11:13:04 AM
    Author     : Dat
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Choose your subject:</h1>
        <form action="grade" method="POST">
            <input type="hidden" name="stdid" value="${sessionScope.stdid}"/>
            Subject: 
            <select name="selectSub">
                <c:forEach items="${sessionScope.subjects}" var="sub">
                    <option value="${sub.subid}">${sub.subname}</option>
                </c:forEach>
            </select>
            <input type="submit" value="Display" />
        </form>
            <h1>Your grade :</h1>
            <table border="1px">
            <tr>
                <td>Grade Item</td>
                <td>Weight</td>
                <td>Value</td>
            </tr> 
            <c:forEach items="${sessionScope.grades}" var="gra">
                <tr>
                    <td>${gra.exam.assessment.assname}</td>
                    <c:set var="percentage" value="${(gra.exam.assessment.weight * 100)}" />
                    <td><c:out value="${fn:substringBefore(percentage, '.')}" />%</td>
                    <td>${gra.score}</td>
                </tr> 
            </c:forEach>
                <td>Overall</td>
                <td>${sessionScope.overall}</td>
        </table>
    </body>
</html>
