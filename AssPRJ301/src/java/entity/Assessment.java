/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;
import entity.*;
/**
 *
 * @author Dat
 */
public class Assessment {
    private int assid;
    private entity.Subject subject;
    private String assname;
    private float weight;

    public int getAssid() {
        return assid;
    }

    public void setAssid(int assid) {
        this.assid = assid;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }


    public String getAssname() {
        return assname;
    }

    public void setAssname(String assname) {
        this.assname = assname;
    }

    public float getWeight() {
        return weight;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }
    
    
}
