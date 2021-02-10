<%@ page import="java.util.ArrayList"%>
<%@ page import="br.com.treinacom.model.Aluno"%>
<%@ page import="java.util.List" %>
<%@ page import="br.com.treinacom.controlador.AlunoDAO" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista de Aluno</title>
<script>
	function detalhar(id){
		window.location='detalhes.jsp?id=' + id;
	}
	
	function editar(id){
		window.location='editar.jsp?id=' + id;
	}
	
	function remover(id){
		if(confirm("Tem certeza que deseja remover este registro?")){
			window.location='remover.jsp?txID=' + id;
		}
	}
</script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<% 
		String alunoAtivo = "class='active'";
		String cursoAtivo = "";
		String professorAtivo = ""; 
		String matriculaAtivo = ""; 
	%>

	<%
		//Recebendo os registros do banco de dados
		AlunoDAO alunoDAO = new AlunoDAO();
		List<Aluno> lista = new ArrayList<Aluno>();
		
		//Verificando se há parâmetros na URL
		if(request.getParameter("txNome") != null){
			//Neste caso iremos realizar um filtro
			lista = alunoDAO.Filtrar(
					request.getParameter("txNome"),
					request.getParameter("txCPF"),
					request.getParameter("txMatricula"));
		} else {
			lista = alunoDAO.Listar();	
		}
	%>
		<%@include file="../navbar.jsp"%>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Filtro</h3>
			</div>
			<div class="panel-body">
				<div class="row">
					<form action="lista.jsp">
						<div class="col-md-3">
							<label>Nome:</label>
							<input name="txNome" class="form-control" />
						</div>
						<div class="col-md-3">
							<label>CPF:</label>
							<input name="txCPF" class="form-control" />
						</div>
						<div class="col-md-3">
							<label>Matrícula:</label>
							<input name="txMatricula" class="form-control" />
						</div>
						<div class="col-md-2">
							<input type="submit" value="Filtrar" 
								class="btn btn-success" 
								style="width:100%; margin-top: 25px;" />
						</div>
						<div class="col-md-1">
							<a href="lista.jsp" class="btn btn-default" style="width:100%; 
								margin-top: 25px;">
								<span class="glyphicon glyphicon-remove"></span>
							</a>
						</div>
					</form>
				</div><!-- Finalizando div ROW -->
			</div><!-- Finalizando a div panel-body -->
		</div><!-- Finalizando a div panel -->
		
		
		
		
		
		
		<button class="btn btn-success" onClick="window.location='cadastro.jsp'">
			<span class="glyphicon glyphicon-plus"></span> Novo Registro
		</button>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Nome</th>
					<th>CPF</th>
					<th>Matrícula</th>
					<th>Telefone</th>
					<th>Situação</th>
				
					<th style="width: 150px;">Ações</th>
				</tr>
			</thead>
			<tbody>
				<% for(int i = 0; i < lista.size(); i++){ %>
				<tr>
					<td><%=lista.get(i).getNome()%></td>
					<td><%=lista.get(i).getCPF()%></td>
					<td><%=lista.get(i).getMatricula()%></td>
					<td><%=lista.get(i).getTelefone()%></td>
					<td><%=lista.get(i).getSituacao()%>
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