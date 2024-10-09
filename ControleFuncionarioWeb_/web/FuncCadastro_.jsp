<%@page import="controlefuncionario.Funcionario"%>
<%

    String nomeFunc = request.getParameter("nomeFunc");
    
    String idDeptostr = request.getParameter("idDepto");
    int idDepto = Integer.parseInt(idDeptostr);
    
    String salHorastr = request.getParameter("salHora");
    float salHora = Float.parseFloat(salHorastr);

    Funcionario func = new Funcionario();
    func.setNomeFunc(nomeFunc);
    func.setIdDepto(idDepto);
    func.setSalHora(salHora);

    if (func.incluirFuncionario()) {
        response.sendRedirect("FuncCadastro.jsp");

    }

%>