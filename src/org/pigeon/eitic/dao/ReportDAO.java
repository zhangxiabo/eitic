package org.pigeon.eitic.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.pigeon.eitic.connector.Connector;
import org.pigeon.eitic.vo.Report;

public class ReportDAO {

    private static final String INSERT_NEW_REPORT = "insert into report(taskid,overview,goal,method,innovation,progress,requirement,subtime) values(?,?,?,?,?,?,?,now())";
    private static final String GET_REPORT_BY_TASKID = "select * from report where taskid=?";
    
    private Connector connector;
    
    public ReportDAO() {
        this.connector = new Connector();
    }

    public void insertReport(String taskid, String overview, String goal,
            String method, String innovation, String progress, String requirement) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = this.connector.getConnection();
            conn.setAutoCommit(false);

            ps = conn.prepareStatement(INSERT_NEW_REPORT);
            ps.setString(1, taskid);
            ps.setString(2, overview);
            ps.setString(3, goal);
            ps.setString(4, method);
            ps.setString(5, innovation);
            ps.setString(6, progress);
            ps.setString(7, requirement);
            
            if (ps.execute()) {
                conn.rollback();
                System.out.println("--插入开题报告失败。");
            } else {
                System.out.println("--插入开题报告成功。");

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

    public Report getReportByTaskid(String taskid) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Report report = null;
        
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(GET_REPORT_BY_TASKID);
            ps.setString(1, taskid);

            rs = ps.executeQuery();
            if (rs.next()) {
                report = new Report();
                report.setReportid(rs.getString("reportid"));
                report.setTaskid(rs.getString("taskid"));
                report.setOverview(rs.getString("overview"));
                report.setGoal(rs.getString("goal"));
                report.setMethod(rs.getString("method"));
                report.setInnovation(rs.getString("innovation"));
                report.setProgress(rs.getString("progress"));
                report.setRequirement(rs.getString("requirement"));
                report.setTeaopinion(rs.getString("teaopinion"));
                report.setDeptipinion(rs.getString("deptopinion"));
                report.setSubtime(rs.getDate("subtime").toString() + " " + rs.getTime("subtime").toString());
                
                System.out.println("--获取开题报告信息。");
                
            } else {
                return report;
            }

        } catch (SQLException e){
            throw new SQLException(e);
        } finally {
            this.connector.closeResultSet(rs);
            this.connector.closePreparedStatement(ps);
            this.connector.closeConnection(conn);
        }
        return report;
    }
    
}
