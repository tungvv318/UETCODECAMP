<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        #customers {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        #customers td, #customers th {
            border: 1px solid #ddd;
            padding: 8px;
        }
        #customers tr:nth-child(even){background-color: #f2f2f2;}
        #customers tr:hover {background-color: #ddd;}
        #customers th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #4CAF50;
            color: white;
        }
        #customers td:last-child{
            text-align: center;
        }
        .button {
            background-color: #8a948a;
            border: none;
            color: white;
            padding: 12px 28px;
            font-size: 16px;
            margin-bottom: 19px;
            border-radius: 5px;
            cursor: pointer;
            outline: none;
            float: left;
        }
        .button:hover {
            background-color: #555555;
            color: white;
        }
        form.example input[type=text] {
            padding: 10px;
            font-size: 17px;
            border: 1px solid grey;
            width: 80%;
            background: #f1f1f1;
            border-radius: 3px;
        }

        form.example button {
            float: right;
            /* width: 20%; */
            padding: 10px;
            background: #8a948a;
            color: white;
            font-size: 17px;
            border: 1px solid grey;
            border-left: none;
            cursor: pointer;
            width: 100px;
            border-radius: 3px;
        }

        form.example button:hover {
            /*background: #0b7dda;*/
            background-color: #555555;
        }

        form.example::after {
            content: "";
            clear: both;
            display: table;
        }
        .setBoder{
            background-color: #8a948a;
            border: none;
            color: white;
            padding: 7px 20px;
            border-radius: 3px;
            cursor: pointer;
        }
        .setBoder:hover{
            background-color: #555555;
            color: white;
        }
    </style>
    <script>
        function setModeActive(modeActive, idCustomer){
            if(modeActive == 'Delete'){
                document.getElementById('modeActive').value = "Delete";
                document.getElementById("idCustomer").value = idCustomer;
            }
            else if(modeActive == 'Add'){
                document.getElementById('modeActive').value = "Add";
            }
            else if(modeActive == 'Search'){
                document.getElementById('modeActive').value = "Search";
            }
            else if(modeActive == 'Edit'){
                document.getElementById('modeActive').value = "Edit";
                document.getElementById("idCustomer").value = idCustomer;
            }
        }
    </script>
</head>
<body>
<div class="topnav">
    <form action="/handle" method="post" class="example">
        <input type="text" placeholder="Search.." name="searchCustomer" style="margin-left:1000px;max-width:300px">
        <button type="submit" onclick="setModeActive('Search')"><i class="fa fa-search"></i></button>
        <input type="submit" class="button" name="addCustomer" value="Thêm" onclick="setModeActive('Add')">
        <table id="customers">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Balance</th>
                <th colspan="2" style="text-align: center;">Lựa chọn</th>
            </tr>
            <c:forEach var="customer" items="${lstCustomer}">
                <tr>
                    <td>${customer.id}</td>
                    <td>${customer.name}</td>
                    <td>${customer.email}</td>
                    <td>${customer.phone}</td>
                    <td>${customer.balance}</td>
                    <td align="center"><input type="submit" class="setBoder" name="deleteCustomer" value="Xóa" onclick="setModeActive('Delete',  ${customer.id})"></td>
                    <td align="center"><input type="submit" class="setBoder" name="editCustomer" value="Sửa" onclick="setModeActive('Edit',  ${customer.id} )"></td>
                </tr>
            </c:forEach>
            <input id="modeActive" type="hidden" name="modeActive" value="1" />
            <input type="hidden" name="idCustomer" id="idCustomer" value="2" />
        </table>
    </form>
</div>
</body>
</html>