/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.lecturer;

import controller.authentication.BaseRequireAuthentication;
import dal.LessionDBContext;
import dal.TimeSlotDBContext;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import util.DateTimeHelper;
import entity.*;

/**
 *
 * @author Dat
 */
public class TimeTableController extends BaseRequireAuthentication {
   

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int lid = Integer.parseInt(req.getParameter("id"));
        String raw_from = req.getParameter("from");
        String raw_to = req.getParameter("to");
        java.sql.Date from = null;
        java.sql.Date to = null;
        
        Date today = new Date();
        if(raw_from ==null)
        {
            from = DateTimeHelper.convertUtilDateToSqlDate(DateTimeHelper.getWeekStart(today));
        }
        else
        {
            from = java.sql.Date.valueOf(raw_from);
        }
        
        if(raw_to ==null)
        {
            to =DateTimeHelper.convertUtilDateToSqlDate(
                    DateTimeHelper.addDaysToDate(DateTimeHelper.getWeekStart(today),6));
        }
        else
        {
            to = java.sql.Date.valueOf(raw_to);
        }
        
        ArrayList<java.sql.Date> dates = DateTimeHelper.getListBetween(
                DateTimeHelper.convertSqlDateToUtilDate(from), 
                DateTimeHelper.convertSqlDateToUtilDate(to));
        
        TimeSlotDBContext slotDB = new TimeSlotDBContext();
        ArrayList<TimeSlot> slots = slotDB.list();
        
        LessionDBContext lessDB = new LessionDBContext();
        ArrayList<Lession> lessions = lessDB.getLessionBy(lid, from, to);
        
        req.setAttribute("slots", slots);
        req.setAttribute("dates", dates);
        req.setAttribute("from", from);
        req.setAttribute("to", to);
        req.setAttribute("lessions", lessions);
        
        req.getRequestDispatcher("../view/lecturer/timetable.jsp").forward(req, resp);
        
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
