<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page buffer="8192kb" autoFlush="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/Associar.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script type="text/javascript" src="http://www.godtur.no/godtur/js/jquery-ui-1.8.18.custom.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.js"></script>
    <script type="text/javascript" src="http://www.godtur.no/godtur/js/jquery-ui-1.8.18.custom.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/erro.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Associar aluno a turma</title>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark  navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="${pageContext.request.contextPath}"><img src="Imagens/logo.png" alt="some text" width=120 height=60>CyberSchool</a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Listagem
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="alunoController?action=ListAlunos">Alunos Matriculados</a>
                        <a class="dropdown-item" href="professorController?action=ListProfessor">Professores</a>
                        <a class="dropdown-item" href="#">Turmas</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Cadastro
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/cadastroAluno">Cadastrar Aluno</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/cadastroProfessor">Cadastrar Professor</a>
                        <a class="dropdown-item" href="#">Cadastrar Turma</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Algo mais aqui</a>
                    </div>
                </li>
            </div>
        </nav>
    <section>
            <div class="row">
                <div class="col">
                    <h1 id="title">Associar aluno a turma</h1>
                </div>
            </div>
            <div class="row">
                <div class="col" id="space">
                    <form name="frmTurmas" action="${request.contextPath}selection">
                    <label for="serie" id="textcolor" >Série:</label>
                    <select class="custom-select mr-sm-2" name="codTurma"
                        id="inputTurma">
                        <!-- Carregando o select do Banco -->
                        <option value="<c:out value="${turmaR.turmaID}" />" /><c:out value="${turmaR.serie}" /></option>
                        <c:forEach items="${turmaD}" var="turma">
                        <option value="${turma.turmaID}" />${turma.serie}</option>
                        </c:forEach>
                    </select>
                    <button type="submit" value="form1">Pesquisar</button>
                    </form>
                </div>
                <div class="row">
                    <div class="col" id="space">
                        <form  name="frmNotas" action="${request.contextPath}selection" var="form1">
                        <label for="nome_aluno" id="textcolor">Aluno:</label>
                        <select class="custom-select mr-sm-2" name="aluno"
                        id="inputTurma">
                        <!-- Carregando o select do Banco -->
                        <option value="" />Selecione</option>
                        <c:forEach items="${aluno}" var="alunos">
                        <option value="${alunos.codAluno}" />${alunos.nome}</option>
                        </c:forEach>
                    </select>
                        </form>
                    </div>
            </div>
            <div class="row">
                <div class="col" id="space">
                    <table class="table table-striped table-hover" id="table-title">
                        <form method="POST" name="frmNotas" action="${request.contextPath}selection" var="form1">
                        
                            
                        <th id="textcolor">Turma</th>
                        <th id="textcolor">Quantidade livre</th>
                        <th id="textcolor">Opções</th>
                        <tr>
                            <td id="textcolor"><c:out value="${turmaR.serie}" /></td>
                            <td id="textcolor"><c:out value="${turmaR.qte}" /></td>
                            <td id="textcolor"> <button type="button" class="btn btn-primary">Associar</button></td>
                        </tr> 
                    </table>    
                </div>
            </div>
        </div>
    </section>  
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
</body>
</html>