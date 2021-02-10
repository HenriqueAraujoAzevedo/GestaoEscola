package br.com.treinacom.controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.treinacom.model.Curso;

public class CursoDAO {
	
	public void Cadastrar(Curso curso) throws SQLException {
		Connection connection = new FabricaConexao().getConnection();
		try {
			//Criando query para inserir um novo registro
			String sql = "INSERT INTO Curso (Nome, CargaHoraria) VALUES (?, ?);";
			
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			//Passando os valores para as colunas
			stmt.setString(1, curso.getNome()); //Nome do Curso
			stmt.setInt(2, curso.getCargaHoraria()); //Carga horaria do curso
			
			//Executar o comando
			stmt.execute();
			stmt.close();
			
			System.out.println("Curso registrado com sucesso.");
		} catch(SQLException ex) {
			System.out.println("Ocorreu um erro a registrar o curso.");
		} finally {
			connection.close();
		}
	}
	
	public void Editar(Curso curso) throws SQLException {
		Connection connection = new FabricaConexao().getConnection();
		try {
			//Criando query para inserir um novo registro
			String sql = "UPDATE Curso SET Nome = ?, CargaHoraria = ? WHERE Id = ?;";
			
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			//Passando os valores para as colunas
			stmt.setString(1, curso.getNome()); //Nome do Curso
			stmt.setInt(2, curso.getCargaHoraria()); //Carga horaria do curso
			stmt.setInt(3, curso.getId()); //Id do Curso
			
			//Executar o comando
			stmt.execute();
			stmt.close();
			
			System.out.println("Aluno atualizado com sucesso.");
		} catch(SQLException ex) {
			System.out.println("Ocorreu um erro a atualizar o aluno.");
		} finally {
			connection.close();
		}
	}
	
	public void Remover(int id) throws SQLException {
		Connection connection = new FabricaConexao().getConnection();
		try {
			//Criando query para inserir um novo registro
			String sql = "DELETE FROM Curso WHERE Id = ?;";
			
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			//Passando os valores para as colunas
			stmt.setInt(1, id); //Id do Curso
			
			//Executar o comando
			stmt.execute();
			stmt.close();
			
			System.out.println("Aluno removido com sucesso.");
		} catch(SQLException ex) {
			System.out.println("Ocorreu um erro a remover o aluno.");
		} finally {
			connection.close();
		}
	}

	@SuppressWarnings("finally")
	public List<Curso> Listar() throws SQLException {
		Connection connection = new FabricaConexao().getConnection();
		List<Curso> lista = new ArrayList<Curso>();
		try {
			String query = "SELECT Id, Nome, CargaHoraria FROM Curso;";
			
			PreparedStatement stmt = connection.prepareStatement(query);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				Curso curso = new Curso();
				curso.setId(rs.getInt("Id"));
				curso.setNome(rs.getString("Nome"));
				curso.setCargaHoraria(rs.getInt("CargaHoraria"));
				lista.add(curso);
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
	public Curso Consultar(int id) throws SQLException {
		Connection connection = new FabricaConexao().getConnection();
		Curso curso = new Curso();
		try {
			String query = "SELECT Id, Nome, CargaHoraria FROM Curso WHERE Id = ?;";
			
			PreparedStatement stmt = connection.prepareStatement(query);
			
			stmt.setInt(1, id);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				curso.setId(rs.getInt("Id"));
				curso.setNome(rs.getString("Nome"));
				curso.setCargaHoraria(rs.getInt("CargaHoraria"));
			}
			stmt.close();
			
		} catch(SQLException ex) {
			System.out.println("Ocorreu um erro ao consultar os alunos");
		} finally {
			connection.close();
			return curso;
		}
	}

}
