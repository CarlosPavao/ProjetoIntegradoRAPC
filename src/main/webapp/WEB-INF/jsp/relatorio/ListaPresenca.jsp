<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="Presenca.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Relatorio de Presença</title>
</head>
<body>
    <section>
        <div class="container">
            <div class="row">
                <div class="col">
                    <nav class="navbar  navbar-expand-lg ">
                        <a class="navbar-brand" href="${pageContext.request.contextPath}"><img src="logo.png" alt="some text" width=120 height=60>CyberSchool</a>
            
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
                                    <a class="dropdown-item" href="admController?action=ListProfessor">Lista de Professores</a>
                                    <a class="dropdown-item" href="admController?action=ListAdm">Lista de Adm</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Cadastro
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/cadastroAluno">Cadastrar Aluno</a>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/cadastroProfessor">Cadastrar Professor</a>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/cadastroAdm">Cadastrar Adm</a>
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
                </div>
             <!-- <div class="col-3 ">
                    <img src="logo.png" class="rounded float-start" id="logo" alt="logo"> 
                </div> 
                <div class="col">
                    <img src="user.png" class="rounded float-end" id="user" alt="user image">
                </div> -->
            </div>
            <div class="row">
                <div class="col">
                    <h1 id="title">Relatório de Presença</h1>
                </div>
            </div>
            <div class="row">
                <div class="col" id="space">
                    <form action="">
                    <label for="turma" id="textcolor" >Turma</label>
                    <input type="text" name="turma" id="turma" className="nome" placeholder="Digite a Turma">
                    <label for="nome_aluno" id="textcolor">Nome do aluno</label>
                    <input type="text" name="nome" id="aluno" className="nome" placeholder="Digite o nome do aluno" autocomplete="off">
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col" id="space">
                    <table class="table table-striped table-hover" id="table-title">
                        <th id="textcolor">ID do aluno</th>
                        <th id="textcolor">Nome do aluno</th>
                        <th id="textcolor">Total de faltas</th>
                        <th id="textcolor">Status</th>
                    <c:forEach items="${FrequenciaController}" var="frequescia">  
                        <tr>
                            <td id="textcolor">${frequencia.Nome}</td>
                            <td id="textcolor">${frequencia.disciplinaID}</td>
                            <td id="textcolor">${frequencia.Presente}</td>
                            <td id="textcolor">${frequencia.status}</td>

                        </tr> 
                    </c:forEach>    
                    </table>    
                </div>
            </div>
        </div>
    </section>
    <footer>
        <div class="container align-bottom">
            <div class="row" id="footer">
                <div class="col-1 align-bottom">
                    <img src="face.jpg" class="rounded float-start" id="img-footer" alt="face">
                </div>
                <div class="col-1">
                    <img src="Twitter.png"  class="rounded float-start" id="img-footer" alt="Twitter">
                </div>
                <div class="col-6">
                    <h3 id="footer">
                        Desenvolvido pelo Grupo RAPC
                    </h3>
                </div>

            </div>
        </div>
    </footer>
</body>
</html>