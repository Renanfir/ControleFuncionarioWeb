<%@page import="controlefuncionario.Funcionario"%>
<%@page import="java.io.*" %>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*" %>
<%   
    
    String email = (String) session.getAttribute("usuario");
    if (email == null) {
        response.sendRedirect("usuarioNaoLogado.html");
    }
    
    String idFuncstr = request.getParameter("idFunc");
    int idFunc = Integer.parseInt(idFuncstr);
    
    Funcionario func = new Funcionario();
    func.setIdFunc(idFunc);
    
    boolean funcionarioEncontrado = true;
    
    try {
        func.consultaFuncionario();
        if (func.getNomeFunc() == null) {
            funcionarioEncontrado = false; 
        }
    } catch (Exception e) {
        funcionarioEncontrado = false;
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en>
      <head>
      <title>Funcionario</title>
      <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
</head>
<body>
    <header>
        <nav class="navbar navbar-expand navbar-dark bg-primary">
            <div class="container-fluid">
                <a href="#menu-toggle" id="menu-toggle" class="navbar-brand">
                    <span class="navbar-toggler-icon"></span>
                </a>   
                <div class="sidebar-brand"> <a href="#">Start Bootstrap</a> </div>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample02" aria-controls="navbarsExample02" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarsExample02">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active"> <a class="nav-link" href="FuncCadastro.jsp">Cadastrar</a> </li>
                        <li class="nav-item active"> <a class="nav-link" href="FuncAltera.jsp">Alterar</a> </li>
                        <li class="nav-item active"> <a class="nav-link" href="FuncExclui.jsp">Excluir</a> </li>
                        <li class="nav-item active"> <a class="nav-link" href="FuncConsultaIndvidual.jsp">Consulta específica</a> </li>
                        <li class="nav-item active"> <a class="nav-link" href="FuncConsultaTodos.jsp">Consulta geral</a> </li>

                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <div class="container mt-4">

        <form action="FuncConsultaIndividual_.jsp">
            <h1 style="margin-bottom: 40px" >Consulta Individual</h1>

            <div class="form-group">

                <label for="idFunc">ID Funcionario</label>
                <input style="margin-bottom: 10px" type="number" id="idFunc" name="idFunc" class="form-control" placeholder="ID funcionario">

                <% if (funcionarioEncontrado) {%>
                <p>Nome do funcionário: <%= func.getNomeFunc()%></p>
                <p>Id do departamento: <%= func.getIdDepto()%></p>
                <p>Salário hora: <%= func.getSalHora()%></p>
                <% } else { %>
                <p style="color: red;">Funcionário não encontrado!</p>
                <% }%>

            </div>

            <button type="submit" class="btn btn-primary btn-block">Salvar</button>
        </form>

    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>
</html>




