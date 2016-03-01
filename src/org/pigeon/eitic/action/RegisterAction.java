package org.pigeon.eitic.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.pigeon.eitic.dao.ClassDAO;
import org.pigeon.eitic.dao.CollegeDAO;
import org.pigeon.eitic.dao.DeptDAO;
import org.pigeon.eitic.dao.UserDAO;
import org.pigeon.eitic.vo.College;
import org.pigeon.eitic.vo.User;

public class RegisterAction {
    
    private List<College> colleges = new ArrayList<College>();
    private String message;
    
    private String username;
    private String role;
    private String realname;
    
    private String collegeid;
    private String deptid;
    private String classid;
    
    
    public String getAllColleges(){
        CollegeDAO cdao = new CollegeDAO();
        try {
            colleges = cdao.getAllColleges();
        } catch (SQLException e) {
            e.printStackTrace();
            message = "获取学院列表失败";
            return "notexist";
        }
        
        return "success";
    }
    
    public String getDeptList(){
        HttpServletResponse response = ServletActionContext.getResponse();
        DeptDAO deptDao = new DeptDAO();
        try {
            String str = deptDao.getDeptsByCollegeidForAjax(collegeid).toString();
            response.setCharacterEncoding("utf-8");
            response.getWriter().write(str);
        } catch (IOException e) {
            e.printStackTrace();
            message = "获取专业列表失败";
            return "notexist";
        }
        
        return null;
    }
    
    public String getClassList(){
        HttpServletResponse response = ServletActionContext.getResponse();
        ClassDAO classDao = new ClassDAO();
        try {
            String str = classDao.getDeptsByCollegeidForAjax(deptid).toString();
            response.setCharacterEncoding("utf-8");
            response.getWriter().write(str);
        } catch (IOException e) {
            e.printStackTrace();
            message = "获取班级列表失败";
            return "notexist";
        }
        
        return null;
    }
    
    public String register(){
        HttpServletResponse response = ServletActionContext.getResponse();
        UserDAO userDao = new UserDAO();
        User user = new User();
        
        String str = "";

        if ("".equals(username)) {
            str = "用户帐号不能为空";
        } else if ("".equals(realname)) {
            str = "真实姓名不能为空";
        } else if ("0".equals(collegeid)) {
            str = "请选择所在学院";
        } else if (userDao.isExist(username)){
            str = "此帐号已存在";
        } else {
            user.setUsername(username);
            user.setPassword(username);
            user.setRole(role);
            user.setRealname(realname);
            user.setCollegeid(collegeid);
            user.setDeptid(deptid);
            user.setClassid(classid);
            
            try {
                userDao.register(user);
            } catch (SQLException e) {
                e.printStackTrace();
                message = "系统错误";
                return "notexist";
            }
            str = "成功注册新用户！";
        }
        
        
        try {           
            response.setCharacterEncoding("utf-8");
            response.getWriter().write(str);
        } catch (IOException e) {
            e.printStackTrace();
            message = "系统错误";
            return "notexist";
        }
        
        return null;
    }
    
    public String notexist(){
        return "notexist";
    }

    public List<College> getColleges() {
        return colleges;
    }

    public void setColleges(List<College> colleges) {
        this.colleges = colleges;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getClassid() {
        return classid;
    }

    public void setClassid(String classid) {
        this.classid = classid;
    }
    
}
