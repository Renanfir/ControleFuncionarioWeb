<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Screen</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="estilos/estiloLogin.css">
</head>
<body>
  <div class="container-fluid">
    <div class="row justify-content-center">
      <div class="col-md-4">
        <div class="card card-login">
          <div class="card-body">
            <h2 class="card-title text-center">Redefinir Senha</h2>
            
            <form action="redefinirUsuario.jsp">
              <div class="form-group">
                <label for="username">Usuário:</label>
                <input type="text" id="email" name="email" class="form-control" placeholder="Digite seu usuário">
              </div>
                <div class="form-group">
                <label for="password">Nova Senha:</label>
                <input type="password" id="senha" name="senha" class="form-control" placeholder="Digite sua nova senha">
                </div>
             
              <button type="submit" class="btn btn-primary btn-block">Redefinir</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>