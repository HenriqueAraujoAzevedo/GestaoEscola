<%@page import="br.com.treinacom.controlador.AlunoCursoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.treinacom.model.AlunoCurso"%>
<%@page import="java.util.List"%>
<%@page import="br.com.treinacom.model.Situacao"%>
<%@page import="br.com.treinacom.model.Aluno"%>
<%@page import="br.com.treinacom.controlador.AlunoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8
">
<title>Detalhes do Aluno</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<%
		String alunoAtivo = "class ='active'";
		String cursoAtivo = "";
		String professorAtivo = "";
		String matriculaAtivo = "";
	%>
	<%
		Aluno aluno = new Aluno();
		AlunoDAO alunoDAO = new AlunoDAO();
		Situacao situacao = new Situacao();
		List<AlunoCurso> lista = new ArrayList<AlunoCurso>();
		
		//lista = AlunoCursoDAO.Listar();
		aluno = alunoDAO.Consultar(Integer.parseInt(request.getParameter("id")));
	%>

	<%@include file="../navbar.jsp"%>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Detalhes do Aluno</h3>
			</div>
			<div class="panel-body">
				<input type="hidden" name="txID" value="<%=aluno.getId()%>" />
				
						<Label> <b>Nome:</b></label> <%=aluno.getNome()%> <BR>
						<Label> CPF: </label> <%=aluno.getCPF()%> <BR>
						<Label> Matricula: </label> <%=aluno.getMatricula()%> <BR>
						<Label> Endereço: </label> <%=aluno.getEndereco()%> <BR>
						<Label> Telefone: </label> <%=aluno.getTelefone()%> <BR>
						<Label> Situação: </label> <%=aluno.getSituacao()%> <BR>
						
			</div>
			<div class="col-md-2">
				<input type="button" style="width: 100%" class="btn btn-default"
					value="Voltar" onCLick="window.location='lista.jsp'" />
			</div>
		</div>
	</div>
</body>
</html>