package org.pigeon.eitic.vo;

import java.io.Serializable;

public class User implements Serializable{
    
    private static final long serialVersionUID = 743328773409710915L;
    private String username;
    private String password;
    private String role;
    private String lasttime;   //上次登录时间
    
    private String realname;   //真实姓名
    private String collegeid;  //所在学院ID
    private String deptid;     //所在系ID
    private String classid;     //所在班级ID
    
    private String email;   
    private String telphone;
    
    public User() {
        super();
    }
    
    public User(String username, String password, String role, String lasttime,
            String realname, String collegeid, String deptid, String classid,
            String email, String telphone) {
        super();
        this.username = username;
        this.password = password;
        this.role = role;
        this.lasttime = lasttime;
        this.realname = realname;
        this.collegeid = collegeid;
        this.deptid = deptid;
        this.classid = classid;
        this.email = email;
        this.telphone = telphone;
    }

    public User(String username, String realname) {
        super();
        this.username = username;
        this.realname = realname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getLasttime() {
        return lasttime;
    }

    public void setLasttime(String lasttime) {
        this.lasttime = lasttime;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
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
    
}
