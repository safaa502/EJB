<%@page import="entities.Ville"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<title>Gestion des Villes</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

nav {
	background-color: #f8f9fa;
	padding: 10px;
}

nav a {
	text-decoration: none;
	color: #007bff;
	font-weight: bold;
	margin-right: 15px;
}

.container {
	margin: 20px;
}

h1, h2 {
	text-align: center;
}

form {
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	border: 1px solid #dee2e6;
	padding: 8px;
	text-align: center;
}

.action-buttons {
	margin-right: 5px;
}

script {
	margin-top: 20px;
}

.custom-form {
	max-width: 400px;
	margin: auto;
	padding: 20px;
	background-color: #f8f9fa;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-group {
	margin-bottom: 15px;
}

.form-control {
	width: 100%;
	padding: 10px;
	border: 1px solid #ced4da;
	border-radius: 4px;
	box-sizing: border-box;
}

.btn-primary {
	padding: 10px 20px;
	font-size: 16px;
}

.action-form {
	display: inline-block; /* Align forms horizontally */
}

.action-buttons {
	margin-right: 5px;
	padding: 8px 16px;
	font-size: 14px;
}

.btn-danger {
	background-color: #dc3545;
	border-color: #dc3545;
	color: #fff;
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

		<form action="VilleController" method="post" class="custom-form">
			<div class="form-group">
				<label for="villeInput">Nom :</label> <input type="text"
					name="ville" id="villeInput" class="form-control"
					placeholder="Entrer le nom de la ville"
					value="${editVille != null ? editVille.nom : ''}" required>
			</div>
			<input type="hidden" name="action"
				value="${editVille != null ? 'update' : 'create'}"> <input
				type="hidden" name="id"
				value="${editVille != null ? editVille.id : ''}">
			<button type="submit" class="btn btn-primary">${editVille != null ? 'Mettre à jour' : 'Enregistrer'}</button>
		</form>

		<h2>Liste des villes :</h2>
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Nom</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${villes}" var="v">
					<tr>
						<td>${v.id}</td>
						<td>${v.nom}</td>
						<td>
							<form action="VilleController" method="post"
								onsubmit="return confirmDelete();" class="action-form">
								<input type="hidden" name="action" value="delete"> <input
									type="hidden" name="id" value="${v.id}">
								<button type="submit"
									class="btn btn-danger btn-sm action-buttons">Supprimer</button>
							</form>

							<form action="VilleController" method="get" class="action-form">
								<input type="hidden" name="action" value="edit"> <input
									type="hidden" name="id" value="${v.id}">
								<button type="submit"
									class="btn btn-primary btn-sm action-buttons">Modifier</button>
							</form>

						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script>
		function confirmDelete() {
			return confirm("Êtes-vous sûr de vouloir supprimer cette ville et les hôtels associés ?");
		}
	</script>
</body>
</html>
