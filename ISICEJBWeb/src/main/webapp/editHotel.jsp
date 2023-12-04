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
        <h1 class="text-center mb-4">Edit Hotel</h1>

        <!-- Form to add a new city -->
        <form class="custom_class" action="HotelController" method="post" class="form-inline mb-3">
            <div class="form-group">
                <label for="hotelNameInput">Nom :</label>
                <input type="text" name="nom" class="form-control" id="hotelNameInput" placeholder="Enter hotel name" value="${editHotel != null ? editHotel.nom : ''}" required>
            </div>
            <div class="form-group">
                <label for="hotelAddressInput">Adresse :</label>
                <input type="text" name="adresse" class="form-control" id="hotelAddressInput" placeholder="Enter hotel address" value="${editHotel != null ? editHotel.adresse : ''}" required>
            </div>
            
            <div class="form-group">
                <label for="hotelTelephoneInput">Telephone :</label>
                <input type="text" name="telephone" class="form-control" id="hotelTelephoneInput" placeholder="Enter hotel telephone" value="${editHotel != null ? editHotel.telephone : ''}" required>
            </div>

            <c:if test="${not empty villes}">
                <div class="form-group">
                    <label for="hotelVilleSelect">Ville :</label>
                    <select name="ville" class="form-control" id="hotelVilleSelect">
                        <c:forEach items="${villes}" var="v">
                            <option value="${v.id}" ${editHotel != null && editHotel.ville.id == v.id ? 'selected' : ''}>${v.nom}</option>
                        </c:forEach>
                    </select>
                </div>
            </c:if>

            <input type="hidden" name="action" value="${editHotel != null ? 'update' : 'create'}">
            <input type="hidden" name="id" value="${editHotel != null ? editHotel.id : ''}">
            <button type="submit" class="btn btn-primary">${editHotel != null ? 'Update' : 'Enregistrer'}</button>
        </form>

    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this Ville and associated hotels?");
        }
    </script>
</body>
</html>