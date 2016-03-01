package org.pigeon.eitic.action;

import java.sql.SQLException;

import org.pigeon.eitic.constants.BaseUnit;
import org.pigeon.eitic.dao.InspectionDAO;
import org.pigeon.eitic.dao.TaskDAO;
import org.pigeon.eitic.vo.Inspection;
import org.pigeon.eitic.vo.Task;

public class InspectAction {
    
    private String message;
    
    private String taskid;
    private Task task;
    private Inspection inspect;
    
    private String progress;
    private String problem;
    
    public String toInspectPage(){
        TaskDAO taskDao = new TaskDAO();
        try {
            task = taskDao.getTaskByID(taskid);
        } catch (SQLException e) {
            e.printStackTrace();
            message = "系统错误";
            return "notexist";
        }
        return "success";
    }
    
    public String subInspect(){
        InspectionDAO iDao = new InspectionDAO();
        TaskDAO taskDao = new TaskDAO();
        try {
            iDao.insertInspection(taskid, progress, problem);
            taskDao.updateStatus(taskid, "7");  //修改课题状态
        } catch (SQLException e) {
            e.printStackTrace();
            message = "系统错误";
            return "notexist";
        }
        
        message = "提交中期检查成功！";
        return "success";
    }

    public String viewInspect(){
        TaskDAO taskDao = new TaskDAO();
        InspectionDAO inpectDao = new InspectionDAO();
        try {
            if (taskid == "" || taskid == null) {
                task = taskDao.getTaskByUsername(BaseUnit.getLoginUser().getUsername());
            } else {
                task = taskDao.getTaskByID(taskid);
            }
            
            if (task == null){
                message = "还没有申请课题，请查看选题信息";
                return "success";
            }
            
            inspect = inpectDao.getInspectByTaskid(task.getTaskid());
            
            if(inspect == null){
                message = "中期检查还未提交，请查看选题信息";
                return "success";
            } else {
                return "viewinspect";
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            message = "系统错误";
            return "notexist";
        }
    }
    
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getTaskid() {
        return taskid;
    }

    public void setTaskid(String taskid) {
        this.taskid = taskid;
    }

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }
    
    public Inspection getInspect() {
        return inspect;
    }

    public void setInspect(Inspection inspect) {
        this.inspect = inspect;
    }

    public String getProgress() {
        return progress;
    }

    public void setProgress(String progress) {
        this.progress = progress;
    }

    public String getProblem() {
        return problem;
    }

    public void setProblem(String problem) {
        this.problem = problem;
    }
    
}
