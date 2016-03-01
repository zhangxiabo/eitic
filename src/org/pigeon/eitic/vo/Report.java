package org.pigeon.eitic.vo;

public class Report {
    
    private String reportid;
    private String taskid;
    
    private String overview;
    private String goal;
    private String method;
    private String innovation;
    private String progress;
    private String requirement;
    
    private String teaopinion;
    private String deptipinion;
    private String subtime;
    
    public Report() {
        super();
    }
    
    public Report(String reportid, String taskid, String overview, String goal,
            String method, String innovation, String progress,
            String requirement, String teaopinion, String deptipinion,
            String subtime) {
        super();
        this.reportid = reportid;
        this.taskid = taskid;
        this.overview = overview;
        this.goal = goal;
        this.method = method;
        this.innovation = innovation;
        this.progress = progress;
        this.requirement = requirement;
        this.teaopinion = teaopinion;
        this.deptipinion = deptipinion;
        this.subtime = subtime;
    }

    public String getReportid() {
        return reportid;
    }
    public void setReportid(String reportid) {
        this.reportid = reportid;
    }
    public String getTaskid() {
        return taskid;
    }
    public void setTaskid(String taskid) {
        this.taskid = taskid;
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

    public String getTeaopinion() {
        return teaopinion;
    }
    public void setTeaopinion(String teaopinion) {
        this.teaopinion = teaopinion;
    }
    public String getDeptipinion() {
        return deptipinion;
    }
    public void setDeptipinion(String deptipinion) {
        this.deptipinion = deptipinion;
    }
    public String getSubtime() {
        return subtime;
    }
    public void setSubtime(String subtime) {
        this.subtime = subtime;
    }
    
}
