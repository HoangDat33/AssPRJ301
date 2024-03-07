<%-- 
    Document   : studenttable
    Created on : Mar 4, 2024, 2:10:19 PM
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
        <div>Student: ${requestScope.student.sname}</div>
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
                            <c:forEach items="${requestScope.stdLessions}" var="les">
                                <c:if test="${les.date eq d and les.timeSlot.tid eq slot.tid}">
                                    ${les.group.gname} - ${les.group.subject.subname}<br/>
                                    <c:forEach items="${requestScope.atd}" var="object">
                                        <c:set var="presentValue" value="${object.present}" />
                                        <c:set var="lesionId" value="${object.lession.leid}" />

                                        <c:forEach items="${requestScope.stdLessions}" var="les2">
                                            <c:choose>
                                                <c:when test="${les2.leid eq lesionId}">
                                                    <c:choose>
                                                        <c:when test="${presentValue eq true}">
                                                            Attended
                                                        </c:when>
                                                        <c:when test="${presentValue eq false}">
                                                            Absent
                                                        </c:when>
                                                        <c:otherwise>
                                                            Not yet
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:when>
                                            </c:choose>
                                        </c:forEach>
                                    </c:forEach>
                                    ${les.lecturer.lcode}
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>

            </c:forEach>
        </table> 
    </body>
</html>
