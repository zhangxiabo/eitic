package org.pigeon.eitic.action;

import java.sql.SQLException;
import java.util.List;

import org.pigeon.eitic.constants.BaseUnit;
import org.pigeon.eitic.constants.Constants;
import org.pigeon.eitic.dao.NoticeDAO;
import org.pigeon.eitic.dao.UserDAO;
import org.pigeon.eitic.vo.Notice;
import org.pigeon.eitic.vo.User;


public class LoginAction{

    private static final String LOGIN = "login";
    private static final String LOGOUT = "logout";
    
    private List<Notice> alllist = null;  //首页校级通知列表
    private List<Notice> collegelist = null;  //首页院级通知列表

    private User user;
    private String message;
    private String username;  //登录页中获取的用户名
    private String password;  //登录页中获取的密码
    
    public String login(){
        
        UserDAO userDao = new UserDAO();
        
        try {
            user = userDao.getUserByName(username);
            
            if (user == null) {
                message = "帐号不存在.";
                return LOGIN;
            } else if (!user.getPassword().equals(password)) {
                message = "密码错误.";
                return LOGIN;
            } else {
                BaseUnit.put(Constants.LOGIN_USER, user);
                
                userDao.updateLoginTime(user.getUsername());
                
                //获取校级通知和院级通知
                NoticeDAO noticeDao = new NoticeDAO();
                alllist = noticeDao.getNoticeList(0,5,"all");
                BaseUnit.put(Constants.MAINPAGE_ALL_LIST, alllist);
                
                collegelist = noticeDao.getNoticeList(0,5,BaseUnit.getLoginUser().getCollegeid());
                BaseUnit.put(Constants.MAINPAGE_COLLEGE_LIST, collegelist);
                
                //登录成功，进入主页
                return "mainpage";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            message = "系统错误";
            return LOGIN;
        }
        
    }
    
    public String logout() {
        BaseUnit.logout();
        
        return LOGOUT;
    }
    
    public String notexist(){
        return "notexist";
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
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

    public List<Notice> getAlllist() {
        return alllist;
    }

    public void setAlllist(List<Notice> alllist) {
        this.alllist = alllist;
    }

    public List<Notice> getCollegelist() {
        return collegelist;
    }

    public void setCollegelist(List<Notice> collegelist) {
        this.collegelist = collegelist;
    }
    
}
