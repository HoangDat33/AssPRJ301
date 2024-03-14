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
        <div><a href="grade?id=${requestScope.student.sid}">Mark report</a></div>
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
                                    <c:set var="attended" value="false"/>
                                    <c:forEach items="${requestScope.atd}" var="object">
                                        <c:if test="${object.lession.leid eq les.leid}">
                                            <c:if test="${object.present}">
                                                <c:set var="attended" value="true"/>
                                            </c:if>
                                        </c:if>
                                    </c:forEach>
                                    <c:choose>
                                        <c:when test="${attended}">
                                            <span style="color: green;">Attended</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span style="color: red;">Absent</span>
                                        </c:otherwise>
                                    </c:choose>
                                    <a href="info?id=${les.leid}">
                                        ${les.lecturer.lcode}
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
