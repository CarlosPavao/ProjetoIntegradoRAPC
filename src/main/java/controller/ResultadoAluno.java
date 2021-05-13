/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AlunoDao;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Aluno;

/**
 *
 * @author Alexsandro
 */
@WebServlet(name = "ResultadoAluno", urlPatterns = {"/resultado"})
public class ResultadoAluno extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private static final String INSERT_OR_EDIT = "/adicionarEditarAluno.jsp";
    private static final String LIST_ALUNO = "/listarAluno.jsp";
    private final AlunoDao dao;

    public ResultadoAluno() {
        dao = new AlunoDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sessao = request.getSession();
        int numero;
        int codAluno = (int) sessao.getAttribute("codAluno");
        Aluno aluno = new Aluno();
        
        if (sessao.getAttribute("dados") != null) {
            Aluno dados = (Aluno) sessao.getAttribute("dados");
            sessao.removeAttribute("dados");

            request.setAttribute("dados", dados);
            
            if (codAluno == 0) {
                try {
                    dao.adicionarAluno(dados);
                    RequestDispatcher view = request.getRequestDispatcher("/alunoSucesso.jsp");
                    view.forward(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(AlunoController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                aluno.setCodAluno(codAluno);
                try {
                    dao.updateAluno(dados);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/alunoSucessoEd.jsp");
                    dispatcher.forward(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(AlunoController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            RequestDispatcher view = request.getRequestDispatcher(INSERT_OR_EDIT);
            try {
                request.setAttribute("alunos", dao.getAllAlunos());
            } catch (SQLException ex) {
                Logger.getLogger(AlunoController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/alunoErro.jsp");
            dispatcher.forward(request, response);
        }
    }
}