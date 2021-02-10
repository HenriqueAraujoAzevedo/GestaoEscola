package br.com.treinacom.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import br.com.treinacom.controlador.ProfessorCursoDAO;
import br.com.treinacom.model.ProfessorCurso;

/**
 * Servlet implementation class ProfessorCursoServlet
 */
@WebServlet("/ProfessorCursoServlet")
public class ProfessorCursoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfessorCursoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		ProfessorCurso professorCurso = new ProfessorCurso();
		professorCurso.setIdProfessor(Integer.parseInt(request.getParameter("cbProfessor")));
		professorCurso.setIdCurso(Integer.parseInt(request.getParameter("cbCurso")));
	
		ProfessorCursoDAO professorCursoDAO = new ProfessorCursoDAO();

		try {
			if (request.getParameter("txID") == null) {
				out.println(professorCursoDAO.Cadastrar(professorCurso));
			}else {				
				professorCurso.setId(Integer.parseInt(request.getParameter("txID")));
				professorCursoDAO.Editar(professorCurso);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
