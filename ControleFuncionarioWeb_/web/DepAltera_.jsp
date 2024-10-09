<%@page import="controlefuncionario.Departamento"%>
<%

    String descDepto = request.getParameter("descDepto");
    String idDeptostr = request.getParameter("idDepto");
    int idDepto = Integer.parseInt(idDeptostr);

    Departamento dep = new Departamento();
    dep.setDescDepto(descDepto);
    dep.setIdDepto(idDepto);
    

    if (dep.alterarDepartamento()) {
        response.sendRedirect("DepAltera.jsp");

    }

%>

