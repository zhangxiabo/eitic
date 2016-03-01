package org.pigeon.eitic.action;

import java.sql.SQLException;
import java.util.List;

import org.pigeon.eitic.dao.CollegeDAO;
import org.pigeon.eitic.vo.College;

public class CollegeAction {
    
    private String message;
    
    private String collegeid;
    private String collname;

    private List<College> colleges = null;
    
    public String toCollegePage(){
        CollegeDAO collegeDao = new CollegeDAO();
        try {
            colleges = collegeDao.getAllColleges();
        } catch (SQLException e) {
            e.printStackTrace();
            message = "系统错误";
            return "notexist";
        }
        
        return "collegepage";
    }
    
    
    public String addCollege(){
        CollegeDAO collegeDao = new CollegeDAO();
        try {
            if (collegeDao.isExist(collegeid)){
                message = "此学院编号已存在";
                return "notexist";
            }
            collegeDao.insertCollege(collegeid, collname);
        } catch (SQLException e) {
            e.printStackTrace();
            message = "系统错误";
            return "notexist";
        }
        
        message = "添加学院成功！";
        return "success";
    }
    
    public String deleteCollege(){
        CollegeDAO collegeDao = new CollegeDAO();
        try {
            collegeDao.deleteCollegeByID(collegeid);
        } catch (SQLException e) {
            e.printStackTrace();
            message = "系统错误";
            return "notexist";
        }
        
        message = "删除学院成功！";
        return "success";
    }

    
    
    public String getMessage() {
        return message;
    }
    
    public void setMessage(String message) {
        this.message = message;
    }

    public List<College> getColleges() {
        return colleges;
    }

    public void setColleges(List<College> colleges) {
        this.colleges = colleges;
    }

    public String getCollegeid() {
        return collegeid;
    }

    public void setCollegeid(String collegeid) {
        this.collegeid = collegeid;
    }

    public String getCollname() {
        return collname;
    }

    public void setCollname(String collname) {
        this.collname = collname;
    }
    
}
