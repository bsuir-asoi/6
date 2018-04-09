<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Car manager</title>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.css">
</head>
<body>
<h1>CAR MANAGER</h1>
<div class="main-container">
    <div class="inner-container">
        <h3>Car list</h3>
        <table class="table table-striped table-bordered">
            <tr>
                <th>ID</th>
                <th>MODEL</th>
                <th>PRICE</th>
            </tr>
            <c:forEach items="${carList}" var="car">
                <tr>
                    <td>${car.id}</td>
                    <td>${car.model}</td>
                    <td>${car.price}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="inner-container">
        <h3>Show price by model</h3>
        <form action="showPrice.html">
            <div class="form-group">
                <label for="carModel">Car model</label>
                <input class="form-control" id="carModel" type="text" name="model" value="${requestScope.carModel}"
                       required>
            </div>
            <button type="submit" class="btn btn-primary">Show price</button>
        </form>
        <table class="table table-striped table-bordered">
            <tr>
                <th>PRICE</th>
            </tr>
            <tr>
                <td>${requestScope.carPrice}</td>
            </tr>
        </table>
    </div>
    <div class="inner-container">
        <h3>Add car</h3>
        <form action="addCar.html" method="post">
            <div class="form-group">
                <label for="model">Car model</label>
                <input id="model" class="form-control" type="text" name="model" required>
            </div>
            <div class="form-group">
                <label for="price">Car price</label>
                <input id="price" class="form-control" type="number" name="price" required min="1">
            </div>
            <button type="submit" class="btn btn-primary">Add car</button>
        </form>
    </div>
    <div class="inner-container">
        <h3>Show cars by price</h3>
        <form action="carSearch.html">
            <div class="form-group">
                <label for="maxPrice">Max price</label>
                <input id="maxPrice" class="form-control" type="number" name="max-price" required min="1">
            </div>
            <button type="submit" class="btn btn-primary">Search</button>
        </form>
        <table class="table table-striped table-bordered">
            <c:forEach items="${requestScope.carListByPrice}" var="car">
                <tr>
                    <td>${car.model}</td>
                    <td>${car.price}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>