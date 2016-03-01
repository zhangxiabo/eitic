package org.pigeon.eitic.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.pigeon.eitic.connector.Connector;

public class DeptDAO {
    
    private static final String GET_DEPTS_LIST = "select * from dept where collegeid=?";
    private static final String GET_DEPT_NAME_BY_ID = "select dname from dept where deptid=?";
    private static final String DEPT_IS_EXIST = "select count(*) from dept where deptid=?";
    private static final String INSERT_NEW_DEPT = "insert into dept values(?,?,?)";
    private static final String DELETE_DELETE_BY_ID = "delete from dept where deptid=?";
    
    private Connector connector;
    
    public DeptDAO() {
        this.connector = new Connector();
    }

    public StringBuffer getDeptsByCollegeidForAjax(String collegeid) {
        
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer sb = new StringBuffer();

        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(GET_DEPTS_LIST);
            ps.setString(1, collegeid);

            rs = ps.executeQuery();
            
            while (rs.next()) {
                sb.append( rs.getString( "deptid" ) + ","
                        + rs.getString( "dname" ) );
                if ( !rs.isLast() ) sb.append( "|" );
            }
            System.out.println("--获取专业字符串成功。");

        } catch (SQLException e){
            System.out.println("--获取专业字符串失败。");
            e.printStackTrace();
        } finally {
            this.connector.closeResultSet(rs);
            this.connector.closePreparedStatement(ps);
            this.connector.closeConnection(conn);
        }
        
        return sb;
    }

    public String getNameById(String deptid) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(GET_DEPT_NAME_BY_ID);
            ps.setString(1, deptid);

            rs = ps.executeQuery();

            if (rs.next()) {
                System.out.println("--获取专业名成功");
                return rs.getString("dname");
            } else {
                System.out.println("--获取专业名失败");
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

    public boolean isExist(String deptid) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(DEPT_IS_EXIST);
            ps.setString(1, deptid);

            rs = ps.executeQuery();

            rs.next();
            if (rs.getInt(1) == 1) {
                System.out.println("此专业编号已存在");
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

    public void insertDept(String deptid, String dname, String collegeid) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = this.connector.getConnection();
            conn.setAutoCommit(false);

            ps = conn.prepareStatement(INSERT_NEW_DEPT);
            ps.setString(1, deptid);
            ps.setString(2, dname);
            ps.setString(3, collegeid);
            
            if (ps.execute()) {
                conn.rollback();
                System.out.println("--插入专业信息失败。");
            } else {
                System.out.println("--插入专业信息成功。");

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

    public void deleteDeptByID(String deptid) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = this.connector.getConnection();
            conn.setAutoCommit(false);

            ps = conn.prepareStatement(DELETE_DELETE_BY_ID);
            ps.setString(1, deptid);
            
            if (ps.execute()) {
                conn.rollback();
                System.out.println("--删除专业信息失败。");
            } else {
                System.out.println("--删除专业信息成功。");

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
