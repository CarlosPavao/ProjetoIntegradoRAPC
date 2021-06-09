/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AlunoDao;
import dao.DesempenhoDao;
import dao.DisciplinaDao;
import dao.TurmaDao;
import model.Desempenho;
import model.Turma;

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


@WebServlet(name = "AssociarAluno", urlPatterns = {"/associarAluno","/selection"})
public class AssociarAluno extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String LIST_NOTA = "/listarNota";
    private final TurmaDao daoT;
    private final AlunoDao daoA;
        

        public AssociarAluno() {
            daoT = new TurmaDao();
            daoA = new AlunoDao();
        }
        
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        boolean temErro = false;
        String forward = "";
        String action = request.getServletPath();

        if (action.equals("/associarAluno")) {
            //Captando informações do banco para o Select
            try {
                request.setAttribute("turmas", daoT.getAllTurmas());
                request.setAttribute("aluno", daoA.alunoSemTurma());
            } catch (SQLException ex) {
                Logger.getLogger(ProfessorController.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("/WEB-INF/jsp/aluno/associar.jsp").forward(request, response);
        }
        if (action.equals("/selection")) {
            int codTurma;
            int codDisciplina;

            if (request.getParameter("codTurma").equals("")) {
                codTurma = 0;
                temErro = true;
                request.setAttribute("erroTurma", "Turma não informada.");
                request.getRequestDispatcher("/WEB-INF/jsp/aluno/associar2.jsp").
                        forward(request, response);
            } else if (request.getParameter("turmaCod") == null
                    || request.getParameter("turmaCod").equals("")
                    && request.getParameter("aluno") == null
                    || request.getParameter("aluno").equals("")) {
                codTurma = 0;
                temErro = true;
                request.setAttribute("erroTurma", "Turma não informada.");

                try {
                    request.setAttribute("aluno", daoA.alunoSemTurma());
                    request.setAttribute("turmas", daoT.getAllTurmas());
                } catch (SQLException ex) {
                    Logger.getLogger(AssociarAluno.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("/WEB-INF/jsp/aluno/associarValidacao.jsp").forward(request, response);
            } else {
                codTurma = Integer.parseInt(request.getParameter("codTurma"));
            }

            if (codTurma != 0) {

                try {
                    request.setAttribute("turmaD", daoT.recuperaListaTurmaDifer(codTurma));
                    request.setAttribute("turmaR", daoT.recuperaTurma(codTurma));
                    request.setAttribute("aluno", daoA.alunoSemTurma());

                } catch (SQLException ex) {
                    Logger.getLogger(ProfessorController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("/WEB-INF/jsp/aluno/associar2.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        int cod_aluno;
        int codTurma;
        int codAluno;
        int qtdeTurma;

        boolean temErro = false;

        // VALIDAÇÕES
        if (request.getParameter("turmaCod") == null || request.getParameter("turmaCod").equals("")) {
            codTurma = 0;
            temErro = true;
            request.setAttribute("erroTurma", "Turma não informada.");
        } else {
            codTurma = Integer.parseInt(request.getParameter("turmaCod"));
        }
        if (request.getParameter("aluno") == null || request.getParameter("DisciplinaCod").equals("")) {
            codAluno = 0;
            temErro = true;
            request.setAttribute("erroAluno", "Aluno(a) não informado(a).");
        } else {
            codAluno = Integer.parseInt(request.getParameter("aluno"));

        }
            if (codTurma != 0) {

                try {
                    request.setAttribute("turmaD", daoT.recuperaListaTurmaDifer(codTurma));
                    request.setAttribute("turmaR", daoT.recuperaTurma(codTurma));
                    
                    qtdeTurma = daoT.SelecionarDesempenho(codTurma).getQte();
                    
                } catch (SQLException ex) {
                    Logger.getLogger(ProfessorController.class.getName()).log(Level.SEVERE, null, ex);
                }

            } else if (codTurma == 0 && codAluno == 0) {

                try {
                    request.setAttribute("turmas", daoT.getAllTurmas());
                    request.setAttribute("aluno", daoA.alunoSemTurma());
                } catch (SQLException ex) {
                    Logger.getLogger(ProfessorController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher("/WEB-INF/jsp/aluno/associarValidacao.jsp").forward(request, response);
            } else {
                try {
                    request.setAttribute("turmaD", daoT.recuperaListaTurmaDifer(codTurma));
                    request.setAttribute("turmaR", daoT.recuperaTurma(codTurma));
                    
                } catch (SQLException ex) {
                    Logger.getLogger(AssociarAluno.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.setAttribute("codTurma", codTurma);
            }
    }
}