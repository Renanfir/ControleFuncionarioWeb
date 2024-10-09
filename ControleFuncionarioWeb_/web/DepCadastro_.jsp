<%@page import="controlefuncionario.Departamento"%>
<%

    String descDepto = request.getParameter("descDepto");

    Departamento dep = new Departamento();
    dep.setDescDepto(descDepto);

    if (dep.incluirDepartamento()) {
        response.sendRedirect("DepCadastro.jsp");

    }

%>





