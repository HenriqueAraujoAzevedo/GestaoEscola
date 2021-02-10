package br.com.treinacom.controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.treinacom.model.Aluno;
import br.com.treinacom.model.Situacao;

public class AlunoDAO {
	
	public String Cadastrar(Aluno aluno) throws SQLException {
		Connection connection = new FabricaConexao().getConnection();
		//Criando query para inserir um novo registro
		//String sql = "INSERT INTO Aluno (Nome, CPF, Matricula, Endereco, Telefone) VALUES (?, ?, ?, ?, ?);";
		String sql = "INSERT INTO Aluno (Nome, CPF, Matricula, Endereco, Telefone, SituacaoId) VALUES (?, ?, ?, ?, ?, ?)";
		
		PreparedStatement stmt = connection.prepareStatement(sql);
		
		//Passando os valores para as colunas
		stmt.setString(1, aluno.getNome()); //Nome do Aluno
		stmt.setString(2, aluno.getCPF()); //CPF do Aluno
		stmt.setString(3, aluno.getMatricula()); //Matrícula do Aluno
		stmt.setString(4, aluno.getEndereco()); //Endereco do Aluno
		stmt.setString(5, aluno.getTelefone()); //Telefone do Aluno
		stmt.setInt(6, aluno.getSituacao()); //Situação do Aluno
		
		//Executar o comando
		stmt.execute();
		stmt.close();
		
		connection.close();
		
		return "Aluno registrado com sucesso.";
	}
	
	public String Editar(Aluno aluno) throws SQLException {
		Connection connection = new FabricaConexao().getConnection();
		// criando query para inserir novo registro
		//String sql = "UPDATE Aluno SET Nome = ?, CPF = ?, Matricula = ?, Endereco = ?, Telefone = ? WHERE Id = ?;";
		String sql = "UPDATE Aluno SET Nome = ?, CPF = ?, Matricula = ?, Endereco = ?, Telefone = ?, SituacaoId = ? WHERE Id = ?";
		
		PreparedStatement stmt = connection.prepareStatement(sql);

		stmt.setString(1, aluno.getNome()); //Nome do Aluno
		stmt.setString(2, aluno.getCPF()); //CPF do Aluno
		stmt.setString(3, aluno.getMatricula()); //Matrícula do Aluno
		stmt.setString(4, aluno.getEndereco()); //Endereco do Aluno
		stmt.setString(5, aluno.getTelefone()); //Telefone do Aluno
		stmt.setInt(6, aluno.getSituacao()); //Situação do Aluno
		stmt.setInt(7, aluno.getId()); //Id do Aluno
		
		stmt.execute();
		stmt.close();
		
		return "Aluno atualizado com sucesso.";
	}

	public String Remover(int id) throws SQLException {
		//AlunoDAO alunoDAO = new AlunoDAO();
		//String msg = alunoDAO.Consultar(id).getNome();
		Connection connection = new FabricaConexao().getConnection();
		try {
			// criando query para inserir novo registro
			String sql = "DELETE FROM Aluno WHERE Id = ?";

			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setInt(1, id);

			// Executar o comando
			stmt.execute();
			stmt.close();

			//return ("Aluno" + msg + "removido com sucesso!");
			return "Aluno removido com sucesso.";
		} catch (SQLException ex) {
			return "Ocorreu um erro ao remover o aluno." + ex.getMessage();
		} finally {
			connection.close();
		}

	}
	
	@SuppressWarnings("finally")
	public List<Aluno> Listar() throws SQLException {
		Connection connection = new FabricaConexao().getConnection();
		List<Aluno> lista = new ArrayList<Aluno>();
		try {

			String query = "SELECT * FROM Aluno;";
			//String query = "SELECT Id, Nome, CPF, Matricula, Endereco, Telefone FROM Aluno;";
		
			PreparedStatement stmt = connection.prepareStatement(query);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				Aluno aluno = new Aluno();
				aluno.setId(rs.getInt("Id"));
				aluno.setNome(rs.getString("Nome"));
				aluno.setCPF(rs.getString("CPF"));
				aluno.setMatricula(rs.getString("Matricula"));
				aluno.setEndereco(rs.getString("Endereco"));
				aluno.setTelefone(rs.getString("Telefone"));
				aluno.setSituacao(rs.getInt("SituacaoId"));
				lista.add(aluno);
			}
			stmt.close();
			
		} catch(SQLException ex) {
			System.out.println("Ocorreu um erro ao consultar os alunos");
		} finally {
			connection.close();
			return lista;
		}
	}

	@SuppressWarnings("finally")
	public Aluno Consultar(int id) throws SQLException {
		Connection connection = new FabricaConexao().getConnection();
		Aluno aluno = new Aluno();
		try {
			String query = "SELECT * FROM Aluno WHERE Id = ?;";
			//String query = "SELECT Id, Nome, CPF, Matricula, Endereco, Telefone FROM Aluno WHERE Id = ?;";

			PreparedStatement stmt = connection.prepareStatement(query);

			stmt.setInt(1, id);

			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				aluno.setId(rs.getInt("Id"));
				aluno.setNome(rs.getString("Nome"));
				aluno.setCPF(rs.getString("CPF"));
				aluno.setMatricula(rs.getString("Matricula"));
				aluno.setEndereco(rs.getString("Endereco"));
				aluno.setTelefone(rs.getString("Telefone"));
				aluno.setSituacao(rs.getInt("SituacaoId"));
			}
			stmt.close();
			
		} catch(SQLException ex) {
			System.out.println("Ocorreu um erro ao consultar os alunos");
		} finally {
			connection.close();
			return aluno;
		}
	}

	@SuppressWarnings("finally")
	public List<Aluno> Filtrar(String nome, String cpf, String matricula) throws SQLException {
		Connection connection = new FabricaConexao().getConnection();
		List<Aluno> lista = new ArrayList<Aluno>();
		try {

			String query = "SELECT * FROM Aluno WHERE nome LIKE ? AND cpf LIKE ? AND matricula LIKE ?";
			//String query = "SELECT id, nome, cpf, matricula, Endereco, Telefone FROM Aluno WHERE nome = ? or cpf = ? or matricula = ?;";
			
			PreparedStatement stmt = connection.prepareStatement(query);
			
			//stmt.setString(1, nome);
			//stmt.setString(2, cpf);
			//stmt.setString(3, matricula);
			
			stmt.setString(1, "%" + nome + "%");
			stmt.setString(2, "%" + cpf + "%");
			stmt.setString(3, "%" + matricula + "%");

			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				Aluno aluno = new Aluno();
				aluno.setId(rs.getInt("Id"));
				aluno.setNome(rs.getString("Nome"));
				aluno.setCPF(rs.getString("CPF"));
				aluno.setMatricula(rs.getString("Matricula"));
				aluno.setEndereco(rs.getString("Endereco"));
				aluno.setTelefone(rs.getString("Telefone"));
				aluno.setSituacao(rs.getInt("SituacaoId"));
				lista.add(aluno);
			}
			stmt.close();
			
		} catch(SQLException ex) {
			System.out.println("Ocorreu um erro ao consultar os alunos");
		} finally {
			connection.close();
			return lista;
		}
	}
	
	@SuppressWarnings("finally")
	public List<Situacao> ListaSituacao() throws SQLException{
		Connection connection = new FabricaConexao().getConnection();
		List<Situacao> lista = new ArrayList<Situacao>();
		try {

			//String query = "SELECT * FROM situacao;";
			String query ="select S.Nome FROM situacao as S Inner Join aluno as A ON S.Id = a.SituacaoId;";

			PreparedStatement stmt = connection.prepareStatement(query);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Situacao situacao = new Situacao();
				situacao.setId(rs.getInt("Id"));
				situacao.setNome(rs.getString("Nome"));
				lista.add(situacao);
			}
			stmt.close();

		} catch (SQLException ex) {

		} finally {
			connection.close();
			return lista;
		}
		
	}
}
