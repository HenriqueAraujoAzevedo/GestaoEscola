package br.com.treinacom.controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.treinacom.model.Curso;
import br.com.treinacom.model.Professor;
import br.com.treinacom.model.ProfessorCurso;

public class ProfessorCursoDAO {

	public String Cadastrar(ProfessorCurso professorcurso) throws SQLException {
		Connection connection = new FabricaConexao().getConnection();
			// criando query para inserir novo registro
			String sql = "insert into ProfessorCurso (IdProfessor, IdCurso) Values (?, ?)";

			PreparedStatement stmt = connection.prepareStatement(sql);

			// passando os valores para as colunas
			stmt.setInt(1, professorcurso.getIdProfessor());// Nome ProfessorCurso
			stmt.setInt(2, professorcurso.getIdCurso());// CPF ProfessorCurso

			// Executar o comando
			stmt.execute();
			stmt.close();
			connection.close();
			
			return ("Professor matriculado ao curso registrado com sucesso.");

	}

	@SuppressWarnings("finally")
	public ProfessorCurso Consultar(int id) throws SQLException {
		Connection connection = new FabricaConexao().getConnection();
		ProfessorCurso professorcurso = new ProfessorCurso();
		try {
			String query = "SELECT	pc.id,	p.nome as 'NomeProfessor',	c.nome as 'NomeCurso'FROM ProfessorCurso AS pc inner join Professor AS p ON pc.IdProfessor = p.id inner join Curso AS c ON pc.IdCurso = c.Id; ";

			PreparedStatement stmt = connection.prepareStatement(query);

			stmt.setInt(1, id);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				professorcurso.setId(rs.getInt("Id"));
				professorcurso.setNomeProfessor(rs.getString("IdProfessor"));
				professorcurso.setNomeCurso(rs.getString("IdCurso"));

			}
			stmt.close();

		} catch (SQLException ex) {

		} finally {
			connection.close();
			return professorcurso;
		}
	}

	public void Editar(ProfessorCurso professorcurso) throws SQLException {
		Connection connection = new FabricaConexao().getConnection();
		try {
			// criando query para inserir novo registro
			String sql = "UPDATE ProfessorCurso SET Nome = ?, CPF = ?, Matricula = ? WHERE Id=?";

			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setInt(1, professorcurso.getIdProfessor());// Nome ProfessorCurso
			stmt.setInt(2, professorcurso.getIdCurso());// CPF ProfessorCurso
			stmt.setInt(3, professorcurso.getId());// ID ALuno

			System.out.println("ProfessorCurso alterado com sucesso.");
		} catch (SQLException ex) {
			System.out.println("Ocorreu um erro ao alterar o professorcurso." + ex.getMessage());
		} finally {
			connection.close();
		}

	}

	@SuppressWarnings("finally")
	public List<ProfessorCurso> Listar() throws SQLException {
		Connection connection = new FabricaConexao().getConnection();
		List<ProfessorCurso> lista = new ArrayList<ProfessorCurso>();
		try {

			String query = "SELECT Id, Nome, CPF, Matricula FROM ProfessorCurso;";

			PreparedStatement stmt = connection.prepareStatement(query);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				ProfessorCurso professorcurso = new ProfessorCurso();
				professorcurso.setId(rs.getInt("Id"));
				professorcurso.setIdProfessor(rs.getInt("IdProfessor"));
				professorcurso.setIdCurso(rs.getInt("IdCurso"));
				lista.add(professorcurso);
			}
			stmt.close();

		} catch (SQLException ex) {

		} finally {
			connection.close();
			return lista;
		}
	}

	public void Remover(int id) throws SQLException {
		Connection connection = new FabricaConexao().getConnection();
		try {
			// criando query para inserir novo registro
			String sql = "DELETE FROM ProfessorCurso WHERE Id = ?";

			PreparedStatement stmt = connection.prepareStatement(sql);

			// passando os valores para as colunas
			System.out.println("Qual Id do ProfessorCurso a ser excluido? ");
			stmt.setInt(1, id);// ID ProfessorCurso

			// Executar o comando
			stmt.execute();
			stmt.close();

			System.out.println("Professor registrado no Curso com sucesso.");
		} catch (SQLException ex) {
			System.out.println("Ocorreu um erro ao registrar o Professor no curso." + ex.getMessage());
		} finally {
			connection.close();
		}

	}
	
	@SuppressWarnings("finally")
	public List<Professor> ListaProfessor () throws SQLException{
		Connection connection = new FabricaConexao().getConnection();
		List<Professor> lista = new ArrayList<Professor>();
		try {

			String query = "SELECT id,nome FROM professor order by Nome;";

			PreparedStatement stmt = connection.prepareStatement(query);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Professor professor= new Professor();
				professor.setId(rs.getInt("Id"));
				professor.setNome(rs.getString("Nome"));
				lista.add(professor);
			}
			stmt.close();

		} catch (SQLException ex) {

		} finally {
			connection.close();
			return lista;
		}
		
	}

	@SuppressWarnings("finally")
	public List<Curso> ListaCurso () throws SQLException{
		Connection connection = new FabricaConexao().getConnection();
		List<Curso> lista = new ArrayList<Curso>();
		try {

			String query = "SELECT id,nome FROM curso order by Nome;";

			PreparedStatement stmt = connection.prepareStatement(query);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Curso curso = new Curso();
				curso.setId(rs.getInt("Id"));
				curso.setNome(rs.getString("Nome"));
				lista.add(curso);
			}
			stmt.close();

		} catch (SQLException ex) {

		} finally {
			connection.close();
			return lista;
		}
		
	}

}
