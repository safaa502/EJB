<%@page import="entities.Hotel"%>
<%@page import="entities.Ville"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/NewFile.css">

<meta charset="ISO-8859-1">
<title>Gestion des hotels</title>
<style>
    /* Add some styling to improve visual experience */
    body {
       font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(to bottom, #003366, #66ccff); /* Dark blue to light blue gradient */
        margin: 0;
        padding: 0;
        color: #333;
        display: flex;
        flex-direction: column;
        align-items: center;
        height: 100vh;
    }

    form {
        max-width: 400px;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
        margin-top: 20px;
    }

    input[type="text"] {
        width: calc(100% - 24px);
        padding: 12px;
        margin: 10px 0;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    button {
        background-color: #001a33; /* Dark blue */
        color: #fff;
        padding: 12px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        width: 100%;
        margin-top: 10px;
    }

    button.delete {
        background-color: #cc0000; /* Red */
    }

    button.update {
        background-color: #006600; /* Green */
    }

    button:hover {
        background-color: #004080; /* Darker blue on hover */
    }

    h1 {
        color: #fff; /* White */
        text-align: center;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: left;
         /* Grey for table cells */
        color: #fff;
    }

    th {
        background-color: #001a33; /* Dark blue for table headers */
    }

    form button {
        margin-top: 0;
    }

    .actions {
        display: flex;
    }

    .actions button {
        margin-right: 8px;
    }
</style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Hotel Manager</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="HotelController">Hotel Form</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="VilleController">Ville Form</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <form class="my_form" action="HotelController" method="post">
            <div class="form-group">
                <label for="nom">Nom :</label>
                <input type="text" name="nom" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="adresse">Adresse :</label>
                <input type="text" name="adresse" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="telephone">Telephone :</label>
                <input type="text" name="telephone" class="form-control" required>
            </div>
            
            <c:if test="${not empty villes}">
    <div class="form-group">
        <label for="ville">Ville :</label>
        <select name="ville" class="form-control">
            <c:forEach items="${villes}" var="v">
                <c:choose>
                    <c:when test="${v.id eq editHotel.ville.id}">
                        <option value="${v.id}" selected>${v.nom}</option>
                    </c:when>
                    <c:otherwise>
                        <option value="${v.id}">${v.nom}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </select>
    </div>
</c:if>

            <button type="submit" class="btn btn-primary">Enregistrer</button>
        </form>

        <!-- Table to showcase hotel information -->
<h2 class="text-center mt-4">Liste des Hôtels :</h2>
<table class="table table-bordered table-striped">
    <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Adresse</th>
            <th>Telephone</th>
            <th>Ville</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <!-- Add a loop to iterate over the list of hotels -->
        <c:forEach items="${Hotels}" var="hotel">
            <tr>
                <td>${hotel.id}</td>
                <td>${hotel.nom}</td>
                <td>${hotel.adresse}</td>
                <td>${hotel.telephone}</td>
                <td>${hotel.ville.nom}</td>
                <td>
               	 <form action="HotelController" method="post" onsubmit="return confirmDelete();" class="inline-form">
                               <input type="hidden" name="action" value="delete">
                               <input type="hidden" name="id" value="${hotel.id}">
                               <button type="submit" class="btn btn-danger btn-sm action-buttons">Delete</button>
                           </form>
                           <form action="HotelController" method="get" class="inline-form">
                               <input type="hidden" name="action" value="edit">
                               <input type="hidden" name="id" value="${hotel.id}">
                               <button type="submit" class="btn btn-primary btn-sm action-buttons">Edit</button>
                           </form>
                            
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<script>
    function confirmDelete() {
        return confirm("Are you sure you want to delete this hotel?");
    }
</script>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>