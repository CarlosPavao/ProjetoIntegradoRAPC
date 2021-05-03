<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1">
            <thead>
                <tr>
                    <th>Codigo do Aluno</th>
                    <th>Nome</th>
                    <th>Data de nascimento</th>
                    <th>sexo</th>
                    <th>Nome do Pai</th>
                    <th>Nome da Mãe</th>
                    <th>celular</th>
                    <th>telefone do pai</th>
                    <th>telefone da Mãe</th>
                    <th>E-mail</th>
                    <th>Rua</th>
                    <th>Número</th>
                    <th>Bairro</th>
                    <th>CEP</th>
                    <th colspan="2">Ação</th>
                </tr>
            </thead>
            <tbody>
                <!<!-- atributo Alunos vem da classe AlunoControlles na linha 65  -->
                <c:forEach items="${alunos}" var="aluno">
                    <tr>
                        <td><c:out value="${aluno.codAluno}" /></td>
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
                        <td><a href="AlunoController?action=edit&codAluno=<c:out value="${aluno.codAluno}" />">Editar </td>
                        <td><a href="AlunoController?action=delete&codAluno=<c:out value="${aluno.codAluno}" />">deletar</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <p><a href="AlunoController?action=insert">Add aluno</a></p>
    </body>
</html>
