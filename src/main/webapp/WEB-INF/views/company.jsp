<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
<meta name="description" content="Company">
<meta name="author" content="Itimagine">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Empresa</title>

<script src="./js/backToTheSamePlace.js"></script>
<script src="./js/jquery-3.2.1.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/style.css">
<link rel="icon" href="./img/post-it.png">

</head>
<body>
	<nav class="navbar navbar-default navbar-static-top">
		<div class="container">
			<p class="navbar-text navbar-left">
				<img src="./img/post-it-mini.png" alt="Notes">
			</p>
			<p class="navbar-text navbar-left">Kanban</p>
			<ul class="nav navbar-nav navbar-left">
				<li class="active"><a href="company">Empresa</a></li>
				<li><a href="profile">Perfil</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="logout">Logout</a></li>
			</ul>
		</div>
	</nav>
	
	<main>
		<article class="container">
			<header class="row">
				<div class="col-xs-12">
					<h2>Time:</h2>
				</div>
			</header>
			<section class="row">
				<div class="col-xs-12">
					<c:forEach items="${employees}" var="employee">
						<figure style="display: inline-block;">
							<img src="./img/${employee.getAvatar()}" alt="Avatar"
								style="margin: 10px; width: 150px;">
							<figcaption>
								<c:choose>
									<c:when
										test="${employee.getName().length() + employee.getName().length() < 20}">
                                        ${employee.getName()} ${employee.getSurname()}
                                    </c:when>
									<c:otherwise>
                                        ${employee.getName().charAt(0)}. ${employee.getSurname()}
                                    </c:otherwise>
								</c:choose>
							</figcaption>
						</figure>
					</c:forEach>
				</div>
			</section>
			<section class="row">
				<div class="col-xs-12">
					<h2 style="margin-bottom: 2%;">Projetos:</h2>
					<p class="bg-info text-center">${infoProject}</p>
					<table class="table table-hover table-bordered">
						<thead>
							<tr>
								<th>Deletar</th>
								<th>Projeto</th>
								<th>Descrição</th>
								<th>Tarefa</th>
								<th>Enter</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${projects}" var="project">
								<tr>
									<td>
										<form method="post">
											<input type="hidden" name="idProject"
												value="${project.getId()}">
											<button class="btn btn-danger btn-xs">Deletar</button>
										</form>
									</td>
									<td>${project.getName()}</td>
									<td>${project.getDescription()}</td>
									<td>${project.getListOfTasks().size()}</td>
									<td><a href="project?idProject=${project.getId()}"> <span
											class="badge">»</span>
									</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</section>
			<section class="row">
				<div class="col-xs-12">
					<h2 style="margin-bottom: 4%;">Add um novo projeto:</h2>
					<form method="post">
						<div class="col-sm-4 text-center">
							<div class="form-group">
								<label for="name">Nome:</label> <input class="form-control"
									id="name" placeholder="Name" name="name" minlength="3"
									maxlength="15" style="margin-top: 1%;" required>
							</div>
						</div>
						<div class="col-sm-4 text-center">
							<div class="form-group">
								<label for="description">Conteúdo:</label> <input
									class="form-control" id="description" placeholder="Description"
									name="description" minlength="8" maxlength="64"
									style="margin-top: 1%;" required>
							</div>
						</div>
						<div class="col-sm-4 text-center">
							<input type="hidden" name="idProject" value="0">
							<button class="btn btn-primary" style="margin-top: 25px;">Add
								um projeto »</button>
						</div>
					</form>
				</div>
			</section>
		</article>
	</main>

</body>
</html>