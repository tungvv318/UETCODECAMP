<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chuyển tiền</title>
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
        #customers th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: #4CAF50;
            color: white;
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
        .padding{
            padding-left: 30px;
        }
    </style>
</head>
<body>
    <form:form action="/chuyentien" method="post">
        <table id="customers">
            <tr>
                <th>Thông tin người dùng</th>
            </tr>
            <tr>
                <td>
                    <div class="padding">
                        <p>Tên: ${customer.name}</p>
                        <p>Email: ${customer.email}</p>
                        <p>Phone: ${customer.phone}</p>
                        <p>Số dư khả dụng: ${customer.balance} VND</p>
                    </div>
                    <input type="hidden" name="idCustomerTransfers" value="${customer.id}">
                    <input type="submit" value="Chuyển tiền" class="submit">
                </td>

            </tr>
        </table>
    </form:form>
</body>
</html>