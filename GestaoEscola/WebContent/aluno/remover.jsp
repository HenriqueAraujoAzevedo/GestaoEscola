<%@ page import="br.com.treinacom.controlador.AlunoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Remover aluno</title>
</head>
<body>
	<%
		if(request.getParameter("txID") != null){
			AlunoDAO alunoDAO = new AlunoDAO();	
	%>
	<script>
			alert("<%=alunoDAO.Remover(
					Integer.parseInt(request.getParameter("txID"))) %>");
	</script>
	<%
		}
	%>
	<script>
		window.location='./lista.jsp';
	</script>
</body>
</html>