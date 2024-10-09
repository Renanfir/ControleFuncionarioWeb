<%@page import="java.util.List"%>
<%@page import="controlefuncionario.Funcionario"%>
<%
    
    String email = (String) session.getAttribute("usuario");
    if (email == null) {
        response.sendRedirect("usuarioNaoLogado.html");
    }
    
    Funcionario func = new Funcionario();
    List<Funcionario> funcionarios = func.listarFuncionarios();

    for (Funcionario funci : funcionarios) {
        System.out.println("ID: " + funci.getIdDepto() + " - Nome " + funci.getNomeFunc()+ " - ID depto" + funci.getIdDepto()+ " - Salário/h " + funci.getSalHora());
    }


%>

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
                        <li class="nav-item active"> <a class="nav-link" href="FuncConsultaIndividual.jsp">Consulta específica</a> </li>
                        <li class="nav-item active"> <a class="nav-link" href="FuncConsultaTodos.jsp">Consulta geral</a> </li>
                        
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <div class="container mt-4">
        
        <form action="FuncConsultaIndividual_.jsp">
            <h1 style="margin-bottom: 40px" >Consulta Individual</h1>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Descrição</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Funcionario funci : funcionarios) {%>
                    <tr>
                        <td><%= funci.getIdFunc()%></td>
                        <td><%= funci.getNomeFunc()%></td>
                        <td><%= funci.getIdDepto()%></td>
                        <td><%= funci.getSalHora()%></td>
                    </tr>
                    <% }%>
                </tbody>
            </table>

            <button type="submit" class="btn btn-primary btn-block">Consultar todos os registros</button>
        </form>

    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>
</html>

