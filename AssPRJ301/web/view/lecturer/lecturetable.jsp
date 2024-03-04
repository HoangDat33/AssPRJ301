<%-- 
    Document   : lecturetable
    Created on : Mar 3, 2024, 9:35:23 PM
    Author     : Dat
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <div>Lecturer: ${requestScope.lecturer.lname}</div>
        <table border="1px">

            <tr>
                <td></td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td>
                        (<fmt:formatDate pattern="E" value="${d}" />)
                        ${d}
                    </td>
                </c:forEach>
            </tr>

            <c:forEach items="${requestScope.slots}" var="slot">
                <tr>
                    <td>${slot.name}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <c:forEach items="${requestScope.lessions}" var="les">
                                <c:if test="${les.date eq d and les.timeSlot.tid eq slot.tid}">
                                    ${les.group.gname} - ${les.group.subject.subname}
                                    <a href="att?id=${les.leid}">
                                        <c:if test="${les.isAttended}">Edit</c:if>
                                        <c:if test="${!les.isAttended}">Take</c:if>
                                    </a>
                                    
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>

            </c:forEach>
        </table> 
    </body>
</html>
