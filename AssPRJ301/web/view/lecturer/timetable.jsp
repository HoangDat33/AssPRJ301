<%-- 
    Document   : timetable
    Created on : Mar 2, 2024, 9:06:10 PM
    Author     : Dat
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Acction</title>
        <style>
            .container {
                width: 100%; /* Bảng sẽ rộng hết không gian trong div content */
                border-collapse: collapse;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
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
            h1 {
                color: red;
            }
        </style>

    </head>
    <body>
        
            <form class="container" action="timetable" method="POST">
                <h1>Demo FAP</h1>
                <h2>Sinh Viên Thực Hiện: Hoàng Tiến Đạt</h2>
                <div>ID: <input type="text" value="${param.id}" name="id"/><br/></div>
                <div>From: <input type="date" name="from""/> To:
                <input type="date" name="to""/><br/></div>
                <div><input type="radio" name="position" checked="checked" value="Student"/>Student
                <input type="radio" name="position" value="Teacher"/>Teacher<br/></div>
                <input class="submit-btn" type="submit" value="View"/>
            </form>

    </body>
</html>
