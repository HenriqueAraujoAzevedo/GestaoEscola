package br.com.treinacom.controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.treinacom.model.Aluno;
import br.com.treinacom.model.AlunoCurso;
import br.com.treinacom.model.Curso;

public class AlunoCursoDAO {

	public String Cadastrar(AlunoCurso alunocurso) throws SQLException {
		Connection connection = new FabricaConexao().getConnection();
		// criando query para inserir novo registro

		String sql = "insert into AlunoCurso (IdAluno, IdCurso) Values (?,?)";

		PreparedStatement stmt = connection.prepareStatement(sql);

		// passando os valores para as colunas
		stmt.setInt(1, alunocurso.getIdAluno());
		stmt.setInt(2, alunocurso.getIdCurso());

		// Executar o comando
		stmt.execute();
		stmt.close();
		connection.close();
		
		AlunoDAO alunoDAO = new AlunoDAO();
		CursoDAO cursoDAO = new CursoDAO();

		return "Aluno " + alunoDAO.Consultar(alunocurso.getIdAluno()).getNome() + 
				" matriculado com sucesso no curso " + cursoDAO.Consultar(alunocurso.getIdCurso()).getNome();
	}

	@SuppressWarnings("finally")
	public AlunoCurso Consultar(int id) throws SQLException {
		Connection connection = new FabricaConexao().getConnection();
		AlunoCurso alunocurso = new AlunoCurso();
		try {
			String query = "SELECT Id, Nome, CPF, Matricula FROM Aluno WHERE Id = ?;";

			PreparedStatement stmt = connection.prepareStatement(query);

			stmt.setInt(1, id);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				alunocurso.setIdAluno(rs.getInt("IdAluno"));
				alunocurso.setIdCurso(rs.getInt("IdCurso"));

			}
			stmt.close();

		} catch (SQLException ex) {

		} finally {
			connection.close();
			return alunocurso;
		}
	}

	public void Editar(AlunoCurso alunocurso) throws SQLException {
		Connection connection = new FabricaConexao().getConnection();
		try {
			// criando query para inserir novo registro
			String sql = "UPDATE AlunoCurso SET IdAluno = ?, IdCurso= ?, WHERE Id=?";

			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setInt(1, alunocurso.getIdAluno());// Id do Aluno
			stmt.setInt(2, alunocurso.getIdCurso());// Id do Curso

			System.out.println("Aluno alterado com sucesso.");
		} catch (SQLException ex) {
			System.out.println("Ocorreu um erro ao alterar o aluno." + ex.getMessage());
		} finally {
			connection.close();
		}

	}

	@SuppressWarnings("finally")
	public List<AlunoCurso> Listar() throws SQLException {
		Connection connection = new FabricaConexao().getConnection();
		List<AlunoCurso> lista = new ArrayList<AlunoCurso>();
		try {

			String query = "SELECT ac.id, a.nome as 'NomeAluno', c.nome as 'NomeCurso' FROM AlunoCurso AS ac inner join Aluno AS a ON ac.IdAluno = a.id inner join Curso AS c ON ac.IdCurso = c.Id;";

			PreparedStatement stmt = connection.prepareStatement(query);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				AlunoCurso alunocurso = new AlunoCurso();
				alunocurso.setId(rs.getInt("Id"));
				alunocurso.setNomeAluno(rs.getString("NomeAluno"));
				alunocurso.setNomeCurso(rs.getString("NomeCurso"));
				lista.add(alunocurso);
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
			String sql = "DELETE FROM Aluno WHERE Id = ?";

			PreparedStatement stmt = connection.prepareStatement(sql);

			// passando os valores para as colunas
			System.out.println("Qual Id do Aluno a ser excluido? ");
			stmt.setInt(1, id);// ID Aluno

			// Executar o comando
			stmt.execute();
			stmt.close();

			System.out.println("Aluno removido com sucesso.");
		} catch (SQLException ex) {
			System.out.println("Ocorreu um erro ao registrar o aluno." + ex.getMessage());
		} finally {
			connection.close();
		}

	}
	@SuppressWarnings("finally")
	public List<Aluno> ListaAluno () throws SQLException{
		Connection connection = new FabricaConexao().getConnection();
		List<Aluno> lista = new ArrayList<Aluno>();
		try {

			String query = "SELECT id,nome FROM aluno order by Nome;";

			PreparedStatement stmt = connection.prepareStatement(query);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Aluno aluno = new Aluno();
				aluno.setId(rs.getInt("Id"));
				aluno.setNome(rs.getString("Nome"));
				lista.add(aluno);
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
