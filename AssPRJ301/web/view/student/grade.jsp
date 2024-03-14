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
        <title>Student Graded</title>
        <style>
            .container {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column; /* Đặt hàng dọc */
            }
            table {
                margin-top: 20px;
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
            .submit-btn {
                background-color: #4CAF50;
                color: white;
                padding: 5px 10px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin-top: 20px;
                cursor: pointer;
                border: none;
                border-radius: 4px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>CHOOSE YOUR SUBJECT</h2>
            <form action="grade" method="POST">
                <input type="hidden" name="stdid" value="${sessionScope.stdid}"/>
                 <strong>Subject:</strong>
                <select name="selectSub">
                    <c:forEach items="${sessionScope.subjects}" var="sub">
                        <option value="${sub.subid}">${sub.subname}</option>
                    </c:forEach>
                </select>
                <input class="submit-btn"type="submit" value="Display" />
            </form>
        </div>
        <div class="table">
            <table border="1px">
                <tr>
                    <td><strong>Grade Item</strong></td>
                    <td><strong>Weight</strong></td>
                    <td><strong>Value</strong></td>
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
        </div>
    </body>
</html>
