<%@page import="br.com.treinacom.model.Curso"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.treinacom.model.Professor"%>
<%@page import="java.util.List"%>
<%@page import="br.com.treinacom.controlador.ProfessorCursoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastrar Professor em um Curso</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<%
		String alunoAtivo = "";
		String cursoAtivo = "";
		String professorAtivo = "";
		String matriculaAtivo = "class='active'";
	%>
	<%@include file="../navbar.jsp"%>
	<%
		ProfessorCursoDAO professorCursoDAO = new ProfessorCursoDAO();
		List<Professor> professores = new ArrayList<Professor>();
		List<Curso> cursos = new ArrayList<Curso>();

		professores = professorCursoDAO.ListaProfessor();
		cursos = professorCursoDAO.ListaCurso();
	%>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Matrículas de Curso</h3>
			</div>
			<div class="panel-body">
			<form action="../ProfessorCursoServlet" method ="post">
				<div class="col-md-6">
					<label> <b>Nome do Professor: </b></label> <select
						name="cbProfessor" class="form-control">
						<% for (int i = 0; i < professores.size(); i++) {%>
						<option value="<%=professores.get(i).getId()%>">
							<%=professores.get(i).getNome()%>
						</option>
						<%
							}
						%>
					</select>
				</div>
				<div class="col-md-offset-6">
					<label> <b>Nome do Curso: </b></label> <select name="cbCurso"
						class="form-control">
						<%for (int i = 0; i < cursos.size(); i++) {%>
						<option value="<%=cursos.get(i).getId()%>">
							<%=cursos.get(i).getNome()%>
						</option>
						<%
							}
						%>
					</select>
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