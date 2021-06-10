<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de professores</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
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
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/alunoController?action=ListAluno">Alunos Matriculados</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/professorController?action=ListProfessor">Professores</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/admController?action=ListAdm">Adiministrativo</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Registro
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/notasController">Notas</a>
                    <a class="dropdown-item" href="#">Presença</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/associarAluno">Associar Aluno a turma</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Relátorios
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Presença</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/boletim">Boletim</a>
                </div>
            </li>
        </div>
    </nav>

        <h1>Professores</h1>
        <table class="table table-striped">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Código do Professor</th>
                    <th scope="col">Nome</th>
                    <th scope="col">CPF</th>
                    <th scope="col">Celular</th>
                    <th scope="col">E-mail</th>
                    <th scope="col">Rua</th>
                    <th scope="col">Nº</th>
                    <th scope="col">Bairro</th>
                    <th colspan="2" scope="col">Ação</th>
                </tr>
            </thead>
            <tbody>
                <!<!-- atributo Alunos vem da classe AlunoControlles na linha 65  -->
                <c:forEach items="${professores}" var="professor">
                    <tr>
                        <th scope="row">
                            <c:out value="${professor.codProfessor}" />
                        </th>
                        <td>
                            <c:out value="${professor.nome}" />
                        </td>
                        <td>
                            <c:out value="${professor.cpf}" />
                        </td>
                        <td>
                            <c:out value="${professor.celular}" />
                        </td>
                        <td>
                            <c:out value="${professor.email}" />
                        </td>
                        <td>
                            <c:out value="${professor.rua}" />
                        </td>
                        <td>
                            <c:out value="${professor.numero}" />
                        </td>
                        <td>
                            <c:out value="${professor.bairro}" />
                        </td>
                        <td>
                            <a type="button" class="btn btn-primary" href="professorController?action=edit&codProfessor=<c:out value="${professor.codProfessor}"/>&disciplina1=professor.fkdisciplinaID=<c:out value="${professor.fk_disciplinaID}"/>&disciplina2=professor.fkdisciplina2ID=<c:out value="${professor.fk_disciplinaID}"/>">
                                Editar
                            </a>
                        <td>
                            <a type="button" class="btn btn-danger" href="professorController?action=delete&codProfessor=<c:out value="${professor.codProfessor}" />">deletar</a> 
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <input type="hidden" class="form-control" readonly="readonly" name="disciplina1" value="<c:out value="${professor.fk_disciplinaID}" />">

    </body>
</html>
