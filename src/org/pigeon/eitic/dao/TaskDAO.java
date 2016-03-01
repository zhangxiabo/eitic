package org.pigeon.eitic.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.pigeon.eitic.connector.Connector;
import org.pigeon.eitic.vo.Task;

public class TaskDAO {
    
    private static final String INSERT_NEW_TASK = "insert into task(title,summary,stuid,teaid,status,subtime) values(?,?,?,?,'1',now())";
    private static final String TASK_IS_EXIST = "select count(*) from task where stuid=?";
    private static final String GET_TASK_BY_USERNAME = "select * from task where stuid=?";
    private static final String GET_APPROVAL_LIST = "select * from task where teaid=? and status=?";
    private static final String GET_TASK_BY_ID = "select * from task where taskid=?";
    private static final String UPDATE_TASK_STATUS = "update task set status=? where taskid=?";
    private static final String GET_DEPT_APPROVAL_LIST = "select * from task where stuid in(select username from user where collegeid=?) and status=?";
    private static final String GET_ALL_TASK_LIST_OF_TEACHER = "select * from task where teaid=? and status<>9";
    private static final String UPDATE_OLD_TASK ="update task set title=?,summary=?,status='1' where taskid=?";
    private static final String GET_TEACHERID_BY_STUDENTID = "select teaid from task where stuid=?";
    private static final String GET_STUDENT_NUMBER_BY_TEACHER_ID = "select count(*) from task where teaid=? and status<>9";
    private static final String TITLE_IS_EXIST = "select count(*) from task where title=?";
    
    private Connector connector;
    
    public TaskDAO() {
        this.connector = new Connector();
    }

    public void insertTask(String tasktitle, String username, String teaid,
            String summary) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = this.connector.getConnection();
            conn.setAutoCommit(false);

            ps = conn.prepareStatement(INSERT_NEW_TASK);
            ps.setString(1, tasktitle);
            ps.setString(2, summary);
            ps.setString(3, username);
            ps.setString(4, teaid);
            
            if (ps.execute()) {
                conn.rollback();
                System.out.println("--插入课题信息失败。");
            } else {
                System.out.println("--插入课题信息成功。");

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
            ps = conn.prepareStatement(TASK_IS_EXIST);
            ps.setString(1, username);

            rs = ps.executeQuery();

            rs.next();
            if (rs.getInt(1) == 1) {
                System.out.println("--此学生已提交课题");
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

    public Task getTaskByUsername(String username) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Task task = null;
        
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(GET_TASK_BY_USERNAME);
            ps.setString(1, username);

            rs = ps.executeQuery();

            if (rs.next()) {
                task = new Task(rs.getString("taskid"), rs.getString("title"), rs.getString("summary"), 
                                rs.getString("stuid"), rs.getString("teaid"),rs.getString("status"), 
                                rs.getDate("subtime").toString() + " " + rs.getTime("subtime").toString());
                System.out.println("--获取学生课题信息。");
                
            } else {
                System.out.println("--获取学生课题信息失败。");
                return task;
            }

        } catch (SQLException e){
            throw new SQLException(e);
        } finally {
            this.connector.closeResultSet(rs);
            this.connector.closePreparedStatement(ps);
            this.connector.closeConnection(conn);
        }
        return task;
    }

    public List<Task> getApprovalList(String username, String status) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<Task> approvalList = new ArrayList<Task>();
        
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(GET_APPROVAL_LIST);
            ps.setString(1, username);
            ps.setString(2, status);

            rs = ps.executeQuery();

            while (rs.next()) {
                Task task = new Task();
                
                task.setTaskid(rs.getString("taskid"));
                task.setTitle(rs.getString("title"));
                task.setSummary(rs.getString("stuid"));
                task.setTeaid(rs.getString("teaid"));
                task.setStatus(rs.getString("status"));
                task.setSubtime(rs.getDate("subtime").toString() + " " + rs.getTime("subtime").toString());
                
                approvalList.add(task);
            }
            System.out.println("--获取需要审批的列表成功。");

        } catch (SQLException e){
            System.out.println("--获取需要审批的列表失败。");
            throw new SQLException(e);
        } finally {
            this.connector.closeResultSet(rs);
            this.connector.closePreparedStatement(ps);
            this.connector.closeConnection(conn);
        }
        return approvalList;
    }
    
    public List<Task> getDeptApprovalList(String collegeid, String status) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<Task> approvalList = new ArrayList<Task>();
        
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(GET_DEPT_APPROVAL_LIST);
            ps.setString(1, collegeid);
            ps.setString(2, status);

            rs = ps.executeQuery();

            while (rs.next()) {
                Task task = new Task();
                
                task.setTaskid(rs.getString("taskid"));
                task.setTitle(rs.getString("title"));
                task.setSummary(rs.getString("stuid"));
                task.setTeaid(rs.getString("teaid"));
                task.setStatus(rs.getString("status"));
                task.setSubtime(rs.getDate("subtime").toString() + " " + rs.getTime("subtime").toString());
                
                approvalList.add(task);
            }
            System.out.println("--获取需要审批的列表成功。");

        } catch (SQLException e){
            System.out.println("--获取需要审批的列表失败。");
            throw new SQLException(e);
        } finally {
            this.connector.closeResultSet(rs);
            this.connector.closePreparedStatement(ps);
            this.connector.closeConnection(conn);
        }
        return approvalList;
    }

    public Task getTaskByID(String taskid) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Task task = null;
        
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(GET_TASK_BY_ID);
            ps.setString(1, taskid);

            rs = ps.executeQuery();

            if (rs.next()) {
                task = new Task(rs.getString("taskid"), rs.getString("title"), rs.getString("summary"), 
                                rs.getString("stuid"), rs.getString("teaid"),rs.getString("status"), 
                                rs.getDate("subtime").toString() + " " + rs.getTime("subtime").toString());
                System.out.println("--获取学生课题信息。");
                
            } else {
                return task;
            }

        } catch (SQLException e){
            throw new SQLException(e);
        } finally {
            this.connector.closeResultSet(rs);
            this.connector.closePreparedStatement(ps);
            this.connector.closeConnection(conn);
        }
        return task;
    }

    public void updateStatus(String taskid, String status) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = this.connector.getConnection();
            conn.setAutoCommit(false);

            ps = conn.prepareStatement(UPDATE_TASK_STATUS);
            ps.setString(1, status);
            ps.setString(2, taskid);
            
            if (ps.executeUpdate() != 1) {
                conn.rollback();
                System.out.println("--更新课题状态失败。");
            } else {
                System.out.println("--更新课题状态成功。");

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

    public List<Task> getAllTaskOfTea(String username) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<Task> taskList = new ArrayList<Task>();
        
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(GET_ALL_TASK_LIST_OF_TEACHER);
            ps.setString(1, username);

            rs = ps.executeQuery();

            while (rs.next()) {
                Task task = new Task();
                
                task.setTaskid(rs.getString("taskid"));
                task.setTitle(rs.getString("title"));
                task.setSummary(rs.getString("stuid"));
                task.setTeaid(rs.getString("teaid"));
                task.setStatus(rs.getString("status"));
                task.setSubtime(rs.getDate("subtime").toString() + " " + rs.getTime("subtime").toString());
                
                taskList.add(task);
            }
            System.out.println("--获取导师所有课题的列表成功。");

        } catch (SQLException e){
            System.out.println("--获取导师所有课题的列表失败。");
            throw new SQLException(e);
        } finally {
            this.connector.closeResultSet(rs);
            this.connector.closePreparedStatement(ps);
            this.connector.closeConnection(conn);
        }
        return taskList;
    }

    public void updateTask(String taskid, String tasktitle, String summary) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = this.connector.getConnection();
            conn.setAutoCommit(false);

            ps = conn.prepareStatement(UPDATE_OLD_TASK);
            ps.setString(1, tasktitle);
            ps.setString(2, summary);
            ps.setString(3, taskid);
            
            if (ps.executeUpdate() != 1) {
                conn.rollback();
                System.out.println("--更新课题信息失败。");
            } else {
                System.out.println("--更新课题信息成功。");

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

    public String getTeaidByStuid(String username) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String teaid = "";
        
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(GET_TEACHERID_BY_STUDENTID);
            ps.setString(1, username);

            rs = ps.executeQuery();

            if (rs.next()) {
                teaid = rs.getString("teaid");
            } else {
                return teaid;
            }

        } catch (SQLException e){
            throw new SQLException(e);
        } finally {
            this.connector.closeResultSet(rs);
            this.connector.closePreparedStatement(ps);
            this.connector.closeConnection(conn);
        }
        return teaid;
    }

    public int getStudentNum(String username) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(GET_STUDENT_NUMBER_BY_TEACHER_ID);
            ps.setString(1, username);

            rs = ps.executeQuery();

            rs.next();
            return rs.getInt(1);

        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            this.connector.closeResultSet(rs);
            this.connector.closePreparedStatement(ps);
            this.connector.closeConnection(conn);
        }
        return 0;
    }

    public boolean titleIsExist(String tasktitle) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = this.connector.getConnection();
            ps = conn.prepareStatement(TITLE_IS_EXIST);
            ps.setString(1, tasktitle);

            rs = ps.executeQuery();

            rs.next();
            if (rs.getInt(1) == 1) {
                System.out.println("--此课题题目已提交");
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
