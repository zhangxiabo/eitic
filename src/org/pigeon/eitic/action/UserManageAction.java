package org.pigeon.eitic.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.pigeon.eitic.constants.BaseUnit;
import org.pigeon.eitic.constants.Constants;
import org.pigeon.eitic.dao.ClassDAO;
import org.pigeon.eitic.dao.CollegeDAO;
import org.pigeon.eitic.dao.DeptDAO;
import org.pigeon.eitic.dao.UserDAO;
import org.pigeon.eitic.vo.User;

public class UserManageAction {
    
    private String email;
    private String telphone;
    
    private String oldpwd;  //原密码
    private String conpwd;  //确认密码
    private String newpwd;  //新密码
    
    private String collegeName;
    private String deptName;
    private String className;
    
    private String message;
    private User user = null;
    
    public UserManageAction(){
        user = BaseUnit.getLoginUser();
    }
    
    public String getUserInfo(){
        CollegeDAO collegedao = new CollegeDAO();
        DeptDAO deptdao = new DeptDAO();
        ClassDAO classdao = new ClassDAO();
        
        try {
            collegeName = collegedao.getNameById(user.getCollegeid());
            deptName = deptdao.getNameById(user.getDeptid());
            className = classdao.getNameById(user.getClassid());
        } catch (SQLException e) {
            e.printStackTrace();
            message = "系统错误";
            return "notexist";
        }
        
        return "success";
    }
    
    public String modifypwd(){
        HttpServletResponse response = ServletActionContext.getResponse();
        UserDAO userDao = new UserDAO();
        
        String str = "";

        if ("".equals(newpwd)) {
            str = "新密码不能为空";
        } else if ("".equals(conpwd)) {
            str = "确认密码不能为空";
        } else if (!newpwd.equals(conpwd)) {
            str = "两次输入的密码不相同";
        } else {
            
            try {
                userDao.modifypwd(user.getUsername(),newpwd);
                user.setPassword(newpwd);
                BaseUnit.put(Constants.LOGIN_USER, user);
            } catch (SQLException e) {
                e.printStackTrace();
                message = "系统错误";
                return "notexist";
            }
            str = "修改密码成功！";
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
    
    public String modifyContact(){
        HttpServletResponse response = ServletActionContext.getResponse();
        UserDAO userDao = new UserDAO();
        
        String checkemail = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";  
        String checkphone = "^(13[4,5,6,7,8,9]|15[0,8,9,1,7]|188|187)\\d{8}$";  
        
        String str = "";

        System.out.println(Pattern.compile(checkemail).matcher(email).matches());
        
        if (!Pattern.compile(checkemail).matcher(email).matches()) {
            str = "邮箱格式不正确";
        } else if (!Pattern.compile(checkphone).matcher(telphone).matches()) {
            str = "手机号码格式不正确";
        } else {
            
            try {
                userDao.modifyContact(user.getUsername(),email,telphone);
                user.setEmail(email);
                user.setTelphone(telphone);
                BaseUnit.put(Constants.LOGIN_USER, user);
            } catch (SQLException e) {
                e.printStackTrace();
                message = "系统错误";
                return "notexist";
            }
            str = "修改联系方式成功！";
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
    

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone;
    }

    public String getOldpwd() {
        return oldpwd;
    }

    public void setOldpwd(String oldpwd) {
        this.oldpwd = oldpwd;
    }

    public String getConpwd() {
        return conpwd;
    }

    public void setConpwd(String conpwd) {
        this.conpwd = conpwd;
    }

    public String getNewpwd() {
        return newpwd;
    }

    public void setNewpwd(String newpwd) {
        this.newpwd = newpwd;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getCollegeName() {
        return collegeName;
    }

    public void setCollegeName(String collegeName) {
        this.collegeName = collegeName;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
}
