/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;
import java.sql.*;
/**
 *
 * @author Dat
 */
public class Lecturer {
    private int lid;
    private String lcode;
    private boolean lgender;
    private Date ldob;
    private String lname;
    private String lphone;
    private String lmail;
    private String laddress;

    public int getLid() {
        return lid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }

    public String getLcode() {
        return lcode;
    }

    public void setLcode(String lcode) {
        this.lcode = lcode;
    }

    public boolean isLgender() {
        return lgender;
    }

    public void setLgender(boolean lgender) {
        this.lgender = lgender;
    }

    public Date getLdob() {
        return ldob;
    }

    public void setLdob(Date ldob) {
        this.ldob = ldob;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getLphone() {
        return lphone;
    }

    public void setLphone(String lphone) {
        this.lphone = lphone;
    }

    public String getLmail() {
        return lmail;
    }

    public void setLmail(String lmail) {
        this.lmail = lmail;
    }

    public String getLaddress() {
        return laddress;
    }

    public void setLaddress(String laddress) {
        this.laddress = laddress;
    }
    
    
}
