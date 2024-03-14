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
        <title>Lucturer Timetable</title>
        <style>
            .container {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column; /* Đặt hàng dọc */
            }
             table {
            width: 100%; /* Bảng sẽ rộng hết không gian trong div content */
            border-collapse: collapse; /* Gộp các đường viền của bảng */
        }
        th, td {
            border: 1px solid #ddd; /* Đặt đường viền cho các ô */
            padding: 8px; /* Đặt padding cho các ô */
        }
        th {
            background-color: #f2f2f2; /* Màu nền cho các ô tiêu đề */
        }
        </style>
    </head>
    <body>

        <div class="container">
            <h1>
               Lecturer: ${requestScope.lecturer.lname} 
            </h1>
        </div>
        <div>
            <table border="1px">

                <tr>
                    <td></td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <strong>(<fmt:formatDate pattern="E" value="${d}" />)
                            ${d}</strong>
                        </td>
                    </c:forEach>
                </tr>

                <c:forEach items="${requestScope.slots}" var="slot">
                    <tr>
                        <td><strong>${slot.name}</strong></td>
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
        </div>
         
    </body>
</html>
