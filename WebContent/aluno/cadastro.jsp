<%@page import="br.com.treinacom.model.Situacao"%>
<%@page import="br.com.treinacom.controlador.AlunoCursoDAO"%>
<%@page import="br.com.treinacom.controlador.AlunoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.treinacom.model.Aluno"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Aluno</title>
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
		AlunoDAO alunoDAO = new AlunoDAO();
		List<Situacao> situacoes = new ArrayList<Situacao>();

		situacoes = alunoDAO.ListaSituacao();
	%>

	<%@ include file="../navbar.jsp"%>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Cadastro de Aluno</h3>
			</div>
			<div class="panel-body">
				<form action="../AlunoServlet" method="post">
					<div class="row">
						<div class="col-md-2">
							<label>Nome:</label>
							<input name="txNome" class="form-control" />
						</div>
						<div class="col-md-2">
							<label>CPF</label>
							<input name="txCPF" class="form-control" />
						</div>
						<div class="col-md-2">
							<label>Matrícula</label>
							<input name="txMatricula" class="form-control" />
						</div>
						<div class="col-md-2">
							<label>Endereço</label>
							<input name="txEndereco" class="form-control" />
						</div>
						<div class="col-md-2">
							<label>Telefone</label>
							<input name="txTelefone" class="form-control" />
						</div>
												<div class="col-md-2">
					<label> <b>Situação do Aluno: </b></label> <select name="cbSituacaoAluno"
						class="form-control">
						<%	for (int i = 0; i < situacoes.size(); i++) {%>
								<option value="<%=situacoes.get(i).getId()%>">
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
							<input type="button" style="width: 100%" class="btn btn-default"
								value="Voltar" onCLick="window.location='lista.jsp'" />
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