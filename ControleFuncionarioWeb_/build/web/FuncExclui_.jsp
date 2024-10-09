<%@page import="controlefuncionario.Funcionario"%>
<%
    String idFuncstr = request.getParameter("idFunc");
    int idFunc = Integer.parseInt(idFuncstr);
   

    Funcionario func = new Funcionario();
    
  
    func.setIdFunc(idFunc);

    if (func.excluirFuncionario()) {
        response.sendRedirect("FuncExclui.jsp");

    }

%>

