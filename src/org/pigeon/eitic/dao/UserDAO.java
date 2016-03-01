package org.pigeon.eitic.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.pigeon.eitic.connector.Connector;
import org.pigeon.eitic.vo.User;


public class UserDAO {

    private static final String VERIFY_USER_LOGIN = "select * from user where username=?";
    private static final String UPDATE_LOGIN_TIME = "update user set lasttime=now() where username=?";
    private static final String REGISTER_USER = "insert into user(username,password,role,realname,collegeid,deptid,classid) values(?,?,?,?,?,?,?)";
    private static final String USER_IS_EXIST = "select count(*) from user where username=?";
    private static final String UPDATE_USER_PASSWORD = "update user set password=? where username=?";
    private static final String UPDATE_USER_CONTACT = "update user set email=?,telphone=? where username=?";
    private static final String GET_TEACHER_LIST = "select * from user where role='teacher' and collegeid=?";
    private static final String GET_STUDENT_LIST_BY_TEACHERID = "select * from user where username in (select stuid from task where teaid=?)";
    
    private Connector connector;

    
    public UserDAO() {
        this.connector = new Connector();
    }
    
    public User getUserByName(String username) throws SQLException{
        if (username.trim().equals("")) {
            throw new IllegalArgumentException();
        }
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User user = null;
        
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(VERIFY_USER_LOGIN);
            ps.setString(1, username);

            rs = ps.executeQuery();

            if (rs.next()) {
                if(rs.getDate("lasttime") == null){
                    user = new User(rs.getString("username"), rs.getString("password"), 
                                    rs.getString("role"), null, rs.getString("realname"), 
                                    rs.getString("collegeid"),rs.getString("deptid"), 
                                    rs.getString("classid"), rs.getString("email"), rs.getString("telphone"));
                } else {
                    user = new User(rs.getString("username"), rs.getString("password"), rs.getString("role"), 
                                    rs.getDate("lasttime").toString() + " " + rs.getTime("lasttime").toString(), 
                                    rs.getString("realname"), 
                                    rs.getString("collegeid"),rs.getString("deptid"), 
                                    rs.getString("classid"), rs.getString("email"), rs.getString("telphone"));
                }
                System.out.println("--获取用户登录信息。");
                
            } else {
                return user;
            }

        } catch (SQLException e){
            throw new SQLException(e);
        } finally {
            this.connector.closeResultSet(rs);
            this.connector.closePreparedStatement(ps);
            this.connector.closeConnection(conn);
        }
        return user;
    }

    /**
     * 更新登录时间
     * @param username 
     */
    public void updateLoginTime(String username) {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = this.connector.getConnection();
            conn.setAutoCommit(false);

            ps = conn.prepareStatement(UPDATE_LOGIN_TIME);
            ps.setString(1, username);
            
            if (ps.executeUpdate() != 1) {
                conn.rollback();
                System.out.println("--更新登录时间失败。");
            } else {
                System.out.println("--更新登录时间成功。");

                conn.commit();
                conn.setAutoCommit(true);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            connector.closePreparedStatement(ps);
            connector.closeConnection(conn);
        }
    }

    /**
     * 更新注册用户信息
     * @param user
     * @throws SQLException 
     */
    public void register(User user) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = this.connector.getConnection();
            conn.setAutoCommit(false);

            ps = conn.prepareStatement(REGISTER_USER);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getRole());
            ps.setString(4, user.getRealname());
            ps.setString(5, user.getCollegeid());
            ps.setString(6, user.getDeptid());
            ps.setString(7, user.getClassid());
            
            if (ps.execute()) {
                conn.rollback();
                System.out.println("--插入用户信息失败。");
            } else {
                System.out.println("--插入用户信息成功。");

                conn.commit();
                conn.setAutoCommit(true);
            }

        } catch (SQLException e) {
            throw new SQLException(e);
        } finally {
            connector.closePreparedStatement(ps);
            connector.closeConnection(conn);
        }
        
        
    }

    public boolean isExist(String username) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(USER_IS_EXIST);
            ps.setString(1, username);

            rs = ps.executeQuery();

            rs.next();
            if (rs.getInt(1) == 1) {
                System.out.println("此用户帐号已存在");
                return true;
            } else {
                return false;
            }

        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            this.connector.closeResultSet(rs);
            this.connector.closePreparedStatement(ps);
            this.connector.closeConnection(conn);
        }
        
        return false;
    }

    public void modifypwd(String username,String newpwd) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = this.connector.getConnection();
            conn.setAutoCommit(false);

            ps = conn.prepareStatement(UPDATE_USER_PASSWORD);
            ps.setString(1, newpwd);
            ps.setString(2, username);
            
            if (ps.executeUpdate() != 1) {
                conn.rollback();
                System.out.println("--修改用户密码失败。");
            } else {
                System.out.println("--修改用户密码成功。");

                conn.commit();
                conn.setAutoCommit(true);
            }

        } catch (SQLException e) {
            throw new SQLException(e);
        } finally {
            connector.closePreparedStatement(ps);
            connector.closeConnection(conn);
        }
    }

    public void modifyContact(String username, String email, String telphone) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = this.connector.getConnection();
            conn.setAutoCommit(false);

            ps = conn.prepareStatement(UPDATE_USER_CONTACT);
            ps.setString(1, email);
            ps.setString(2, telphone);
            ps.setString(3, username);
            
            if (ps.executeUpdate() != 1) {
                conn.rollback();
                System.out.println("--修改用户联系方式失败。");
            } else {
                System.out.println("--修改用户联系方式成功。");

                conn.commit();
                conn.setAutoCommit(true);
            }

        } catch (SQLException e) {
            throw new SQLException(e);
        } finally {
            connector.closePreparedStatement(ps);
            connector.closeConnection(conn);
        }
        
    }

    public List<User> getTeacherList(String collegeid) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        List<User> teacherList = new ArrayList<User>();
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(GET_TEACHER_LIST);
            ps.setString(1, collegeid);
            
            rs = ps.executeQuery();

            while (rs.next()) {
                User teacher = new User(rs.getString("username"),rs.getString("realname"));
                teacherList.add(teacher);
            }
            System.out.println("--获取学生所在院的教师列表成功。");

        } catch (SQLException e){
            System.out.println("--获取学生所在院的教师列表失败。");
            throw new SQLException(e);
        } finally {
            this.connector.closeResultSet(rs);
            this.connector.closePreparedStatement(ps);
            this.connector.closeConnection(conn);
        }
        
        return teacherList;
    }

    public List<User> getStusByTeaid(String username) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        List<User> studentList = new ArrayList<User>();
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(GET_STUDENT_LIST_BY_TEACHERID);
            ps.setString(1, username);
            
            rs = ps.executeQuery();

            while (rs.next()) {
                User student = new User(rs.getString("username"),rs.getString("realname"));
                studentList.add(student);
            }
            System.out.println("--获取学生所在院的教师列表成功。");

        } catch (SQLException e){
            System.out.println("--获取学生所在院的教师列表失败。");
            throw new SQLException(e);
        } finally {
            this.connector.closeResultSet(rs);
            this.connector.closePreparedStatement(ps);
            this.connector.closeConnection(conn);
        }
        
        return studentList;
    
    }
}
