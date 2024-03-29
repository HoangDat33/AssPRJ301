/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.grade;

import controller.authentication.BaseRequireAuthentication;
import dal.GradeDBContext;
import dal.SubjectDBContaxt;
import entity.Account;
import entity.Grade;
import entity.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author Dat
 */
public class GradeController extends BaseRequireAuthentication {
   

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int stdid = Integer.parseInt(req.getParameter("stdid"));
        int subid = Integer.parseInt(req.getParameter("selectSub"));
        
        GradeDBContext graDB = new GradeDBContext();
        ArrayList<Grade> grades = graDB.getGradeBySid(stdid, subid);
        float overall = cal(grades);
        HttpSession session = req.getSession();
        
        session.setAttribute("overall", overall);
        session.setAttribute("grades", grades);
        req.getRequestDispatcher("../view/student/grade.jsp").forward(req, resp);    
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int stdid = Integer.parseInt(req.getParameter("id"));
        
        SubjectDBContaxt subdb = new SubjectDBContaxt();
        ArrayList<Subject> subjects = subdb.list();
        HttpSession session = req.getSession();
//        for (Subject subject : subjects) {
//            resp.getWriter().print(subject.getSubname());
//        }
        session.setAttribute("stdid", stdid);
        session.setAttribute("subjects", subjects);
        req.getRequestDispatcher("../view/student/grade.jsp").forward(req, resp);
    }

    private float cal(ArrayList<Grade> grades) {
        float overal = 0;
        for (Grade grade : grades) {
            overal += grade.getScore() * grade.getExam().getAssessment().getWeight();
        }
        return overal;
    }

}
