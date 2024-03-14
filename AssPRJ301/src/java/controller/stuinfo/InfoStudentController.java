/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.stuinfo;

import controller.authentication.BaseRequireAuthentication;
import dal.StudentDBContext;
import entity.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import entity.*;

/**
 *
 * @author Dat
 */
public class InfoStudentController extends BaseRequireAuthentication{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int sid = Integer.parseInt(req.getParameter("id"));
        StudentDBContext sdbc = new StudentDBContext();
        Student s = sdbc.getStdByID(sid);
        
        req.setAttribute("s", s);
        req.getRequestDispatcher("../view/student/info.jsp").forward(req, resp);
    }
    
}
