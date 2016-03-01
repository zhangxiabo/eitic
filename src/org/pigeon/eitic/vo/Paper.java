package org.pigeon.eitic.vo;

public class Paper {
    
    private String paperid;
    private String taskid;
    private String filename;
    private String newname;
    private String subtime;

    public Paper() {
        super();
    }
    public Paper(String paperid, String taskid, String filename,
            String newname, String subtime) {
        super();
        this.paperid = paperid;
        this.taskid = taskid;
        this.filename = filename;
        this.newname = newname;
        this.subtime = subtime;
    }
    public String getPaperid() {
        return paperid;
    }
    public void setPaperid(String paperid) {
        this.paperid = paperid;
    }
    public String getTaskid() {
        return taskid;
    }
    public void setTaskid(String taskid) {
        this.taskid = taskid;
    }
    public String getFilename() {
        return filename;
    }
    public void setFilename(String filename) {
        this.filename = filename;
    }
    public String getNewname() {
        return newname;
    }
    public void setNewname(String newname) {
        this.newname = newname;
    }
    public String getSubtime() {
        return subtime;
    }
    public void setSubtime(String subtime) {
        this.subtime = subtime;
    }
    
}
