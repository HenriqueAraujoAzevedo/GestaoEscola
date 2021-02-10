<%@page import="br.com.treinacom.controlador.AlunoCursoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.treinacom.model.Curso"%>
<%@page import="br.com.treinacom.model.Aluno"%>
<%@page import="java.util.List"%>
<%@page import="br.com.treinacom.controlador.AlunoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de Matrículas</title>
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
	<%@include file="../navbar.jsp" %>
	<%
		AlunoCursoDAO alunoCursoDAO  = new AlunoCursoDAO();
		List<Aluno> alunos = new ArrayList<Aluno>();
		List<Curso> cursos = new ArrayList<Curso>();
		//Recebendo lista da classe DAO
		alunos = alunoCursoDAO.ListaAluno();
		cursos = alunoCursoDAO.ListaCurso();
	%>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Cadastro de Matrícula</h3>
			</div>
			<div class="panel-body">
				<form action="" method="post">
					<div class="row">
						<div class="col-md-2">
							<label>Aluno:</label>
							<select name="cbAluno" class="form-control">
								<% for(int i = 0; i < alunos.size(); i++){ %>
									<option value="<%=alunos.get(i).getId() %>">
										<%=alunos.get(i).getNome() %>
									</option>
								<% } %>
							</select>
						</div>
						<div class="col-md-2">
							<label>Curso:</label>
							<select name="cbCurso" class="form-control">
								<% for(int i = 0; i < cursos.size(); i++){ %>
									<option value="<%=cursos.get(i).getId() %>">
										<%=cursos.get(i).getNome() %>
									</option>
								<% } %>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							<input type="button" style="width: 100%;" class="btn btn-default" value="Voltar" />
						</div>
						<div class="col-md-2 col-md-offset-8">
							<input type="submit" style="width: 100%;" class="btn btn-success" value="Gravar" />
						</div>
					</div>
				</form> 
			</div>
		</div>
	</div>
</body>
</html>