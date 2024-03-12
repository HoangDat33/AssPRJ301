/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import entity.*;
import java.util.ArrayList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Dat
 */
public class SubjectDBContaxt extends AssDBContext<Subject>{

    public Subject getSubByID(int id){
        Subject s = new Subject();
        try {
            String sql = "select subid, subname, credit from Subject where subid = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                s.setSubid(rs.getInt("subid"));
                s.setSubname(rs.getString("subname"));
                s.setCredit(rs.getInt("credit"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDBContaxt.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }
    @Override
    public ArrayList<Subject> list() {
        ArrayList<Subject> subjects = new ArrayList<>();
        try {
            String sql = "select subid, subname, credit from Subject";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {   
                Subject s = new Subject();
                s.setSubid(rs.getInt("subid"));
                s.setSubname(rs.getString("subname"));
                s.setCredit(rs.getInt("credit"));
                subjects.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDBContaxt.class.getName()).log(Level.SEVERE, null, ex);
        }
        return subjects;
    }

    @Override
    public void insert(Subject entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Subject entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Subject entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Subject get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
