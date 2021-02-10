<%@ page import="java.util.ArrayList"%>
<%@ page import="br.com.treinacom.model.AlunoCurso"%>
<%@ page import="java.util.List" %>
<%@ page import="br.com.treinacom.controlador.AlunoCursoDAO" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista de Matrículas</title>
<script>
	function detalhar(id){
		window.location='detalhes.jsp?id=' + id;
	}
	
	function editar(id){
		window.location='editar.jsp?id=' + id;
	}
	
	function remover(id){
		if(confirm("Tem certeza que deseja remover este registro?")){
			//remover do banco de dados
			//alert("Removido com sucesso.");
			console.log("excluido")
		}
	}
</script>

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
		//Recebendo os registros do banco de dados
		AlunoCursoDAO alunocursoDAO = new AlunoCursoDAO();
		List<AlunoCurso> lista = new ArrayList<AlunoCurso>();
		lista = alunocursoDAO.Listar();
	%>
	<div class="container">
		<button class="btn btn-success" onClick="window.location='Cadastro.jsp'">
			<span class="glyphicon glyphicon-plus"></span> Novo Registro
		</button>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Aluno</th>
					<th>Curso</th>
					<th style="width: 150px;">Ações</th>
				</tr>
			</thead>
			<tbody>
				<% for(int i = 0; i < lista.size(); i++){ %>
				<tr>
					<td><%=lista.get(i).getNomeAluno() %></td>
					<td><%=lista.get(i).getNomeCurso() %></td>
					<td>
						<button type="button" class="btn btn-warning" onClick="editar(<%=lista.get(i).getId() %>)">
						  <span class="glyphicon glyphicon-pencil"></span>
						</button>
						
						<button type="button" class="btn btn-info" onClick="detalhar(<%=lista.get(i).getId() %>)">
						  <span class="glyphicon glyphicon-th-list"></span>
						</button>
						
						<button type="button" class="btn btn-danger" onClick="remover(<%=lista.get(i).getId() %>)">
						  <span class="glyphicon glyphicon-trash"></span>
						</button>
					</td>
				</tr>
				<% } %>
			</tbody>
		</table>
	</div>
</body>
</html>