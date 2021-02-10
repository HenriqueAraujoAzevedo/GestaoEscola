<%@page import="java.util.ArrayList"%>
<%@page import="br.com.treinacom.model.AlunoCurso"%>
<%@page import="java.util.List"%>
<%@page import="br.com.treinacom.controlador.AlunoCursoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista de Alunos por Curso</title>
<script>
function detalhar(id){
	window,location= 'detalhes.jsp?id=' + id;
	}
function editar(id){
	window,location= 'editar.jsp?id=' + id;
	}
function remover(id){
	if (confirm("Tem certeza que deseja remover esse registro?")){
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
		AlunoCursoDAO alunoCursoDAO = new AlunoCursoDAO();
		List<AlunoCurso> lista = new ArrayList<AlunoCurso>();
		lista = alunoCursoDAO.Listar();
	%>
	<div class="container">
				<%
		String alunoAtivo = "";
		String cursoAtivo = "";
		String professorAtivo = "";
		String matriculaAtivo = "class='active'";
	%>
		<%@include file ="../navbar.jsp" %>
		<button class="btn btn-success"
			onCLick="window.location='matriculaAluno.jsp'">
			<span class="
glyphicon glyphicon-plus" aria-hidden="true"></span>
			Novo Registro
		</button>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Nome do Aluno</th>
					<th>Nome do Curso</th>
					<th style="width: 150px;">Ações</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < lista.size(); i++) {
				%>
				<tr>
					<td><%=lista.get(i).getNomeAluno()%></td>
					<td><%=lista.get(i).getNomeCurso()%></td>
					<td>
						<button type="button" class="btn btn-warning" aria-label="Editar"
							onClick="editar(<%=lista.get(i).getId()%>)">
							<span class="
glyphicon glyphicon-pencil" aria-hidden="true"></span>
						</button>
						<button type="button" class="btn btn-info"
							onClick="detalhar(<%=lista.get(i).getId()%>);"
							aria-label="Detalhar">
							<span class="
glyphicon glyphicon-th-list" aria-hidden="true"></span>
						</button>
						<button type="button" class="btn btn-danger"
							onClick="remover(<%=lista.get(i).getId()%>)"
							aria-label="Excluir">
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