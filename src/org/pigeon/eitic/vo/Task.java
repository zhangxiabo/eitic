package org.pigeon.eitic.vo;

public class Task {

    private String taskid;
    private String title;
    private String summary;

    private String stuid;
    private String teaid;
    private String status;
    
    private String subtime;

    public Task() {
        super();
    }
    
    public Task(String taskid, String title, String summary, String stuid,
            String teaid, String status, String subtime) {
        super();
        this.taskid = taskid;
        this.title = title;
        this.summary = summary;
        this.stuid = stuid;
        this.teaid = teaid;
        this.status = status;
        this.subtime = subtime;
    }

    public String getTaskid() {
        return taskid;
    }

    public void setTaskid(String taskid) {
        this.taskid = taskid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getStuid() {
        return stuid;
    }

    public void setStuid(String stuid) {
        this.stuid = stuid;
    }

    public String getTeaid() {
        return teaid;
    }

    public void setTeaid(String teaid) {
        this.teaid = teaid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSubtime() {
        return subtime;
    }

    public void setSubtime(String subtime) {
        this.subtime = subtime;
    }
}
