<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        
        <nav class="navbar navbar-dark bg-dark  navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#"><img src="Imagens/logo.png" alt="some text" width=120 height=60>CyberSchool</a>
            
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
              <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
              <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Relatorios
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="listarAluno.jsp">Aluno Matriculados</a>
                    <a class="dropdown-item" href="#">Professores</a>
                    <a class="dropdown-item" href="#">Turmas</a>
                  </div>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Cadastro
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="adicionarEditarAluno.jsp">Cadastrar Aluno</a>
                    <a class="dropdown-item" href="#">Cadastrar Professor</a>
                    <a class="dropdown-item" href="#">Cadastrar Turma</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Algo mais aqui</a>
                  </div>
                </li>
                <li class="nav-item">
                  <a class="nav-link disabled" href="#">Desativado</a>
                </li>
              </ul>
              <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Pesquisar" aria-label="Pesquisar">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Pesquisar</button>
              </form>
            </div>
          </nav>

        <h1>Alunos Matriculados</h1>
        <table class="table table-striped">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Matricula</th>
                    <th scope="col">Nome</th>
                    <th scope="col">Data de nascimento</th>
                    <th scope="col">sexo</th>
                    <th scope="col">Pai</th>
                    <th scope="col">Mãe</th>
                    <th scope="col">Celular</th>
                    <th scope="col">Cel. do pai</th>
                    <th scope="col">Cel. da Mãe</th>
                    <th scope="col">E-mail</th>
                    <th scope="col">Rua</th>
                    <th scope="col">Nº</th>
                    <th scope="col">Bairro</th>
                    <th scope="col">CEP</th>
                    <th colspan="2" scope="col">Ação</th>
                </tr>
            </thead>
            <tbody>
                <!<!-- atributo Alunos vem da classe AlunoControlles na linha 65  -->
                <c:forEach items="${alunos}" var="aluno">
                    <tr>
                        <th scope="row"><c:out value="${aluno.codAluno}" /></th>
                        <td><c:out value="${aluno.nome}" /></td>
                        <td><fmt:formatDate pattern="dd/MM/yyyy" value="${aluno.dataNasc}" /></td>
                        <td><c:out value="${aluno.sexo}" /></td>
                        <td><c:out value="${aluno.nomePai}" /></td>
                        <td><c:out value="${aluno.nomeMae}" /></td>
                        <td><c:out value="${aluno.celular}" /></td>
                        <td><c:out value="${aluno.celularPai}" /></td>
                        <td><c:out value="${aluno.celularMae}" /></td>
                        <td><c:out value="${aluno.email}" /></td>
                        <td><c:out value="${aluno.rua}" /></td>
                        <td><c:out value="${aluno.numero}" /></td>
                        <td><c:out value="${aluno.bairro}" /></td>
                        <td><c:out value="${aluno.cep}" /></td>
                        <td><a type="button" class="btn btn-primary" href="AlunoController?action=edit&codAluno=<c:out value="${aluno.codAluno}" />">Editar</a>
                        <td><a type="button" class="btn btn-danger" href="AlunoController?action=delete&codAluno=<c:out value="${aluno.codAluno}" />">deletar</a> 
                        </div
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <p><a type="button" class="btn btn-success" href="AlunoController?action=insert">Adicionar Aluno</a> 
    </body>
</html>
