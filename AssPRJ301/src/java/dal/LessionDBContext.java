/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.*;
import entity.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Dat
 */
public class LessionDBContext extends AssDBContext<Lession>{

    public ArrayList<Lession> getLessionBy(int lid, Date from, Date to){
        ArrayList<Lession> lessions = new ArrayList<>();
        try {
            
            String sql = "SELECT les.leid,les.isAttended,les.date,g.gid,g.gname,"
                    + " g.subid, g.lid,su.subid,su.subname, su.credit,t.tid,"
                    + "t.tname,r.rid,r.rname,l.lid,l.lname,l.lcode,l.lgender,l.ldob,"
                    + " l.lphone, l.lmail, l.laddress FROM Lession les "
                    + "INNER JOIN [Group] g ON les.gid = g.gid "
                    + "INNER JOIN Subject su ON su.subid = g.subid "
                    + "INNER JOIN TimeSlot t ON t.tid = les.tid "
                    + "INNER JOIN Room r ON r.rid = les.rid "
                    + "INNER JOIN Lecturer l ON l.lid = les.lid "
                    + "WHERE les.lid = ? AND les.[date] >= ? and les.[date]<= ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lid);
            stm.setDate(2, from);
            stm.setDate(3, to);
            ResultSet rs = stm.executeQuery();
            
            while(rs.next()){
                Lession les = new Lession();
                Group g = new Group();
                Subject s = new Subject();
                TimeSlot slot = new TimeSlot();
                Room r = new Room();
                Lecturer l = new Lecturer();
                
                les.setLeid(rs.getInt("leid"));
                les.setIsAttended(rs.getBoolean("isAttended"));
                les.setDate(rs.getDate("date"));
                
                g.setGid(rs.getInt("gid"));
                g.setGname(rs.getString("gname"));
                s.setSubid(rs.getInt("subid"));
                s.setSubname(rs.getString("subname"));
                s.setCredit(rs.getInt("credit"));
                g.setSubject(s);
                les.setGroup(g);
                
                slot.setTid(rs.getInt("tid"));
                slot.setName(rs.getString("tname"));
                les.setTimeSlot(slot);
                
                r.setRid(rs.getInt("rid"));
                r.setRname(rs.getString("rname"));
                les.setRoom(r);
                
                l.setLid(rs.getInt("lid"));
                l.setLname("lname");
                l.setLcode(rs.getString("lcode"));
                l.setLgender(rs.getBoolean("lgender"));
                l.setLmail(rs.getString("lmail"));
                l.setLphone(rs.getString("lphone"));
                l.setLaddress(rs.getString("laddress"));
                l.setLdob(rs.getDate("ldob"));
                les.setLecturer(l);
                
                lessions.add(les);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lessions;
    }
    
    @Override
    public ArrayList<Lession> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Lession entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Lession entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Lession entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Lession get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
