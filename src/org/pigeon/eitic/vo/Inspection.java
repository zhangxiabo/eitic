package org.pigeon.eitic.vo;

public class Inspection {

    private String inspectionid;
    private String taskid;
    private String progress;
    private String problem;
    
    private String teaopinion;
    private String deptopinion;
    private String subtime;

    public Inspection() {
        super();
    }
    public Inspection(String inspectionid, String taskid, String progress,
            String problem, String teaopinion, String deptopinion,
            String subtime) {
        super();
        this.inspectionid = inspectionid;
        this.taskid = taskid;
        this.progress = progress;
        this.problem = problem;
        this.teaopinion = teaopinion;
        this.deptopinion = deptopinion;
        this.subtime = subtime;
    }
    public String getInspectionid() {
        return inspectionid;
    }
    public void setInspectionid(String inspectionid) {
        this.inspectionid = inspectionid;
    }
    public String getTaskid() {
        return taskid;
    }
    public void setTaskid(String taskid) {
        this.taskid = taskid;
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
    public String getTeaopinion() {
        return teaopinion;
    }
    public void setTeaopinion(String teaopinion) {
        this.teaopinion = teaopinion;
    }
    public String getDeptopinion() {
        return deptopinion;
    }
    public void setDeptopinion(String deptopinion) {
        this.deptopinion = deptopinion;
    }
    public String getSubtime() {
        return subtime;
    }
    public void setSubtime(String subtime) {
        this.subtime = subtime;
    }
    
}
