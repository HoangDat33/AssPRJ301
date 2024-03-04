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
public class LecturerDBContext extends AssDBContext<Lecturer> {

    public Lecturer getLecturerById(int id) {
        Lecturer l = null; // Khởi tạo đối tượng lecturer bằng null
        try {
            String sql = "SELECT lid, lname, lcode, lgender, lmail, lphone, laddress, ldob FROM Lecturer WHERE lid = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();

            // Di chuyển con trỏ tới hàng kết quả đầu tiên
            if (rs.next()) {
                l = new Lecturer(); // Khởi tạo đối tượng lecturer mới
                // Lấy dữ liệu từ ResultSet và thiết lập vào đối tượng lecturer
                l.setLid(rs.getInt("lid"));
                l.setLname(rs.getString("lname"));
                l.setLcode(rs.getString("lcode"));
                l.setLgender(rs.getBoolean("lgender"));
                l.setLmail(rs.getString("lmail"));
                l.setLphone(rs.getString("lphone"));
                l.setLaddress(rs.getString("laddress"));
                l.setLdob(rs.getDate("ldob"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(LecturerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return l;
    }

    @Override
    public ArrayList<Lecturer> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Lecturer entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Lecturer entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Lecturer entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Lecturer get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
