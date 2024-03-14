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
        <title>Attended</title>
        <style>
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column; /* Đặt hàng dọc */
        }
        .table {
            text-align: center;
            margin: 20px;
            padding: 20px;
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
        .submit-btn {
            background-color: #4CAF50; /* Màu xanh lá */
            color: white;
            padding: 10px 20px;
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
            <h1>
                Group Lession:${requestScope.lession.group.gname} 
            </h1>
        </div>
            <div class="table">
                <form action="att" method="POST">
                    <input type="hidden" name="id" value="${requestScope.lession.leid}" />
                    <table border="1px">
                        <tr>
                            <td><strong>Id</strong></td>
                            <td><strong>Name</strong></td>
                            <td><strong>Presented</strong></td>
                            <td><strong>Note</strong></td>
                            <td><strong>Time</strong></td>
                        </tr>
                        <c:forEach items="${requestScope.atts}" var="a">
                            <tr>
                                <td>${a.student.sid} </td>
                                <td>${a.student.sname}<br><a href="sif?id=${a.student.sid}">See Info</a></td>
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
                    <input class="submit-btn"type="submit" value="Save"/>
                </form>
            </div>
        
    </body>
</html>
