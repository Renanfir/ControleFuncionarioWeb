<%-- 
    Document   : cadastraUsuario
    Created on : 9 de set. de 2024, 08:04:05
    Author     : Marcio Schoenfelder
--%>

<%@page import="controlefuncionario.Usuario"%>
<%
    String Email =  request.getParameter("email");
    String Senha =  request.getParameter("senha");
    
    Usuario usu = new Usuario();
    usu.setEmail(Email);
    usu.setSenha(Senha);
    
    if (usu.alterarUsuario()){
        
        response.sendRedirect("index.html");
    }


%>
