package org.pigeon.eitic.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.pigeon.eitic.connector.Connector;
import org.pigeon.eitic.vo.Paper;

public class PaperDAO {

    private static final String INSERT_NEW_PAPER = "insert into paper(taskid,filename,newname,subtime) values(?,?,?,now())";
    private static final String GET_PAPER_BY_TASKID = "select * from paper where taskid=?";
    
    private Connector connector;
    
    public PaperDAO() {
        this.connector = new Connector();
    }
    
    
    public void insertPaper(String taskid, String paperFileName,
            String newPaperName) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = this.connector.getConnection();
            conn.setAutoCommit(false);

            ps = conn.prepareStatement(INSERT_NEW_PAPER);
            ps.setString(1, taskid);
            ps.setString(2, paperFileName);
            ps.setString(3, newPaperName);
            
            if (ps.execute()) {
                conn.rollback();
                System.out.println("--插入论文信息失败。");
            } else {
                System.out.println("--插入论文信息成功。");

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


    public Paper getPaperByTaskid(String taskid) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Paper paper = null;
        
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(GET_PAPER_BY_TASKID);
            ps.setString(1, taskid);

            rs = ps.executeQuery();
            if (rs.next()) {
                paper = new Paper();
                paper.setPaperid(rs.getString("paperid"));
                paper.setTaskid(rs.getString("taskid"));
                paper.setFilename(rs.getString("filename"));
                paper.setNewname(rs.getString("newname"));
                paper.setSubtime(rs.getDate("subtime").toString() + " " + rs.getTime("subtime").toString());
                
                System.out.println("--获取论文信息。");
                
            } else {
                return paper;
            }

        } catch (SQLException e){
            throw new SQLException(e);
        } finally {
            this.connector.closeResultSet(rs);
            this.connector.closePreparedStatement(ps);
            this.connector.closeConnection(conn);
        }
        return paper;
    }

}
