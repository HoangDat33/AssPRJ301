/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.lecinfo;

import controller.authentication.BaseRequireAuthentication;
import dal.LecturerDBContext;
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
public class InfoLecturerController extends BaseRequireAuthentication{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int lid = Integer.parseInt(req.getParameter("id"));
        LecturerDBContext ldbc = new LecturerDBContext();
        Lecturer l = ldbc.getLecturerById(lid);
        
        req.setAttribute("l", l);
        req.getRequestDispatcher("../view/lecturer/info.jsp").forward(req, resp);
    }
    
}
