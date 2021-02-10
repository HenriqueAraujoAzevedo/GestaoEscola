<%@page import="java.util.ArrayList"%>
<%@page import="br.com.treinacom.model.Curso"%>
<%@page import="java.util.List"%>
<%@page import="br.com.treinacom.controlador.CursoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista de Cursos</title>
<script>
	function detalhar(id) {
		window, location = 'detalhes.jsp?id=' + id;
	}
	function editar(id) {
		window, location = 'editar.jsp?id=' + id;
	}
	function remover(id) {
		if (confirm("Tem certeza que deseja remover esse registro?")) {
			alert("Removido com sucesso.")
		}
	}
</script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<%
		//Recebendo os regustris do banco de dados	
		CursoDAO cursoDAO = new CursoDAO();
		List<Curso> lista = new ArrayList<Curso>();
		lista = cursoDAO.Listar();
		if (request.getParameter("txNomeCurso") != null) {
			//Nesta caso iremos realizar um filtro
			//lista = cursoDAO.Filtrar(request.getParameter("txNomeCurso"),
					Integer.parseInt(request.getParameter("txCargaHoraria")));
		} else {
			lista = cursoDAO.Listar();
		}
	%>
	<div class="container">
		<%
			String alunoAtivo = "";
			String cursoAtivo = "class='active'";
			String professorAtivo = "";
			String matriculaAtivo = "";
		%>
		<%@include file ="../navbar.jsp" %>

		<div class="panel-heading">
			<h3 class="panel-title">Filtro</h3>
		</div>
		<div class="panel-body">
			<form action="#" method="get">
				<div class="row">
					<div class="col-md-3">
						<label> Nome do Curso:</label> <input name="txNome"
							class="form-control" />
					</div>
					<div class="col-md-3">
						<label> Carga horária:</label> <input name="txCPF"
							class="form-control" />
					</div>
					<div class="col-md-2">
						<input type="submit" value="Filtrar" style="margin-top: 25px"
							class="btn btn-success">
					</div>
					<div class="col-md-1">
						<a href="lista.jsp" class="btn btn-default"
							style="width: 100%; margin-top: 25px"> <span
							class="glyphicon glyphicon-remove "></span>
						</a>
					</div>

				</div>
			</form>
		</div>


		<button class="btn btn-success"
			onCLick="window.location='cadastro.jsp'">
			<span class="
glyphicon glyphicon-plus" aria-hidden="true"></span>
			Novo Registro
		</button>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Nome do Curso</th>
					<th>Carga Horária</th>
					<th style="width: 150px;">Ações</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<%
						for (int i = 0; i < lista.size(); i++) {
					%>
				
				<tr>
					<td><%=lista.get(i).getNome()%></td>
					<td><%=lista.get(i).getCargaHoraria()%></td>
					<td>
						<button type="button" class="btn btn-warning" aria-label="Editar"
							onClick="editar(<%=lista.get(i).getId()%>)">
							<span class="
glyphicon glyphicon-pencil" aria-hidden="true"></span>
						</button>
						<button type="button" class="btn btn-info"
							onClick="detalhar(<%=lista.get(i).getId()%>)"
							aria-label="Detalhar">
							<span class="
glyphicon glyphicon-th-list" aria-hidden="true"></span>
						</button>
						<button type="button" class="btn btn-danger"
							onClick="remover(<%=lista.get(i).getId()%>)" aria-label="Excluir">
							<span class="
glyphicon glyphicon-trash" aria-hidden="true"></span>
						</button>
					</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<div class="col-md-2">
			<input type="button" style="width: 100%" class="btn btn-default"
				value="Voltar" onCLick="window.location='../index.jsp'" />
		</div>
	</div>
</body>
</html>