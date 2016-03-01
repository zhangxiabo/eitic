package org.pigeon.eitic.action;

import java.sql.SQLException;
import java.util.List;

import org.pigeon.eitic.dao.ClassDAO;
import org.pigeon.eitic.dao.CollegeDAO;
import org.pigeon.eitic.vo.College;

public class ClassAction {

    private String message;
    
    private String collegeid;
    private String deptid;
    private String classid;
    private String classname;
    
    private List<College> colleges = null;
    
    public String toClassPage(){
        CollegeDAO collegeDao = new CollegeDAO();
        try {
            colleges = collegeDao.getAllColleges();
        } catch (SQLException e) {
            e.printStackTrace();
            message = "系统错误";
            return "notexist";
        }
        
        return "toclasspage";
    }
    
    public String addClass(){
        if("0".equals(collegeid)){
            message = "所属学院编号不能为空";
            return "notexist";
        }
        if("0".equals(deptid)){
            message = "所属专业编号不能为空";
            return "notexist";
        }
        
        ClassDAO classDao = new ClassDAO();
        if(classDao.isExist(classid)){
            message = "此班级编号已存在";
            return "notexist";
        }
        
        try {
            classDao.insertClass(classid, classname, deptid);
        } catch (SQLException e) {
            e.printStackTrace();
            message = "系统错误";
            return "notexist";
        }
        
        message = "添加班级成功！";
        return "success";
    }
    
    public String deleteClass(){
        ClassDAO classDao = new ClassDAO();
        try {
            classDao.deleteClassByID(classid);
        } catch (SQLException e) {
            e.printStackTrace();
            message = "系统错误";
            return "notexist";
        }
        
        message = "删除班级成功!";
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

    public String getDeptid() {
        return deptid;
    }

    public void setDeptid(String deptid) {
        this.deptid = deptid;
    }

    public String getClassid() {
        return classid;
    }

    public void setClassid(String classid) {
        this.classid = classid;
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname;
    }
    
}
