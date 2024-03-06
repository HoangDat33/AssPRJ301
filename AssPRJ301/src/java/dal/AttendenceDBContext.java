/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import entity.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Dat
 */
public class AttendenceDBContext extends AssDBContext<Attendence>{

    public  ArrayList<Attendence> getAttBy(int stdid){
        ArrayList<Attendence> atts = new ArrayList<>();
        try {
            Attendence att = new Attendence();
            String sql = "SELECT a.aid,a.leid,a.sid,a.ispresent,a.decription,a.capturetime FROM Attendence a WHERE sid = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, stdid);
            ResultSet rs = stm.executeQuery();
            
            // Di chuyển con trỏ tới hàng kết quả đầu tiên
            if (rs.next()) {
                att.setId(rs.getInt("aid"));
                
                Lession les = new Lession();
                LessionDBContext ldbc = new LessionDBContext();
                les = ldbc.getLesBy(rs.getInt("leid"));
                att.setLession(les);
                
                Student s = new Student();
                StudentDBContext sdbc = new StudentDBContext();
                s = sdbc.getStdByID(stdid);
                att.setStudent(s);
                
                att.setPresent(rs.getBoolean("ispresent"));
                att.setDescription(rs.getString("decription"));
                att.setCaptureTime(rs.getDate("capturetime"));
                atts.add(att);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LecturerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return atts;
    }
    
    @Override
    public ArrayList<Attendence> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Attendence entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Attendence entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Attendence entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Attendence get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
