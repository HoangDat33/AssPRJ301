/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;
import java.sql.*;
import java.util.ArrayList;
/**
 *
 * @author Dat
 */
public class Lession {
    private int leid;
    private Date date;
    private boolean isAttended;
    private Group group;
    private TimeSlot timeSlot;
    private Room room;
    private Lecturer lecturer;
    private ArrayList<Attendence> atd = new ArrayList<>();

    public int getLeid() {
        return leid;
    }

    public void setLeid(int leid) {
        this.leid = leid;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public boolean isIsAttended() {
        return isAttended;
    }

    public void setIsAttended(boolean isAttended) {
        this.isAttended = isAttended;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public TimeSlot getTimeSlot() {
        return timeSlot;
    }

    public void setTimeSlot(TimeSlot timeSlot) {
        this.timeSlot = timeSlot;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Lecturer getLecturer() {
        return lecturer;
    }

    public void setLecturer(Lecturer lecturer) {
        this.lecturer = lecturer;
    }

    public ArrayList<Attendence> getAtd() {
        return atd;
    }

    public void setAtd(ArrayList<Attendence> atd) {
        this.atd = atd;
    }
    
    
}
