<%-- 
    Document   : showGrade
    Created on : Mar 12, 2024, 8:54:59 PM
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
        <table border="1px">
            <tr>
                <td>Grade Item</td>
                <td>Weight</td>
                <td>Value</td>
            </tr> 
            <c:forEach items="${requestScope.grades}" var="gra">
                <tr>
                    <td>${gra.exam.assessment.assname}</td>
                    <c:set var="percentage" value="${(gra.exam.assessment.weight * 100)}" />
                    <td><c:out value="${fn:substringBefore(percentage, '.')}" />%</td>
                    <td>${gra.score}</td>
                </tr> 
            </c:forEach>
        </table>
    </body>
</html>
