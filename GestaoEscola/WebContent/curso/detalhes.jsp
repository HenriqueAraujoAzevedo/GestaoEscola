<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detalhes do Curso</title>
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
				<h3 class="panel-title">Detalhes do Curso</h3>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-4">
						<label><b>Nome: </b></label> <label><b>000.000.000-00</b></label>
					</div>
					<div class="col-md-4">
						<label><b>Carga Horária: </b></label> <label><b>000.000.000-00</b></label>
					</div>
				</div>
			</div>
			<div class="col-md-2">
				<input type="button" style="width: 100%" class="btn btn-default"
					value="Voltar" onCLick="window.location='lista.jsp'" />
			</div>
		</div>
	</div>
</body>
</html>