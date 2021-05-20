<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <link type="text/css"
              href="css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="http://www.godtur.no/godtur/js/jquery-ui-1.8.18.custom.min.js"></script>
        <title>Cadastro Professor</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script>
            $(function () {
                $('input[name=data_de_nascimento]').datepicker();
            });
        </script>
        <nav class="navbar navbar-dark bg-dark  navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#"><img src="Imagens/logo.png" alt="some text" width=120 height=60>CyberSchool</a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Listagem
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="alunoController?action=ListAluno">Aluno Matriculados</a>
                        <a class="dropdown-item" href="ProfessorController?action=ListProfessor">Professores</a>
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

        <div class="container">
            <h4>Informações do Professor</h4>
            <form method="POST" action='${request.contextPath}ProfessorController' name="frmAddUser">
                <!-- Matricula -->
                <div class="form-row">
                    <div class="form-group col-md-1">
                        <label>Codigo do Professor</label>
                        <input type="text" readonly="readonly" name="codProfessor"
                               value="<c:out value="${professor.codProfessor}" />" >
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-3">   
                        <!-- Nome -->
                        <label for="inputNome">Nome</label>
                        <input class="form-control"  id="inputNome" type="text" name="nome"
                               value="<c:out value="${professor.nome}" />" >  
                    </div>
                    <div class="form-group col-md-2">    
                        <!-- Data -->
                        <label for="inputData">Data de Nascimento</label> 
                        <input class="form-control"  id="inputData" type="text" 
                               placeholder="DD/MM/YYYY" name="dataNascimento" 
                               data-date-format="dd/MM/yyyy"value="<fmt:formatDate 
                                   pattern="dd/MM/yyyy" value="${professor.dataNasc}" />" >
                    </div>
                    <div class="form-group col-md-1">
                        <!-- Gênero -->
                        <label for="inputGenero">Gênero</label> 
                        <input class="form-control"  id="inputGenero" 
                               type="text" name="sexo" placeholder="M/F"
                               value="<c:out value="${professor.sexo}" />" >
                    </div>
                    <div class="form-group col-md-3">   
                        <!-- Nome -->
                        <label for="inputCpf">CPF</label>
                        <input class="form-control"  id="inputCpf" type="text" name="cpf"
                               value="<c:out value="${professor.cpf}" />" 
                               placeholder="999.999.999-99">  
                    </div>
                    <div class="form-group col-md-3">   
                        <!-- Nome -->
                        <label for="inputCpf">Rg</label>
                        <input class="form-control"  id="inputCpf" type="text" name="rg"
                               value="<c:out value="${professor.rg}" />" 
                               placeholder="99.999.999-9">  
                    </div>
                </div>
                <div class="form-row">

                </div>
                <h4>Meios de contato</h4>
                <div class="form-row">

                    <div class="form-group col-md-2">
                        <label for="inputCelular">Celular</label>
                        <input class="form-control" id="inputCelular"type="text" 
                               name="celular" value="<c:out value="${professor.celular}" />" 
                               placeholder="(11)99999-9999">
                    </div>
                    <div class="form-group col-md-2">
                        <label for="inputTelefone">Telefone</label>
                        <input class="form-control" id="inputTelefone"type="text" 
                               name="telefone" value="<c:out value="${professor.telefone}" />" 
                               placeholder="(11)99999-9999">
                    </div>
                    <div class="form-group col-md-3">
                        <!-- E-mail -->
                        <label for="inputEmail4">E-mail</label>
                        <input type="email" class="form-control" id="inputEmail4"
                               name="email" value="<c:out value="${professor.email}" />" >
                    </div>

                </div>

                <h4>Endereço</h4>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="inputLogradouro">Logradouro</label>
                        <input class="form-control" id="inputLogradouro" type="text" 
                               name="rua" value="<c:out value="${aluno.rua}" />">
                    </div>
                    <div class="form-group col-md-1">
                        <label for="inputNumero">Nº</label>
                        <input class="form-control" id="inputNumero" type="text" 
                               name="numero" value="<c:out value="${aluno.numero}" />">
                    </div>
                    <div class="form-group col-md-2">
                        <label for="inputBairro">Bairro</label>
                        <input class="form-control" id="inputBairro" type="text" 
                               name="bairro" value="<c:out value="${aluno.bairro}" />">
                    </div>
                    <div class="form-group col-md-2">
                        <label for="inputCEP">CEP</label>
                        <input class="form-control" id="inputCEP" type="text" name="cep"
                               value="<c:out value="${aluno.cep}" />" >
                    </div>
                </div>
                <div class="container">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <input class="btn btn-primary btn-lg active" role="button" aria-pressed="true" type="submit" value="Enviar" />     
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
