<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Professor</title>
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
				<h3 class="panel-title">Cadastro de Professor</h3>
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
					<div class="row">
						<div class="col-md-2">
							<input type="button" style="width: 100%" class="btn btn-default"
								value="Voltar" onCLick="window.location='../index.jsp'" />
						</div>
						<div class="col-md-2 col-md-offset-8">
							<input type="submit" style="width: 100%" class="btn-success"
								value="Gravar" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>