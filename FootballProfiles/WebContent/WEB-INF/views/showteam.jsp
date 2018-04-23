<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Football Profiles</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Plugin CSS -->
<link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet"
	type="text/css">

<!-- Custom styles for this template -->
<link href="css/freelancer.min.css" rel="stylesheet">

</head>

<body id="page-top">

	<!-- Navigation -->
	<nav
		class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase"
		id="mainNav">
		<div class="container">

			<a class="navbar-brand js-scroll-trigger" href="#page-top">${team.teamName }</a>
			<button
				class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded"
				type="button" data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fa fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="#portfolio">Players</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="#about">Update</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="#contact">Contact</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="index.do">Home</a></li>
				</ul>

			</div>
		</div>
	</nav>

	<!-- Header -->
	<header class="masthead bg-primary text-white text-center">
		<div class="container">
			<img class="img-fluid mb-5 d-block mx-auto"
				src="img/ChelseaCrest.png" alt="">
			<h1 class="text-uppercase mb-0">${team.teamName }</h1>
			<hr class="star-light">
		</div>
	</header>

	<!-- Portfolio Grid Section -->
	<section class="portfolio" id="portfolio">
		<div class="container">
			<h2 class="text-center text-uppercase text-secondary mb-0">Team
				Info</h2>
			<hr class="star-dark mb-5">

			<div class="form-row">
				<div class="form-group col-md-4">
					<h4 class="text-center">
						<u>Team Name</u>
					</h4>
				</div>
				<div class="form-group col-md-4">
					<h4 class="text-center">
						<u>City</u>
					</h4>
				</div>
				<div class="form-group col-md-4">
					<h4 class="text-center">
						<u>Country</u>
					</h4>
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-4">
					<h4 class="text-center text-uppercase text-secondary mb-0">${team.teamName }</h4>
				</div>
				<div class="form-group col-md-4">
					<h4 class="text-center text-uppercase text-secondary mb-0">${team.city }</h4>
				</div>
				<div class="form-group col-md-4">
					<h4 class="text-center text-uppercase text-secondary mb-0">${team.country }</h4>
				</div>
			</div>
			<br>

			<h2 class="text-center text-uppercase text-secondary mb-0">Player
				Info</h2>
			<hr class="star-dark mb-5">

			<div class="form-row">
				<div class="form-group col-md-4">
					<h4 class="text-center">
						<u>Player Name</u>
					</h4>
				</div>
				<div class="form-group col-md-4">
					<h4 class="text-center">
						<u>Position</u>
					</h4>
				</div>
				<div class="form-group col-md-4">
					<h4 class="text-center">
						<u>Number</u>
					</h4>
				</div>
			</div>

			<c:forEach var="p" items="${players }">
				<div class="form-row">
					<div class="form-group col-md-4">
						<h4 class="text-center text-uppercase text-secondary mb-0">${p.firstName }</h4>
					</div>
					<div class="form-group col-md-4">
						<h4 class="text-center text-uppercase text-secondary mb-0">${p.position }</h4>
					</div>
					<div class="form-group col-md-4">
						<h4 class="text-center text-uppercase text-secondary mb-0">${p.teamNumber }</h4>
					</div>
				</div>
				<br>
			</c:forEach>

		</div>
	</section>

	<!-- Footer -->
	<footer class="footer text-center">
		<div class="container">
			<h2 class="text-center text-uppercase mb-2">Modify Team</h2>
			<hr class="star-dark mb-5">
			<div class="form-row">
				<div class="form-group col-md-4">
					<form action="update.do" method="GET">
						<input type="hidden" name="teamID" value="${team.id }" />
						<button type="submit" class="btn btn-primary">Update Team</button>
					</form>
				</div>
				<div class="form-group col-md-4">
					<form action="newPlayer.do" method="GET">
						<input type="hidden" name="teamID" value="${team.id }" />
						<button type="submit" class="btn btn-primary">Add Player</button>
					</form>
				</div>
				<div class="form-group col-md-4">
					<form action="delete.do" method="POST">
						<input type="hidden" name="teamID" value="${team.id }" />
						<button type="submit" class="btn btn-primary">Delete Team</button>
					</form>

				</div>
			</div>
		</div>
	</footer>

</body>
</html>

