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

        public void takeAttendances(int leid, ArrayList<Attendence> atts) {
        try {
            connection.setAutoCommit(false);
            String sql_remove_atts = "DELETE FROM Attendence WHERE leid = ?";
            PreparedStatement stm_remove_atts = connection.prepareStatement(sql_remove_atts);
            stm_remove_atts.setInt(1, leid);
            stm_remove_atts.executeUpdate();

            for (Attendence att : atts) {
                String sql_insert_att = "INSERT INTO [Attendence]\n"
                        + "           ([leid]\n"
                        + "           ,[sid]\n"
                        + "           ,[decription]\n"
                        + "           ,[isPresent]\n"
                        + "           ,[capturetime])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,GETDATE())";
                PreparedStatement stm_insert_att = connection.prepareStatement(sql_insert_att);
                stm_insert_att.setInt(1, leid);
                stm_insert_att.setInt(2, att.getStudent().getSid());
                stm_insert_att.setString(3, att.getDescription());
                stm_insert_att.setBoolean(4, att.isPresent());
                stm_insert_att.executeUpdate();
            }

            String sql_update_lession = "UPDATE Lession SET isAttended = 1 WHERE leid =?";
            PreparedStatement stm_update_lession = connection.prepareStatement(sql_update_lession);
            stm_update_lession.setInt(1, leid);
            stm_update_lession.executeUpdate();

            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    public ArrayList<Student> getStudentsByLession(int leid) {
        ArrayList<Student> students = new ArrayList<>();
        try {
            String sql = "SELECT s.sid,s.sname, s.saddress,s.scode, s.sdob, s.sgender, s.sphone, s.smail\n" +
                                "FROM Student s INNER JOIN Enrollment e ON s.sid = e.sid\n" +
                                "INNER JOIN StudentGroup g ON g.gid = e.gid\n" +
                                "INNER JOIN Lession les ON les.gid = g.gid\n" +
                                "WHERE les.leid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, leid);
            ResultSet rs = stm.executeQuery();
            while(rs.next())
            {
                Student s = new Student();
                s.setSid(rs.getInt("sid"));
                s.setSname(rs.getString("sname"));
                s.setScode(rs.getString("scode"));
                s.setSgender(rs.getBoolean("sgender"));
                s.setSmail(rs.getString("smail"));
                s.setSphone(rs.getString("sphone"));
                s.setSaddress(rs.getString("saddress"));
                s.setSdob(rs.getDate("sdob"));
                students.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
    }

    public ArrayList<Attendence> getAttendencesByLession(int leid) {
        ArrayList<Attendence> atts = new ArrayList<>();
        try {
            String sql = "SELECT s.sid,s.sname, s.saddress,s.scode, s.sdob, s.sgender, s.sphone, s.smail,a.aid,a.decription,a.isPresent,a.capturetime FROM Student s \n" +
"                            INNER JOIN Enrollment e ON s.sid = e.sid\n" +
"                            INNER JOIN StudentGroup g ON g.gid = e.gid\n" +
"                            INNER JOIN Lession les ON les.gid = g.gid\n" +
"                            LEFT JOIN Attendence a ON a.leid = les.leid AND a.sid = s.sid\n" +
"                            WHERE les.leid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, leid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendence a = new Attendence();
                Student s = new Student();
                Lession les = new Lession();
                s.setSid(rs.getInt("sid"));
                s.setSname(rs.getString("sname"));
                s.setScode(rs.getString("scode"));
                s.setSgender(rs.getBoolean("sgender"));
                s.setSmail(rs.getString("smail"));
                s.setSphone(rs.getString("sphone"));
                s.setSaddress(rs.getString("saddress"));
                s.setSdob(rs.getDate("sdob"));
                a.setStudent(s);
                
                les = getLesBy(leid);
                a.setLession(les);

                a.setId(rs.getInt("aid"));
                if (a.getId() != 0) {
                    a.setDescription(rs.getString("decription"));
                    a.setPresent(rs.getBoolean("isPresent"));
                    a.setCaptureTime(rs.getTimestamp("capturetime"));
                }
                atts.add(a);
            }

        } catch (SQLException ex) {
            Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return atts;
    }
    
        public Lession getLesBy(int leid){
        Lession les = new Lession();
        try {
            
            String sql = "SELECT les.leid,les.isAttended,les.date,g.gid,g.gname,\n" +
"                           g.subid, g.lid,su.subid,su.subname, su.credit,t.tid,\n" +
"                           t.tname,r.rid,r.rname,l.lid,l.lname,l.lcode,l.lgender,l.ldob,\n" +
"                           l.lphone, l.lmail, l.laddress, s.sid, s.scode, s.sname, s.sdob,\n" +
"                           s.sgender, s.sphone, s.smail, s.saddress FROM Lession les \n" +
"                           INNER JOIN [Group] g ON les.gid = g.gid \n" +
"                           INNER JOIN Subject su ON su.subid = g.subid \n" +
"                           INNER JOIN TimeSlot t ON t.tid = les.tid \n" +
"                           INNER JOIN Room r ON r.rid = les.rid \n" +
"                           INNER JOIN Lecturer l ON l.lid = les.lid \n" +
"                           INNER JOIN Enrollment e ON g.gid = e.gid\n" +
"                           INNER JOIN Student s ON s.sid = e.sid\n" +
"                           WHERE les.leid = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, leid);
            ResultSet rs = stm.executeQuery();
            
            while(rs.next()){
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
                
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return les;
    }
    
    
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
    public ArrayList<Lession> getStdLessionBy(int lid, Date from, Date to){
        ArrayList<Lession> lessions = new ArrayList<>();
        try {
            
            String sql = "SELECT les.leid,les.isAttended,les.date,g.gid,g.gname,\n" +
"                           g.subid, g.lid,su.subid,su.subname, su.credit,t.tid,\n" +
"                           t.tname,r.rid,r.rname,l.lid,l.lname,l.lcode,l.lgender,l.ldob,\n" +
"                           l.lphone, l.lmail, l.laddress, s.sid, s.scode, s.sname, s.sdob,\n" +
"                           s.sgender, s.sphone, s.smail, s.saddress FROM Lession les \n" +
"                           INNER JOIN [Group] g ON les.gid = g.gid \n" +
"                           INNER JOIN Subject su ON su.subid = g.subid \n" +
"                           INNER JOIN TimeSlot t ON t.tid = les.tid \n" +
"                           INNER JOIN Room r ON r.rid = les.rid \n" +
"                           INNER JOIN Lecturer l ON l.lid = les.lid \n" +
"                           INNER JOIN Enrollment e ON g.gid = e.gid\n" +
"                           INNER JOIN Student s ON s.sid = e.sid\n" +
"                           WHERE s.sid = ? AND les.[date] >= ? and les.[date]<= ?;";
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
