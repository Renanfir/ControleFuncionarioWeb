<%-- 
    Document   : autenticarUsuario
    Created on : 9 de set. de 2024, 08:32:22
    Author     : Professor
--%>

<%@page import="controlefuncionario.Usuario"%>
<%
    String vEmail =  request.getParameter("email");
    String vSenha =  request.getParameter("senha");
////    String vBloqueado = request.getParameter("bloqueado");
////    int bloqueado = Integer.parseInt(vBloqueado);
//    
    Usuario usu = new Usuario();
    usu.setEmail(vEmail);
    usu.setSenha(vSenha);
    usu.setBloqueado(0);
    
    usu = usu.autenticarUsuario();
    if (usu != null){
    
        // criar uma sessão para o uusário que está autenticado
        session.setAttribute("usuario", vEmail);
        response.sendRedirect("menu.jsp");
    
    }
 
    else {
        response.sendRedirect("usuarioNaoCadastrado.html");
    }
        
      


%>