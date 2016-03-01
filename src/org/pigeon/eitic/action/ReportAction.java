package org.pigeon.eitic.action;

import java.sql.SQLException;

import org.pigeon.eitic.constants.BaseUnit;
import org.pigeon.eitic.dao.ReportDAO;
import org.pigeon.eitic.dao.TaskDAO;
import org.pigeon.eitic.vo.Report;
import org.pigeon.eitic.vo.Task;

/**
 * @author pigeon
 *
 */
public class ReportAction {
    
    private String message;
    
    private String taskid;
    private Task task = null;
    private Report report = null;
    
    private String overview;
    private String goal;
    private String method;
    private String innovation;
    private String progress;
    private String requirement;
    
    public String toReportPage(){
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
    
    public String subReprot(){
        ReportDAO reportDao = new ReportDAO();
        TaskDAO taskDao = new TaskDAO();
        try {
            reportDao.insertReport(taskid, overview, goal, method, innovation, progress, requirement);
            taskDao.updateStatus(taskid, "6");  //修改课题状态
        } catch (SQLException e) {
            e.printStackTrace();
            message = "系统错误";
            return "notexist";
        }
        message = "提交开题报告成功！";
        return "success";
    }
    
    public String viewReprot(){
        TaskDAO taskDao = new TaskDAO();
        ReportDAO reportDao = new ReportDAO();
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
            
            report = reportDao.getReportByTaskid(task.getTaskid());
            
            if(report == null){
                message = "开题报告还未提交，请查看选题信息";
                return "success";
            } else {
                return "viewreport";
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

    public Report getReport() {
        return report;
    }

    public void setReport(Report report) {
        this.report = report;
    }

    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    public String getGoal() {
        return goal;
    }

    public void setGoal(String goal) {
        this.goal = goal;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getInnovation() {
        return innovation;
    }

    public void setInnovation(String innovation) {
        this.innovation = innovation;
    }

    public String getProgress() {
        return progress;
    }

    public void setProgress(String progress) {
        this.progress = progress;
    }

    public String getRequirement() {
        return requirement;
    }

    public void setRequirement(String requirement) {
        this.requirement = requirement;
    }
    
    
}
