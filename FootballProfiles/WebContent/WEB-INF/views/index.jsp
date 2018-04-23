<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Football Profiles</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="css/override.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="jumbotron text-center">
			<h1>Real Football Profiles</h1>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-xs-4">
				<div class="thumbnail">
					<a href="images/BayernCrest.png"> <img
						src="images/BayernCrest.png" alt="Bayern" class="img-responsive">
					</a>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="thumbnail">
					<a href="images/ChelseaCrest.png"> <img
						src="images/ChelseaCrest.png"" alt="Nature" class="img-responsive">
					</a>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="thumbnail">
					<a href="images/LiverpoolCrest.png"> <img
						src="images/LiverpoolCrest.png" alt="Fjords" class="img-responsive">
					</a>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-xs-4">
				<div class="thumbnail">
					<a href="images/JuventusCrest.png"> <img
						src="images/JuventusCrest.png" alt="Bayern" style="height: 190px">
					</a>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="thumbnail">
					<a href="images/RealMadridCrest.png"> <img
						src="images/RealMadridCrest.png"" alt="Nature" style="background-color: lightblue">
					</a>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="thumbnail">
					<a href="images/LiverpoolCrest.png"> <img
						src="images/LiverpoolCrest.png" alt="Fjords" style="background-color: lightblue">
					</a>
				</div>
			</div>
		</div>
	</div>


	<h2>Below is a list of Football Teams</h2>

	<c:if test="${teams.size() > 0 }">
		<table>
			<tr>
				<th>Team Name</th>
				<th>City</th>
				<th>Country</th>
			</tr>
			<c:forEach var="t" items="${teams }">
				<tr>
					<td>${t.teamName }</td>
					<td>${t.city }</td>
					<td>${t.country }</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>


	<form action="team.do" method="GET">
		<div class="form-group container">
			<div class="col-sm-4 row">
				<h4>Select a Team by ID</h4>
				<label for="tID">Team ID:</label><input type="number" min="1"
					class="form-control" name="tID" required /> <br> <span
					class="form-group-button">
					<button type="submit" class="btn btn-primary">Submit</button>
				</span>
			</div>
		</div>
	</form>

	<form action="create.do" method="POST">
		<div class="form-group container">
			<div class="col-sm-4 row">
				<h4>Create a New Team</h4>
				<label for="teamName">Team Name:</label><input type="text"
					class="form-control" name="teamName" required /> <br> <label
					for="city">City: </label><input type="text" class="form-control"
					name="city" required /> <br> <label for="country">Country:
				</label><input type="text" class="form-control" name="country" required />
				<br> <span class="form-group-button">
					<button type="submit" class="btn btn-primary">Submit</button>
				</span>
			</div>
		</div>
	</form>

	<form action="delete.do" method="POST">
		<div class="form-group container">
			<div class="col-sm-4 row">
				<h4>Delete Team by ID:</h4>
				<label for="deleteTeam">Team ID:</label><input type="number"
					class="form-control" name="teamID" required><span
					class="input-group-addon">!</span> <br> <span
					class="form-group-button"><button type="submit"
						class="btn btn-primary">Submit</button></span> <span>${result }</span>
			</div>

		</div>


	</form>



</body>
</html>