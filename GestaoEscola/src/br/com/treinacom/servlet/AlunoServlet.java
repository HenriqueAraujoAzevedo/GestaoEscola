package br.com.treinacom.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.treinacom.controlador.AlunoDAO;
import br.com.treinacom.model.Aluno;

/**
 * Servlet implementation class AlunoServlet
 */
@WebServlet("/AlunoServlet")
public class AlunoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlunoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//PrintWriter out = response.getWriter();
		
		//out.println("<h1>Executando o Servlet no get</h1>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		Aluno aluno = new Aluno();
		aluno.setNome(request.getParameter("txNome"));
		aluno.setMatricula(request.getParameter("txMatricula"));
		aluno.setCPF(request.getParameter("txCPF"));
		aluno.setEndereco(request.getParameter("txEndereco"));
		aluno.setTelefone(request.getParameter("txTelefone"));
		aluno.setSituacao(Integer.parseInt(request.getParameter("cbSituacaoAluno")));
		
		//Criando objeto da classe AlunoDAO
		AlunoDAO alunoDAO = new AlunoDAO();
		System.out.println(aluno.getTelefone());
	}
}
