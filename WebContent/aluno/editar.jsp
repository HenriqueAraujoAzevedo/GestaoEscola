<%@page import="java.util.ArrayList"%>
<%@page import="br.com.treinacom.model.Situacao"%>
<%@page import="java.util.List"%>
<%@page import="br.com.treinacom.controlador.AlunoDAO"%>
<%@page import="br.com.treinacom.model.Aluno"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Dados Aluno</title>
<script>
	function voltar() {
		window.location = 'lista.jsp'
	}
</script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<%
		Aluno aluno = new Aluno();
		AlunoDAO alunoDAO = new AlunoDAO();
		aluno = alunoDAO.Consultar(Integer.parseInt(request.getParameter("id")));
		List<Situacao> situacoes = new ArrayList<Situacao>();

		situacoes = alunoDAO.ListaSituacao();
	%>
	<%
		String alunoAtivo = "class ='active'";
		String cursoAtivo = "";
		String professorAtivo = "";
		String matriculaAtivo = "";
	%>


	<%@include file="../navbar.jsp"%>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Editar Dados Aluno</h3>
			</div>
			<div class="panel-body">
				<form action="../AlunoServlet" method="post">
					<input type="hidden" name="txID" value="<%=aluno.getId()%>" />
					<div class="row">
						<div class="col-md-2">
							<label>Nome:</label><input name="txNome"
								value="<%=aluno.getNome()%>" class="form-control" />
						</div>
						<div class="col-md-2">
							<label>CPF:</label><input name="txCPF"
								value="<%=aluno.getCPF()%>" class="form-control" />
						</div>
						<div class="col-md-2">
							<label>Matricula:</label><input name="txMatricula"
								value="<%=aluno.getMatricula()%>" class="form-control" />
						</div>
						<div class="col-md-2">
							<label>Endereço:</label><input name="txEndereco"
								value="<%=aluno.getEndereco()%>" class="form-control" />
						</div>
						<div class="col-md-2">
							<label>Telefone:</label><input name="txTelefone"
								value="<%=aluno.getTelefone()%>" class="form-control" />
						</div>
						<div class="col-md-2">
						<label> <b>Situação do Aluno: </b></label> <select
							name="cbSituacaoAluno" class="form-control">
							<%
								for (int i = 0; i < situacoes.size(); i++) {
							%>
							<option <%if (situacoes.get(i).getId() == aluno.getSituacao()) {%>
								selected <%}%>
								value="<%=situacoes.get(i).getId()%>">
								<%=situacoes.get(i).getNome()%>
							</option>
							<%
								}
							%>

						</select>
					</div>
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
				</form>
			</div>
		</div>
	</div>
</body>
</html>