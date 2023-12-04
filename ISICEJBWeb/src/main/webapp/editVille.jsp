<%@page import="entities.Ville"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Éditer la Ville</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .container {
            margin: 20px;
            text-align: center;
        }

        h1 {
            text-align: center;
        }

        form {
            margin-bottom: 20px;
            max-width: 400px;
            margin: auto;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            box-sizing: border-box;
            margin-bottom: 15px;
        }

        .action-buttons {
            margin-right: 5px;
            padding: 8px 16px;
            font-size: 14px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Gestion des Villes</h1>

        <form action="VilleController" method="post" class="action-form">
            <div>
                <label for="villeInput">Nom :</label>
                <input type="text" name="ville" id="villeInput" class="form-control" placeholder="Entrer le nom de la ville" value="${editVille != null ? editVille.nom : ''}" required>
            </div>
            <input type="hidden" name="action" value="${editVille != null ? 'update' : 'create'}">
            <input type="hidden" name="id" value="${editVille != null ? editVille.id : ''}">
            <button type="submit" class="btn btn-primary action-buttons">${editVille != null ? 'Mettre à jour' : 'Enregistrer'}</button>
        </form>
    </div>

    <script>
        function confirmDelete() {
            return confirm("Êtes-vous sûr de vouloir supprimer cette ville et les hôtels associés ?");
        }
    </script>
</body>
</html>
