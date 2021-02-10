package br.com.treinacom.controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.treinacom.model.Professor;

public class ProfessorDAO {

	public String Cadastrar(Professor professor) throws SQLException {
		Connection connection = new FabricaConexao().getConnection();
			// criando query para inserir novo registro
			String sql = "insert into Professor (Nome, CPF) Values (?,?)";

			PreparedStatement stmt = connection.prepareStatement(sql);

			// passando os valores para as colunas
			stmt.setString(1, professor.getNome());// Nome Professor
			stmt.setString(2, professor.getCPF());// CPF Professor

			// Executar o comando
			stmt.execute();
			stmt.close();
			connection.close();
			
			return "Aluno registrado com sucesso.";
		}


	@SuppressWarnings("finally")
	public Professor Consultar(int id) throws SQLException {
		Connection connection = new FabricaConexao().getConnection();
		Professor professor = new Professor();
		try {
			String query = "SELECT Id, Nome, CPF, Matricula FROM Professor WHERE Id = ?;";

			PreparedStatement stmt = connection.prepareStatement(query);

			stmt.setInt(1, id);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				professor.setId(rs.getInt("Id"));
				professor.setNome(rs.getString("Nome"));
				professor.setCPF(rs.getString("CPF"));

			}
			stmt.close();

		} catch (SQLException ex) {

		} finally {
			connection.close();
			return professor;
		}
	}

	public void Editar(Professor professor) throws SQLException {
		Connection connection = new FabricaConexao().getConnection();
		try {
			// criando query para inserir novo registro
			String sql = "UPDATE Professor SET Nome = ?, CPF = ?, Matricula = ? WHERE Id=?";

			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setString(1, professor.getNome());// Nome Professor
			stmt.setString(2, professor.getCPF());// CPF Professor
			stmt.setInt(4, professor.getId());// ID ALuno

			System.out.println("Professor alterado com sucesso.");
		} catch (SQLException ex) {
			System.out.println("Ocorreu um erro ao alterar o professor." + ex.getMessage());
		} finally {
			connection.close();
		}

	}

	@SuppressWarnings("finally")
	public List<Professor> Listar() throws SQLException {
		Connection connection = new FabricaConexao().getConnection();
		List<Professor> lista = new ArrayList<Professor>();
		try {

			String query = "SELECT Id, Nome, CPF, Matricula FROM Professor;";

			PreparedStatement stmt = connection.prepareStatement(query);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Professor professor = new Professor();
				professor.setId(rs.getInt("Id"));
				professor.setNome(rs.getString("Nome"));
				professor.setCPF(rs.getString("CPF"));
				lista.add(professor);
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
			String sql = "DELETE FROM Professor WHERE Id = ?";

			PreparedStatement stmt = connection.prepareStatement(sql);

			// passando os valores para as colunas
			System.out.println("Qual Id do Professor a ser excluido? ");
			stmt.setInt(1, id);// ID Professor

			// Executar o comando
			stmt.execute();
			stmt.close();

			System.out.println("Professor registrado com sucesso.");
		} catch (SQLException ex) {
			System.out.println("Ocorreu um erro ao registrar o professor." + ex.getMessage());
		} finally {
			connection.close();
		}

	}

}
