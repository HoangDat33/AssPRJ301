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
                font-family: Arial, sans-serif; /*Thêm kiểu font chữ mặc định*/
                background-color: #f0f0f0; /*Thêm màu nền*/
                padding: 20px; /*Thêm khoảng cách đệm xung quanh*/
                margin: 0; /*Xóa margin mặc định*/
            }

            div {
                background-color: #ffffff; /*Thêm màu nền cho khối chứa thông tin*/
                padding: 20px; /*Thêm khoảng cách đệm xung quanh*/
                border-radius: 5px; /*Thêm bo tròn cho khối chứa thông tin*/
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /*Thêm đổ bóng*/
                text-align: left; /*Căn lề trái cho nội dung*/
            }
        </style>
    </head>
    <body>
        <h2>User detail</h2>
        <div>
            <strong>Lecturer's name:</strong> ${requestScope.l.lname}<br>
            <strong>Gender:</strong> <c:if test="${l.lgender}">
                Nam
            </c:if> 
                <c:if test="${!l.lgender}">
                Nữ
            </c:if> <br>
            <strong>Email:</strong>${requestScope.l.lmail}<br>
            <strong>Contact:</strong>${requestScope.l.lphone} 
        </div>
    </body>
</html>
