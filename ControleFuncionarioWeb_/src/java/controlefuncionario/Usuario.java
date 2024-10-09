package controlefuncionario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;

public class Usuario {

    private String email;
    private String senha;
    private int bloqueado;

    // Inclusão de Usuario
    public boolean incluirUsuario() throws ClassNotFoundException {
        String sql = "INSERT INTO usuario (email,senha) ";
        sql += "VALUES (?,?);";
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.getEmail());
            stm.setString(2, this.getSenha());
            stm.execute();
        } catch (SQLException e) {
            System.out.println("Erro na inclusão do usuário");
            return false;
        }
        return true;
    }

    // autenticacao do usuario
    /* public Usuario autenticarUsuario() throws ClassNotFoundException {
        Connection con = Conexao.conectar();
        Usuario usu = null;
        String sql = "SELECT email FROM usuario WHERE email = ? AND senha = ?     ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.getEmail());
            stm.setString(2, this.getSenha());
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                usu = new Usuario();
                usu.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            System.out.println("Erro na consulta do usuario");
            return null;
        }
        return usu;

    }*/
    // Autenticação do usuário com bloqueio imediato após uma tentativa incorreta
    public Usuario autenticarUsuario() throws ClassNotFoundException {
        Connection con = Conexao.conectar();
        Usuario usu = null;
        String sql = "SELECT email, bloqueado FROM usuario WHERE email = ?";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.getEmail());
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                boolean isBloqueado = rs.getBoolean("bloqueado");

                if (isBloqueado) {
                    System.out.println("Usuário bloqueado.");
                    return null;
                }

                String sqlSenha = "SELECT email FROM usuario WHERE email = ? AND senha = ?";
                PreparedStatement stmSenha = con.prepareStatement(sqlSenha);
                stmSenha.setString(1, this.getEmail());
                stmSenha.setString(2, this.getSenha());
                ResultSet rsSenha = stmSenha.executeQuery();

                if (rsSenha.next()) {
                    usu = new Usuario();
                    usu.setEmail(rsSenha.getString("email"));
                } else {
                    bloquearUsuario(); // Bloqueia o usuário imediatamente
                    System.out.println("Senha incorreta. Usuário bloqueado.");
                }
            } else {
                System.out.println("Usuário não encontrado.");
            }
        } catch (SQLException e) {
            System.out.println("Erro na autenticação do usuário: " + e.getMessage());
        }
        return usu;
    }

    // redefinição de senha
    public boolean alterarUsuario() throws ClassNotFoundException {
        String sql = "UPDATE usuario SET senha = ?, bloqueado = 0 WHERE email = ? ";
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.getSenha());
            stm.setString(2, this.getEmail());
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Erro na inclusão do Usuário");
            return false;
        }
        return true;
    }

    // Método para bloquear o usuário
    public void bloquearUsuario() throws ClassNotFoundException {
        Connection con = Conexao.conectar();
        String sql = "UPDATE usuario SET bloqueado = 1 WHERE email = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.getEmail());
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Erro ao bloquear o usuário: " + e.getMessage());
        }
    }

    public List<Usuario> listarUsuarios() throws ClassNotFoundException {
        List<Usuario> listarUsuarios = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "SELECT email FROM usuario WHERE bloqueado = 1 order by email;";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Usuario usu = new Usuario();
                usu.setEmail(rs.getString("Email"));
                usu.setBloqueado(rs.getInt("Bloqueado"));
                listarUsuarios.add(usu);
            }
        } catch (SQLException e) {
            System.out.println("Erro na lista de usuarios");
            return null;
        }
        return listarUsuarios;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public int getBloqueado() {
        return bloqueado;
    }

    public void setBloqueado(int bloqueado) {
        this.bloqueado = bloqueado;
    }

    @Override
    public String toString() {
        return "Usuario"
                + "email='" + email + '\''
                + ", bloqueado=" + bloqueado;
    }

}
