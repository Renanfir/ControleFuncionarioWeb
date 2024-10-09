<%@page import="controlefuncionario.Departamento"%>
<%
    String idDeptostr = request.getParameter("idDepto");
    int idDepto = Integer.parseInt(idDeptostr);

    Departamento dep = new Departamento();
    dep.setIdDepto(idDepto);
    

    if (dep.excluirDepartamento()) {
        response.sendRedirect("DepExclui.jsp");

    }

%>


