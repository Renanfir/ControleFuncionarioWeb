<%@page import="controlefuncionario.Departamento"%>
<%
    
    String email = (String) session.getAttribute("usuario");
    if (email == null) {
        response.sendRedirect("usuarioNaoLogado.html");
    }
    
    
    String idDeptostr = request.getParameter("idDepto");
    int idDepto = Integer.parseInt(idDeptostr);

    Departamento dep = new Departamento();
    dep.setIdDepto(idDepto);
    
    boolean departamentoEncontrado = true;
    
    try {
        dep.consultaDepto();
        if (dep.getDescDepto()== null) {
            departamentoEncontrado = false; 
        }
    } catch (Exception e) {
        departamentoEncontrado = false;
    }



    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en>
      <head>
      <title>Departamento</title>
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
                        <!--TODO-->
                        <!--TODO-->
                        <!--TODO-->
                        <!--TODO-->
                        <li class="nav-item active"> <a class="nav-link" href="DepCadastro.jsp">Cadastrar</a> </li>
                        <li class="nav-item active"> <a class="nav-link" href="DepAltera.jsp">Alterar</a> </li>
                        <li class="nav-item active"> <a class="nav-link" href="DepExclui.jsp">Excluir</a> </li>
                        <li class="nav-item active"> <a class="nav-link" href="DepConsultaIndvidual.jsp">Consulta específica</a> </li>
                        <li class="nav-item active"> <a class="nav-link" href="DepConsultaTodos.jsp">Consulta geral</a> </li>

                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <div class="container mt-4">

        <form action="DepConsultaIndvidual_.jsp">
            <h1 style="margin-bottom: 40px" >Consulta Individual</h1>

            <div class="form-group">
                <label for="idDepto">ID do departamento</label>
                <input type="number" id="idDepto" name="idDepto" class="form-control" placeholder="depto que deseja alterar">
            </div>
               
            <% if (departamentoEncontrado) {%>
            <p style="margin-bottom: 10px" ><% out.print(dep.getDescDepto()); %></p>
            <% }else{%>
            <p style="color: red;">Departamento não encontrado!</p>
            <button type="submit" class="btn btn-primary btn-block">Salvar</button>
            <% }%>
        </form>

    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

</body>
</html>