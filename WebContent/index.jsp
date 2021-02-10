<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Página Inicial</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<%
		String alunoAtivo = "";
		String cursoAtivo = "";
		String professorAtivo = "";
	%>
		<%@include file ="navbar.jsp" %>
		<div class="jumbotron">
			<h1>Bem Vindo!</h1>
			<p>Informamos que o sistema está em desenvolvimento, o que poderá
				tornar indisponíveis algumas funções.</p>
		</div>
	</div>
</body>
</html>