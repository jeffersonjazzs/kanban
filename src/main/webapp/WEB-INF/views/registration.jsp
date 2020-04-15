<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="pt-BR">
<head>
<meta name="description" content="Registration">
<meta name="author" content="Itimagine">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Registration</title>

<script src="./js/jquery-3.2.1.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/style.css">
<link rel="icon" href="./img/post-it.png">

</head>
<body>
	<div class="container">
		<h2 class="text-center">
			Junte-se <small>à Comunidade de Kanban</small>
		</h2>
		<form method="post">
			<main class="row">
				<div class="col-sm-6">
					<div class="row">
						<div class="col-xs-2"></div>
						<div class="col-xs-8">
							<div class="form-group">
								<label for="name">Nome:</label> <input class="form-control"
									id="name" placeholder="Name" name="name" minlength="3"
									maxlength="15" required>
							</div>
							<div class="form-group">
								<label for="surname">Sobrenome:</label> <input
									class="form-control" id="surname" placeholder="Surname"
									name="surname" minlength="3" maxlength="20" required>
							</div>
							<div class="form-group">
								<label for="nick">Nick:</label> <input class="form-control"
									id="nick" placeholder="Nick" name="nick" minlength="3"
									maxlength="10" required>
							</div>
							<div class="form-group">
								<label for="password">Senha:</label> <input type="password"
									class="form-control" id="password" placeholder="Password"
									name="password" minlength="6" maxlength="15" required>
							</div>
							<div class="form-group">
								<label for="company">Código da empresa:<br> <small>
										Se não houver no banco de dados, a empresa será criada.</small>
								</label> <input class="form-control" id="company" placeholder="Company"
									name="company" minlength="6" maxlength="15" required>
							</div>
						</div>
						<div class="col-xs-2"></div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="row">
						<p>
							<strong>Selecionar avatar:</strong>
						</p>
						<c:forEach var="i" begin="1" end="49">
							<div class="radio" style="display: inline;">
								<label> <input type="radio" name="avatar"
									value="${i}.png" required> <img src="./img/${i}.png"
									alt="Avatar" style="width: 50px; padding: 5% 2%;">
								</label>
							</div>
						</c:forEach>
					</div>
				</div>
			</main>
			<article class="row">
				<div class="col-xs-3"></div>
				<div class="col-xs-6">
					<p class="bg-info text-center">${infoRegistration}</p>
				</div>
				<div class="col-xs-3"></div>
			</article>
			<nav class="row" style="margin-bottom: 1%;">
				<div class="col-xs-1"></div>
				<div class="col-xs-3 col-md-2 text-right">
					<a class="btn btn-default" href="index">« Home</a>
				</div>
				<div class="col-xs-4 col-md-2 text-right">
					<a class="btn btn-default" href="login">« Login</a>
				</div>
				<div class="col-xs-3 col-md-6 text-right">
					<button class="btn btn-primary">Registrar »</button>
				</div>
				<div class="col-xs-1"></div>
			</nav>
		</form>
	</div>
</body>
</html>