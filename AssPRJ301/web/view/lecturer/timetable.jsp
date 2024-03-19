<%-- 
    Document   : timetable
    Created on : Mar 2, 2024, 9:06:10 PM
    Author     : Dat
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Acction</title>
    <style>
        body {
            background-color: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif; /* Sử dụng font chữ Arial hoặc các font không có serif khác */
        }

        .container {
            width: 50%;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* Đổ bóng cho form */
            padding: 30px;
        }

        h1, h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #555; /* Màu chữ cho nhãn */
        }

        .form-group input[type="text"],
        .form-group input[type="date"],
        .form-group input[type="radio"] {
            width: calc(100% - 10px); /* Làm cho input rộng hơn một chút để tạo ra khoảng cách */
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        .form-group input[type="radio"] {
            width: auto;
            margin-right: 5px;
        }

        .position-options {
            display: flex;
            align-items: center;
        }

        .position-options label {
            margin-right: 10px;
        }

        .submit-btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            width: 10%;
            margin-left: 45%;
        }

        .submit-btn:hover {
            background-color: #45a049;
        }

    </style>
</head>

<body>
    <form class="container" action="timetable" method="POST">
        <h1>Demo FAP</h1>
        <h2>Sinh Viên Thực Hiện: Hoàng Tiến Đạt</h2>
        <div class="form-group">
            <label for="id">ID:</label>
            <input type="text" id="id" name="id" value="${param.id}">
        </div>
        <div class="form-group">
            <label for="from">From:</label>
            <input type="date" id="from" name="from">
            <label for="to">To:</label>
            <input type="date" id="to" name="to">
        </div>
        <div class="form-group">
            <label>Position:</label>
            <div class="position-options">
                <input type="radio" id="student" name="position" value="Student" checked>
                <label for="student">Student</label>
                <input type="radio" id="teacher" name="position" value="Teacher">
                <label for="teacher">Teacher</label>
            </div>
        </div>
        <input class="submit-btn" type="submit" value="View">
    </form>
</body>

</html>
