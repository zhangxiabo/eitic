package org.pigeon.eitic.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.pigeon.eitic.connector.Connector;
import org.pigeon.eitic.vo.Inspection;

public class InspectionDAO {

    private static final String INSERT_NEW_INSPECTION = "insert into inspection(taskid,progress,problem,subtime) values(?,?,?,now())";
    private static final String GET_INSPECTION_BY_TASKID = "select * from inspection where taskid=?";
    
    private Connector connector;
    
    public InspectionDAO() {
        this.connector = new Connector();
    }
    
    
    public void insertInspection(String taskid, String progress, String problem) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = this.connector.getConnection();
            conn.setAutoCommit(false);

            ps = conn.prepareStatement(INSERT_NEW_INSPECTION);
            ps.setString(1, taskid);
            ps.setString(2, progress);
            ps.setString(3, problem);
            
            if (ps.execute()) {
                conn.rollback();
                System.out.println("--插入中期检查失败。");
            } else {
                System.out.println("--插入中期检查成功。");

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

    public Inspection getInspectByTaskid(String taskid) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Inspection inspect = null;
        
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(GET_INSPECTION_BY_TASKID);
            ps.setString(1, taskid);

            rs = ps.executeQuery();
            if (rs.next()) {
                inspect = new Inspection();
                inspect.setInspectionid(rs.getString("inspectionid"));
                inspect.setTaskid(rs.getString("taskid"));
                inspect.setProgress(rs.getString("progress"));
                inspect.setProblem(rs.getString("problem"));
                inspect.setTeaopinion(rs.getString("teaopinion"));
                inspect.setDeptopinion(rs.getString("deptopinion"));
                inspect.setSubtime(rs.getDate("subtime").toString() + " " + rs.getTime("subtime").toString());
                
                System.out.println("--获取中期检查信息。");
                
            } else {
                return inspect;
            }

        } catch (SQLException e){
            throw new SQLException(e);
        } finally {
            this.connector.closeResultSet(rs);
            this.connector.closePreparedStatement(ps);
            this.connector.closeConnection(conn);
        }
        return inspect;
    }

}
