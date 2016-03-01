package org.pigeon.eitic.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.pigeon.eitic.connector.Connector;

public class ClassDAO {

    private static final String GET_CLASSES_LIST = "select * from class where deptid=?";
    private static final String GET_CLASS_NAME_BY_ID = "select cname from class where classid=?";
    private static final String CLASS_IS_EXIST = "select count(*) from class where classid=?";
    private static final String INSERT_NEW_CLASS = "insert into class values(?,?,?)";
    private static final String DELETE_CLASS_BY_ID = "delete from class where classid=?";
    
    private Connector connector;

    public ClassDAO() {
        this.connector = new Connector();
    }

    public StringBuffer getDeptsByCollegeidForAjax(String deptid) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer sb = new StringBuffer();

        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(GET_CLASSES_LIST);
            ps.setString(1, deptid);

            rs = ps.executeQuery();

            while (rs.next()) {
                sb.append(rs.getString("classid") + "," + rs.getString("cname"));
                if (!rs.isLast())
                    sb.append("|");
            }
            System.out.println("--获取班级字符串成功。");

        } catch (SQLException e) {
            System.out.println("--获取班级字符串失败。");
            e.printStackTrace();
        } finally {
            this.connector.closeResultSet(rs);
            this.connector.closePreparedStatement(ps);
            this.connector.closeConnection(conn);
        }

        return sb;
    }

    public String getNameById(String classid) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(GET_CLASS_NAME_BY_ID);
            ps.setString(1, classid);

            rs = ps.executeQuery();

            if (rs.next()) {
                System.out.println("--获取班级名成功");
                return rs.getString("cname");
            } else {
                System.out.println("--获取班级名失败");
                return "";
            }

        } catch (SQLException e){
            throw new SQLException(e);
        } finally {
            this.connector.closeResultSet(rs);
            this.connector.closePreparedStatement(ps);
            this.connector.closeConnection(conn);
        }
    }

    public boolean isExist(String classid) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(CLASS_IS_EXIST);
            ps.setString(1, classid);

            rs = ps.executeQuery();

            rs.next();
            if (rs.getInt(1) == 1) {
                System.out.println("此班级编号已存在");
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

    public void insertClass(String classid, String classname, String deptid) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = this.connector.getConnection();
            conn.setAutoCommit(false);

            ps = conn.prepareStatement(INSERT_NEW_CLASS);
            ps.setString(1, classid);
            ps.setString(2, classname);
            ps.setString(3, deptid);
            
            if (ps.execute()) {
                conn.rollback();
                System.out.println("--插入班级信息失败。");
            } else {
                System.out.println("--插入班级信息成功。");

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

    public void deleteClassByID(String classid) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = this.connector.getConnection();
            conn.setAutoCommit(false);

            ps = conn.prepareStatement(DELETE_CLASS_BY_ID);
            ps.setString(1, classid);
            
            if (ps.execute()) {
                conn.rollback();
                System.out.println("--删除班级信息失败。");
            } else {
                System.out.println("--删除班级信息成功。");

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

}
