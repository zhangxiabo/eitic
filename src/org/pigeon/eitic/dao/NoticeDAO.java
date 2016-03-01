package org.pigeon.eitic.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.pigeon.eitic.connector.Connector;
import org.pigeon.eitic.vo.Notice;

public class NoticeDAO {
    
    private static final String INSERT_NOTICE = "insert into notice(ntitle,scope,ncontent,time) values(?,?,?,now())";
    private static final String GET_NOTICE_LIST = "select noticeid,ntitle,scope,time from notice where scope = ? order by noticeid desc limit ?,?";
    private static final String GET_NOTICE_BY_ID = "select * from notice where noticeid=?";
    
    private Connector connector;
    
    public NoticeDAO() {
        this.connector = new Connector();
    }

    /**
     * 向notice表中插入新数据
     * @param notice 通知对象
     * @throws Exception
     */
    public void insert(Notice notice) throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = this.connector.getConnection();
            conn.setAutoCommit(false);
            
            ps = conn.prepareStatement(INSERT_NOTICE);
            
            ps.setString(1, notice.getNtitle());
            ps.setString(2, notice.getScope());
            ps.setString(3, notice.getNcontent());
            
            if (ps.execute()) {
                conn.rollback();
                System.out.println("--更新通知信息失败。");
            } else {
                System.out.println("--更新通知信息成功。");

                conn.commit();
                conn.setAutoCommit(true);
            }

        } catch (SQLException e) {
            throw new Exception(e);
        } finally {
            connector.closePreparedStatement(ps);
            connector.closeConnection(conn);
        }
    }

    /**
     * 分页显示通知列表
     * @param i 从第几项开始
     * @param j 每页的行数
     * @param scope 通知的范围（校级，院级）
     * @return
     * @throws SQLException 
     */
    public List<Notice> getNoticeList(int i, int j, String scope) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<Notice> noticeList = new ArrayList<Notice>();
        
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(GET_NOTICE_LIST);
            ps.setString(1, scope);
            ps.setInt(2, i);
            ps.setInt(3, j);

            rs = ps.executeQuery();

            while (rs.next()) {
                Notice notice = new Notice();
                notice.setNoticeid(rs.getInt("noticeid"));
                notice.setNtitle(rs.getString("ntitle"));
                notice.setScope(rs.getString("scope"));
                notice.setTime(rs.getDate("time").toString() + " " + rs.getTime("time").toString());
                
                noticeList.add(notice);
            }
            System.out.println("--获取通知列表成功。");

        } catch (SQLException e){
            System.out.println("--获取通知列表失败。");
            throw new SQLException(e);
        } finally {
            this.connector.closeResultSet(rs);
            this.connector.closePreparedStatement(ps);
            this.connector.closeConnection(conn);
        }
        return noticeList;
    }

    public Notice getNoticeById(int id) throws SQLException {
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Notice notice = null;
        
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(GET_NOTICE_BY_ID);
            ps.setInt(1, id);

            rs = ps.executeQuery();

            if (rs.next()) {
                notice = new Notice(rs.getInt("noticeid"), rs.getString("ntitle"), 
                                    rs.getString("scope"), rs.getString("ncontent"), 
                                    rs.getDate("time").toString() + " " + rs.getTime("time").toString());
                System.out.println("--获取通知全文信息。");
                
            } else {
                System.out.println("--获取通知全文信息失败。");
                return notice;
            }

        } catch (SQLException e){
            throw new SQLException(e);
        } finally {
            this.connector.closeResultSet(rs);
            this.connector.closePreparedStatement(ps);
            this.connector.closeConnection(conn);
        }
        return notice;
        
    }
        
}
