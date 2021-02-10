<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Dados Aluno</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<%
			String alunoAtivo = "";
			String cursoAtivo = "class='active'";
			String professorAtivo = "";
			String matriculaAtivo = "";
		%>

		<%@include file ="../navbar.jsp" %>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Editar Dados Curso</h3>
			</div>
			<div class="panel-body">
				<form action="../CursoServlet" method="post">
					<div class="row">
						<div class="col-md-3">
							<label> Nome do Curso:</label> <input name="txNome"
								class="form-control" />
						</div>
						<div class="col-md-3">
							<label> Carga Horária:</label> <input name="txCargaHoraria"
								class="form-control" />
						</div>
						<div class="col-md-3"></div>
					</div>
					<div class="row">
						<div class="col-md-2">
							<input type="button" style="width: 50%" class="btn-default"
								value="Voltar" onClick="window.location='lista.jsp'" />
						</div>
						<div class="col-md-2 col-md-offset-8">
							<input type="submit" style="width: 50%" class="btn-success"
								value="Editar" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>