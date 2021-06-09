<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page buffer="8192kb" autoFlush="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
        <title>Registrar Nota</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/Notas.css">
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
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
                    Cadastro
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/cadastroAluno">Aluno</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/cadastroProfessor">Professor</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/cadastroAdm">Adiministrativo</a>

                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Listagem
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="alunoController?action=ListAlunos">Alunos Matriculados</a>
                    <a class="dropdown-item" href="admController?action=ListProfessor">Professores</a>
                    <a class="dropdown-item" href="admController?action=ListAdm">Adiministrativo</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Registro
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/notasController">Notas</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/cadastroProfessor">Presença</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Relátorios
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="alunoController?action=ListAlunos">Notas</a>
                    <a class="dropdown-item" href="admController?action=ListProfessor">Presença</a>
                    <a class="dropdown-item" href="admController?action=ListAdm">Boletim</a>
                </div>
            </li>


        </div>
    </nav>

    <div class="container">
            
            <h1>Registrar Notas</h1>
            
            <form  name="frmNotas" action="${request.contextPath}selectionDisc" var="form1" id="turmaDisciplina">
                <label for="Turma">Turma : </label>
                    <select class="custom-select mr-sm-11" name="codTurma"
                        id="inputTurma">

                        <!-- Carregando o select do Banco -->
                        <option value="" />Selecione</option>
                        <c:forEach items="${turmas}" var="turma">
                        <option value="${turma.turmaID}" />${turma.serie}</option>
                        </c:forEach>
                    </select>
                    <br>
                    
                    <!-- Select de Disciplina   -->

                    <label for="Disciplina">Disciplina : </label>
                    <select class="custom-select mr-sm-11" name="codDisciplina"
                        id="inputDisciplina">
                        <!-- Carregando o select do Banco -->
                        <option value="" />Selecione</option>
                        <c:forEach items="${Disciplinas}" var="d">
                        <option value="${d.disciplinaID}" />${d.nome}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <button type="submit" value="form1">Pesquisar</button>
            </form>
            
            <form method="POST"  name="frmNotas" action="${request.contextPath}notasController" var="form1" id="tabelaAluno">
                <table border="1">
                    <thead class="titleteste">
                        <tr>
                            <th scope="col">Matrícula</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Nota 1</th>
                            <th scope="col">Nota 2</th>
                            <th scope="col">Nota 3</th>
                            <th scope="col">Nota 4</th>
                        </tr>
                    </thead>
                    <tbody>
                            <!-- atributo Alunos vem da classe AlunoControlles na linha 65  -->
                            <c:forEach items="${alunos}" var="idx">

                                <tr>

                                    <!-- Código do Aluno -->
                                    <th scope="row">

                                        <label class="form-control" name="codAluno[${idx}]">
                                            <c:out value="${alunos.cod_aluno}" />
                                        </label>
                                        <input type="hidden" name="alunoCod" value="<c:out value="${lista.cod_aluno}" />">

                                    </th>



                                    <!-- Nome do Aluno -->

                                    <td>

                                        <c:out value="${alunos.nome}" />

                                    </td>
                            
                                    <!-- Nota 1 -->

                                    <td>
                                        <input class="form-control"  id="nota1" type="text" name="nota1[${idx}]"
                                               onkeypress="$(this).mask('00.0')"placeholder="00.0">
                                    </td>

                                    <!-- Nota 2 -->

                                    <td>
                                        <input class="form-control"  id="nota2" type="text" name="nota2[${idx}]"
                                               onkeypress="$(this).mask('00.0')"placeholder="00.0">
                                    </td>

                                    <!-- Nota 3 -->

                                    <td>
                                        <input class="form-control"  id="nota3" type="text" name="nota3[${idx}]"
                                               onkeypress="$(this).mask('00.0')"placeholder="00.0">
                                    </td>

                                    <!-- Nota 4 -->

                                    <td>
                                        <input class="form-control"  id="nota4" type="text" name="nota4[${idx}]"
                                               onkeypress="$(this).mask('00.0')"placeholder="00.0">
                                    </td>
                                </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <button type="submit" value="principal">Enviar</button>
            </form>
        </div>
        <br>
        <footer id="myFooter">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <img src="Imagens/logo.png" alt="some text">
                    </div>
                    <div class="col">
                        <h2>Desenvolvido por RAPC</h2>
                    </div>
                    <div class="col">
                        <div class="social-networks">
                            <a href="https://github.com/CarlosPavao/ProjetoIntegradoRAPC" class="instagram"><i class="fa fa-github"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
        <script src="http://code.jquery.com/jquery-1.7.1.js"></script>
        <script src="http://www.godtur.no/godtur/js/jquery-ui-1.8.18.custom.min.js"></script>
        <script type="text/javascript">
            $("#nota1, #nota2,#nota3,#nota4").mask("00.0");
        </script>
    </body>
</html>
