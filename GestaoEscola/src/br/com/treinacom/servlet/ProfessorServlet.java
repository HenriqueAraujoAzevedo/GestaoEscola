package br.com.treinacom.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.treinacom.controlador.ProfessorDAO;
import br.com.treinacom.model.Professor;

/**
 * Servlet implementation class ProfessorServlet
 */
@WebServlet("/ProfessorServlet")
public class ProfessorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfessorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		PrintWriter out = response.getWriter();

		//out.println(request.getParameter("txNome"));
		//out.println(request.getParameter("txCPF"));
		Professor professor = new Professor();
		professor.setNome(request.getParameter("txNome"));
		professor.setCPF(request.getParameter("txCPF"));
		//Integer.parseInt(String);
		
		
		ProfessorDAO professorDAO = new ProfessorDAO();
		
		try {
			professorDAO.Cadastrar(professor);
			out.println("<h1> Professor Gravado com Sucesso</h1>");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
