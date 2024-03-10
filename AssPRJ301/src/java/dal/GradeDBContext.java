/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Assessment;
import entity.Exam;
import entity.Grade;
import entity.Student;
import entity.Subject;
import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dat
 */
public class GradeDBContext extends AssDBContext<Grade>{
    
    ArrayList<Grade> grades = new ArrayList<>();
    public ArrayList<Grade> getGradeBySid(int sid, int subid){
        try {
            
            String sql = "SELECT graid,e.exid,e.datetime,ass.assid, ass.assname, ass.weight,sub.subid, sub.subname,\n" +
                    "					sub.credit,score FROM Grade gra \n" +
                    "					INNER JOIN Exam e ON gra.exid = e.exid\n" +
                    "					INNER JOIN Student s ON gra.sid = s.sid	\n" +
                    "					INNER JOIN Assessment ass ON ass.assid = e.assid\n" +
                    "					INNER JOIN Subject sub ON sub.subid = ass.suid\n" +
                    "                                       WHERE s.sid=? and sub.subid = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            stm.setInt(2, subid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Grade grade = new Grade();
                grade.setGraid(rs.getInt("graid"));
                grade.setScore(rs.getFloat("score"));
                
                Subject sub = new Subject();
                sub.setSubid(rs.getInt("subid"));
                sub.setSubname(rs.getString("subname"));
                sub.setCredit(rs.getInt("creadit"));
                
                Assessment assessment = new Assessment();
                assessment.setAssid(rs.getInt("assid"));
                assessment.setAssname(rs.getString("assname"));
                assessment.setWeight(rs.getFloat("weight"));
                assessment.setSubject(sub);
                
                Exam exam = new Exam();
                exam.setExid(rs.getInt("exid"));
                exam.setDate(rs.getDate("datetime"));
                exam.setAssessment(assessment);
                
                Student std = new Student();
                StudentDBContext stdb = new StudentDBContext();
                std = stdb.getStdByID(sid);
                
                grade.setExam(exam);
                grade.setStudent(std);
                
                grades.add(grade);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return grades;
    }
    
    @Override
    public ArrayList<Grade> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Grade entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Grade entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Grade entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Grade get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
