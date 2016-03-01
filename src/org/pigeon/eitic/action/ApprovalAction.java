package org.pigeon.eitic.action;

import java.sql.SQLException;
import java.util.List;

import org.pigeon.eitic.constants.BaseUnit;
import org.pigeon.eitic.dao.TaskDAO;
import org.pigeon.eitic.vo.Task;
import org.pigeon.eitic.vo.User;

public class ApprovalAction {

    private User user = null;
    private List<Task> approvalList = null;
    private List<Task> tasksoftea = null;
    private String message;
    
    private String taskid;  //待审批的课题ID
    private String status;  //审批课题状态
    
    public ApprovalAction(){
        user = BaseUnit.getLoginUser();
    }
    
    public String approvalList(){
        TaskDAO taskDao = new TaskDAO();
        try {
            
            if("teacher".equals(user.getRole())){
                approvalList = taskDao.getApprovalList(user.getUsername(), "1"); //教师审批列表
            } else if ("deptadmin".equals(user.getRole())){
                approvalList = taskDao.getDeptApprovalList(user.getCollegeid(), "3"); //学院审批列表
            }
        } catch (SQLException e) {
            e.printStackTrace();
            message = "系统错误";
            return "notexist";
        }
        
        return "success";
    }
    
    public String updateStatus(){
        TaskDAO taskDao = new TaskDAO();
        try {
            taskDao.updateStatus(taskid, status);
        } catch (SQLException e) {
            e.printStackTrace();
            message = "系统错误";
            return "notexist";
        }
        message = "操作成功";
        return "success";
    }
    
    public String getTasksOfTea(){
        TaskDAO taskDao = new TaskDAO();
        
        try {
            tasksoftea = taskDao.getAllTaskOfTea(user.getUsername());
        } catch (SQLException e) {
            e.printStackTrace();
            message = "系统错误";
            return "notexist";
        }
        
        return "success";
    }
    

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Task> getApprovalList() {
        return approvalList;
    }

    public void setApprovalList(List<Task> approvalList) {
        this.approvalList = approvalList;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTaskid() {
        return taskid;
    }

    public void setTaskid(String taskid) {
        this.taskid = taskid;
    }

    public List<Task> getTasksoftea() {
        return tasksoftea;
    }

    public void setTasksoftea(List<Task> tasksoftea) {
        this.tasksoftea = tasksoftea;
    }
    
}
