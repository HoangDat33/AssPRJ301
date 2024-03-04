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
public class StudentDBContext extends AssDBContext<Student>{

    public Student getStdByID(int id){
        Student s = null;
        try {
            String sql = "SELECT sid,scode,sname,sdob,sgender,sphone,smail,saddress FROM Student WHERE sid = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();

            // Di chuyển con trỏ tới hàng kết quả đầu tiên
            if (rs.next()) {
                s = new Student(); // Khởi tạo đối tượng lecturer mới
                // Lấy dữ liệu từ ResultSet và thiết lập vào đối tượng lecturer
                s.setSid(rs.getInt("sid"));
                s.setSname(rs.getString("sname"));
                s.setScode(rs.getString("scode"));
                s.setSgender(rs.getBoolean("sgender"));
                s.setSmail(rs.getString("smail"));
                s.setSphone(rs.getString("sphone"));
                s.setSaddress(rs.getString("saddress"));
                s.setSdob(rs.getDate("sdob"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(LecturerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }
    
    @Override
    public ArrayList<Student> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Student entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Student entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Student entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Student get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
