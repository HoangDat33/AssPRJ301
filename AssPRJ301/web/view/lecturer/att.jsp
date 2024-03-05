<%-- 
    Document   : att
    Created on : Mar 5, 2024, 9:04:38 PM
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
        <form action="att" method="POST">
            <input type="hidden" name="id" value="${requestScope.lession.leid}" />
            <table border="1px">
                <tr>
                    <td>Id</td>
                    <td>Name</td>
                    <td>Presented</td>
                    <td>Note</td>
                    <td>Time</td>
                </tr>
                <c:forEach items="${requestScope.atts}" var="a">
                <tr>
                    <td>${a.student.sid}</td>
                    <td>${a.student.sname}</td>
                    <td>
                        <input type="radio" 
                               ${!a.present?"checked=\"checked\"":""}
                               name="present${a.student.sid}" value="no"/> <span style="color: red;">Absent</span>
                        <input type="radio" 
                               ${a.present?"checked=\"checked\"":""}
                               name="present${a.student.sid}" value="yes"/> <span style="color: green;">Attended</span>
                    </td>
                    <td>
                        <input type="text" name="description${a.student.sid}" value="${a.description}"/>
                    </td>
                    <td>${a.captureTime}</td>
                </tr>    
                </c:forEach>
            </table>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
