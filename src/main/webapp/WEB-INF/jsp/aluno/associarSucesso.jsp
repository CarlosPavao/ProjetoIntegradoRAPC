<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
    <script>
        if(!alert("Aluno(a) com sucesso!")) document.location = '${pageContext.request.contextPath}/associarAluno';
    </script>    
        </div>
    </body>
</html>
