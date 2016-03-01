package org.pigeon.eitic.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.pigeon.eitic.connector.Connector;
import org.pigeon.eitic.vo.College;

public class CollegeDAO {
    
    private static final String GET_COLLEGE_LIST = "select * from college";
    private static final String GET_COLLEGE_NAME_BY_ID = "select cname from college where collegeid=?";
    private static final String INSERT_NEW_COLLEGE = "insert into college values(?,?)";
    private static final String DELETE_COLLEGE_BY_ID = "delete from college where collegeid=?";
    private static final String COLLEGE_IS_EXIST = "select count(*) from college where collegeid=?";
    
    private Connector connector;
    
    public CollegeDAO() {
        this.connector = new Connector();
    }

    public List<College> getAllColleges() throws SQLException {
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        List<College> collegeList = new ArrayList<College>();
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(GET_COLLEGE_LIST);

            rs = ps.executeQuery();

            while (rs.next()) {
                College c = new College(rs.getString("collegeid"),rs.getString("cname"));
                collegeList.add(c);
            }
            System.out.println("--获取学院列表成功。");

        } catch (SQLException e){
            System.out.println("--获取学院列表失败。");
            throw new SQLException(e);
        } finally {
            this.connector.closeResultSet(rs);
            this.connector.closePreparedStatement(ps);
            this.connector.closeConnection(conn);
        }
        
        return collegeList;
    }

    public String getNameById(String collegeid) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(GET_COLLEGE_NAME_BY_ID);
            ps.setString(1, collegeid);

            rs = ps.executeQuery();

            if (rs.next()) {
                System.out.println("--获取学院名成功");
                return rs.getString("cname");
            } else {
                System.out.println("--获取学院名失败");
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

    public void insertCollege(String collegeid, String collname) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = this.connector.getConnection();
            conn.setAutoCommit(false);

            ps = conn.prepareStatement(INSERT_NEW_COLLEGE);
            ps.setString(1, collegeid);
            ps.setString(2, collname);
            
            if (ps.execute()) {
                conn.rollback();
                System.out.println("--插入学院信息失败。");
            } else {
                System.out.println("--插入学院信息成功。");

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

    public void deleteCollegeByID(String collegeid) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = this.connector.getConnection();
            conn.setAutoCommit(false);

            ps = conn.prepareStatement(DELETE_COLLEGE_BY_ID);
            ps.setString(1, collegeid);
            
            if (ps.execute()) {
                conn.rollback();
                System.out.println("--删除学院信息失败。");
            } else {
                System.out.println("--删除学院信息成功。");

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

    public boolean isExist(String collegeid) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(COLLEGE_IS_EXIST);
            ps.setString(1, collegeid);

            rs = ps.executeQuery();

            rs.next();
            if (rs.getInt(1) == 1) {
                System.out.println("此学院编号已存在");
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

}
