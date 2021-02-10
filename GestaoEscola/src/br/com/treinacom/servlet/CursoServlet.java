package br.com.treinacom.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.treinacom.controlador.CursoDAO;
import br.com.treinacom.model.Curso;

/**
 * Servlet implementation class CursoServlet
 */
@WebServlet("/CursoServlet")
public class CursoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CursoServlet() {
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
		
		Curso curso = new Curso();
		curso.setNome(request.getParameter("txNome"));
		curso.setCargaHoraria(Integer.parseInt(request.getParameter("txCargaHoraria")));
		
		CursoDAO cursoDAO = new CursoDAO();
		
		try {
			cursoDAO.Cadastrar(curso);
			out.println("<h1>Curso Gravado com sucesso</h1>");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
