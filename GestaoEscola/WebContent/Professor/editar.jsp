<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Dados Professor</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
				<%
		String alunoAtivo = "";
		String cursoAtivo = "";
		String professorAtivo = "class='active'";
		String matriculaAtivo = "";
	%>
	<%@include file ="../navbar.jsp" %>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Editar Dados Professor</h3>
			</div>
			<div class="panel-body">
				<form action="../ProfessorServlet" method="post">
					<div class="row">
						<div class="col-md-3">
							<label> Nome:</label> <input name="txNome" class="form-control" />
						</div>
						<div class="col-md-3">
							<label> CPF:</label> <input name="txCPF" class="form-control" />
						</div>
					</div>
				</form>
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

		</div>
	</div>
</body>
</html>