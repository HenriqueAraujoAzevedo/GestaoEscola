package br.com.treinacom.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.treinacom.controlador.AlunoCursoDAO;
import br.com.treinacom.model.AlunoCurso;

/**
 * Servlet implementation class AlunoCursoServlet
 */
@WebServlet("/AlunoCursoServlet")
public class AlunoCursoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AlunoCursoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		AlunoCurso alunoCurso = new AlunoCurso();
		alunoCurso.setIdAluno(Integer.parseInt(request.getParameter("cbAluno")));
		alunoCurso.setIdCurso(Integer.parseInt(request.getParameter("cbCurso")));

		AlunoCursoDAO alunoCursoDAO = new AlunoCursoDAO();

		try {
			if (request.getParameter("txID") == null) {
				alunoCursoDAO.Cadastrar(alunoCurso);
			} else {
				alunoCurso.setId(Integer.parseInt(request.getParameter("txID")));
				alunoCursoDAO.Editar(alunoCurso);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			response.sendRedirect("./Matricula/lista.jsp");
		}
	}

}
