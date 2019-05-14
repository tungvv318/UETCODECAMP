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
        #customers tr:nth-child(even){background-color: #f2f2f2;}
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
        input[type=number]:first-child{
            margin-top: 10px;
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
    <script>
        function thongBao(maxMoney) {
            var moneyCustomerReceive = document.getElementById("moneyCustomerReceive").value;
            if(maxMoney >= moneyCustomerReceive){
                alert("Chuyển tiền thành công");
            }
            else{
                alert("Chuyển tiền thất bại do số tiền không đủ");
            }
        }
    </script>
</head>
<body>
    <form:form action="/handleChuyenTien" method="post">
        <table id="customers" >
            <tr>
                <th>Chuyển tiền</th>
            </tr>
            <tr>
                <td>
                    <input type="number" placeholder="ID người dùng chuyển tới" oninput="validity.valid||(value='');" name="idCustmerReceive">
                    <input type="number" placeholder="Số tiền..." oninput="validity.valid||(value='');" name="moneyCustomerReceive"
                           id="moneyCustomerReceive">
                    <input type="submit" value="Xác nhận" class="submit" onclick="thongBao(${maxMoney})">
                </td>
            </tr>
        </table>
    </form:form>
</body>
</html>