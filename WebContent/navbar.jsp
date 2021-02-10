<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="http://localhost:8080/GestaoEscola">Gestão Escola</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">

						<li <%=alunoAtivo %>><a
							href="http://localhost:8080/GestaoEscola/aluno/lista.jsp"><span
								class="dropdown-menu"></span>Aluno</a></li>
						<li <%=professorAtivo%>><a
							href="http://localhost:8080/GestaoEscola/Professor/lista.jsp">Professor
						</a></li>
						<li <%=cursoAtivo %>><a
							href="http://localhost:8080/GestaoEscola/curso/lista.jsp">Curso
						</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Matricula <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="http://localhost:8080/GestaoEscola/aluno/cadastro.jsp">Cadastrar Aluno</a></li>
								<li ><a href="http://localhost:8080/GestaoEscola/MatriculaAluno/cadastro.jsp">Matricular Aluno</a></li>
								<li role="separator" class="divider"></li>
								<li ><a href="http://localhost:8080/GestaoEscola/Professor/cadastro.jsp">Cadastrar Professor</a></li>
								<li ><a href="http://localhost:8080/GestaoEscola/MatriculaProfessor/cadastro.jsp">Matricular Professor</a></li>
					
							</ul></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</div>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	
</body>
</html>