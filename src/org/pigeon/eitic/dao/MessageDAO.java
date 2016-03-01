package org.pigeon.eitic.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.pigeon.eitic.connector.Connector;
import org.pigeon.eitic.vo.Message;

public class MessageDAO {
    
    public static final String INSERT_NEW_MESSAGE_WITHOUT_ATTACHMENT = "insert into message(fromid,toid,title,content,subtime) values(?,?,?,?,now())";
    public static final String INSERT_NEW_MESSAGE_WITH_ATTACHMENT = "insert into message(fromid,toid,title,content,filename,newname,subtime) values(?,?,?,?,?,?,now())";
    public static final String GET_INBOX_MESSAGELIST = "select * from message where toid=?";
    public static final String GET_OUTBOX_MESSAGELIST = "select * from message where fromid=?";
    public static final String GET_MESSAGE_BY_ID = "select * from message where messageid=?";
    public static final String DELETE_MESSAGE_BY_ID = "delete from message where messageid=?";
    
    private Connector connector;
    
    public MessageDAO() {
        this.connector = new Connector();
    }

    public void insertMess(String fromid, String toid, String messtitle,
            String messcontent) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = this.connector.getConnection();
            conn.setAutoCommit(false);

            ps = conn.prepareStatement(INSERT_NEW_MESSAGE_WITHOUT_ATTACHMENT);
            ps.setString(1, fromid);
            ps.setString(2, toid);
            ps.setString(3, messtitle);
            ps.setString(4, messcontent);
            
            if (ps.execute()) {
                conn.rollback();
                System.out.println("--插入消息失败。");
            } else {
                System.out.println("--插入消息成功。");

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

    public void insertMess(String fromid, String toid, String messtitle,
            String messcontent, String attachFileName,
            String newattachName) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = this.connector.getConnection();
            conn.setAutoCommit(false);

            ps = conn.prepareStatement(INSERT_NEW_MESSAGE_WITH_ATTACHMENT);
            ps.setString(1, fromid);
            ps.setString(2, toid);
            ps.setString(3, messtitle);
            ps.setString(4, messcontent);
            ps.setString(5, attachFileName);
            ps.setString(6, newattachName);
            
            if (ps.execute()) {
                conn.rollback();
                System.out.println("--插入消息失败。");
            } else {
                System.out.println("--插入消息成功。");

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

    public List<Message> getInbox(String username) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        List<Message> messages = new ArrayList<Message>();
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(GET_INBOX_MESSAGELIST);
            ps.setString(1, username);
            
            rs = ps.executeQuery();

            while (rs.next()) {
                Message message = new Message(rs.getString("messageid"), rs.getString("fromid"), rs.getString("toid"),
                                            rs.getString ("title"), rs.getString("content"), rs.getString("filename"), 
                                            rs.getString ("newname"), rs.getDate("subtime").toString() + " " + rs.getTime("subtime").toString());
                messages.add(message);
            }
            System.out.println("--获取收件箱列表成功。");

        } catch (SQLException e){
            System.out.println("--获取收件箱列表失败。");
            throw new SQLException(e);
        } finally {
            this.connector.closeResultSet(rs);
            this.connector.closePreparedStatement(ps);
            this.connector.closeConnection(conn);
        }
        
        return messages;
    }

    public List<Message> getOutbox(String username) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        List<Message> messages = new ArrayList<Message>();
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(GET_OUTBOX_MESSAGELIST);
            ps.setString(1, username);
            
            rs = ps.executeQuery();

            while (rs.next()) {
                Message message = new Message(rs.getString("messageid"), rs.getString("fromid"), rs.getString("toid"),
                                            rs.getString ("title"), rs.getString("content"), rs.getString("filename"), 
                                            rs.getString ("newname"), rs.getDate("subtime").toString() + " " + rs.getTime("subtime").toString());
                messages.add(message);
            }
            System.out.println("--获取发件箱列表成功。");

        } catch (SQLException e){
            System.out.println("--获取发件箱列表失败。");
            throw new SQLException(e);
        } finally {
            this.connector.closeResultSet(rs);
            this.connector.closePreparedStatement(ps);
            this.connector.closeConnection(conn);
        }
        
        return messages;
    }

    public Message getMessageByID(String messageid) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Message message = null;
        
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(GET_MESSAGE_BY_ID);
            ps.setString(1, messageid);

            rs = ps.executeQuery();

            if (rs.next()) {
                message = new Message(rs.getString("messageid"), rs.getString("fromid"), rs.getString("toid"),
                        rs.getString ("title"), rs.getString("content"), rs.getString("filename"), 
                        rs.getString ("newname"), rs.getDate("subtime").toString() + " " + rs.getTime("subtime").toString());
                
            } else {
                return message;
            }

        } catch (SQLException e){
            throw new SQLException(e);
        } finally {
            this.connector.closeResultSet(rs);
            this.connector.closePreparedStatement(ps);
            this.connector.closeConnection(conn);
        }
        return message;
    }

    public void deleteMessage(String messageid) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = this.connector.getConnection();
            conn.setAutoCommit(false);

            ps = conn.prepareStatement(DELETE_MESSAGE_BY_ID);
            ps.setString(1, messageid);
            
            if (ps.execute()) {
                conn.rollback();
                System.out.println("--删除消息失败。");
            } else {
                System.out.println("--删除消息成功。");

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
