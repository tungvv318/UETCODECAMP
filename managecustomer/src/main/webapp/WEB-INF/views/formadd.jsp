<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thêm</title>
    <style>
        #customers {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 30%;
            margin-left: 30%;
        }
        #customers td, #customers th {
            border: 1px solid #ddd;
            padding: 8px;
        }
        #customers tr:nth-child(even){background-color: #f2f2f2;}
        #customers th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: #4CAF50;
            color: white;
        }
        input[type=text]:first-child{
            margin-top: 10px;
        }
        input[type=text]{
            width: 300px;
            height: 38px;
            margin-left: 72px;
            text-align: center;
            border-radius: 3px;
            border: none;
            align-content: center;
            margin-bottom: 30px;
        }
        .submit:hover{
            background-color: #104f66;
            color: white;
        }
        .submit{
            margin-left: 168px;
            margin-bottom: 10px;
            background-color: #15ace6;
            border: none;
            padding: 10px 36px;
            border-radius: 3px;
            color: white;
            cursor: pointer;
            outline: none;
        }
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        input[type=number]{
            width: 300px;
            height: 38px;
            margin-left: 72px;
            text-align: center;
            border-radius: 3px;
            border: none;
            align-content: center;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
<form:form action="/handleAddCustomer" method="post"  modelAttribute="addCustomer">
    <table id="customers" >
        <tr>
            <th>Thêm người dùng</th>
        </tr>
        <tr>
            <td>
                <form:input path="name" placeholder="Enter name" type="text"/>
                <form:input path="email" placeholder="Enter email" type="text"/>
                <form:input path="phone" placeholder="Enter phone" type="text"/>
                <form:input path="balance" placeholder="Enter balance" type="number"/>
                <input type="submit" value="Thêm" class="submit">
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>