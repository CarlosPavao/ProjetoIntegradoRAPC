<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page buffer="8192kb" autoFlush="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
        <title>Boletim</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/Notas.css">
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/erro.css" />
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
            <h1>Boletim</h1>
            
                <form  name="frmNotas" action="${request.contextPath}seletionBoletim" var="form1" id="turmaDisciplina">
                    <label for="Turma">Turma</label>
                    <select class="custom-select mr-sm-11" name="codTurma"
                            id="inputTurma" >

                        <!-- Carregando o select do Banco -->
                        <option value="<c:out value="${turmaR.turmaID}" />" /> <c:out value="${turmaR.serie}" /></option>
                        <c:forEach items="${turmaD}" var="turma">
                            <option value="${turma.turmaID}" />${turma.serie}</option>
                        </c:forEach>
                    </select>
                    <c:if test="${not empty erroTurma}">
                        <span class="msg-erro"><c:out value="${erroTurma}" /></span>
                    </c:if>
                    <br>

                    <!-- Select de Disciplina   -->

                    <label for="Disciplina">Disciplina</label>
                    <select class="custom-select mr-sm-1" name="codDisciplina"
                            id="inputDisciplina">
                        <!-- Carregando o select do Banco -->
                        <option value="">Selecione</option>
                        <c:forEach items="${Disciplinas}" var="d">
                            <option value="${d.disciplinaID}" />${d.nome}</option>
                        </c:forEach>
                    </select>
                    <c:if test="${not empty erroDisciplina}">
                        <span class="msg-erro"><c:out value="${erroDisciplina}" /></span>
                    </c:if>
                    <br/>
                    <button type="submit" value="form1">Pesquisar</button>
                </form>
            
                <form  name="frm1" action="${request.contextPath}seletionBoletim" var="form1" id="tabelaAluno">
                <table border="1" id="tabelaAluno">
                    <thead>
                        <tr>
                            <th style="color: white" scope="col">Matrícula</th>
                            <th style="color: white" scope="col">Nome</th>
                            <th style="color: white" scope="col">Disciplina</th>
                            <th style="color: white" scope="col">1º Bimestre</th>
                            <th style="color: white" scope="col">2º Bimestre</th>
                            <th style="color: white" scope="col">3º Bimestre</th>
                            <th style="color: white" scope="col">4º Bimestre</th>
                            <th style="color: white" scope="col">Média</th>
                            <th style="color: white" scope="col">Situação</th>   
                        </tr>
                    </thead>
                    <tbody>
                        <!<!-- atributo Alunos vem da classe AlunoControlles na linha 65  -->
                        <c:forEach items="${listaTurma}" var="alunos">

                            <tr>

                                <!-- Código do Aluno -->
                                <th style="color: white" scope="row">

                                    <label class="form-control" name="codAluno">
                                        <c:out value="${alunos.cod_aluno}" />
                                    </label>

                                </th>

                                <!-- Nome do Aluno -->

                                <td style="color: white">
                                    <c:out value="${alunos.nome}" />
                                </td>
                                <!-- Disciplina -->

                                <td style="color: white">
                                    <c:out value="${alunos.disciplina}" />
                                </td>
                                
                                <!-- Nota 1 -->
                                
                                <td style="color: white">
                                    <c:out value="${alunos.nota1}" />
                                </td>

                                <!-- Nota 2 -->

                                <td style="color: white">
                                    <c:out value="${alunos.nota2}" />
                                </td>

                                <!-- Nota 3 -->

                                <td style="color: white">
                                    <c:out value="${alunos.nota3}" />
                                </td>

                                <!-- Nota 4 -->

                                <td style="color: white">
                                    <c:out value="${alunos.nota4}" />
                                </td>
                                <!-- Média -->

                                <td style="color: white">
                                    <c:out value="${alunos.media}" />
                                </td>
                                <!-- Situação -->

                                <td style="color: white">
                                    <c:out value="${alunos.status}" />
                                </td>
                        </c:forEach>
                            </tr> 
                    </tbody>
                </table>
            </form>

    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
</body>
</html>