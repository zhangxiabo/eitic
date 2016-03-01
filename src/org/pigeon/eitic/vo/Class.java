package org.pigeon.eitic.vo;

public class Class {
    private String classid;
    private String cname;
    private String deptid;
    
    public Class() {
        super();
    }

    public Class(String classid, String cname, String deptid) {
        super();
        this.classid = classid;
        this.cname = cname;
        this.deptid = deptid;
    }
    
    public String getClassid() {
        return classid;
    }
    public void setClassid(String classid) {
        this.classid = classid;
    }
    public String getCname() {
        return cname;
    }
    public void setCname(String cname) {
        this.cname = cname;
    }
    public String getDeptid() {
        return deptid;
    }
    public void setDeptid(String deptid) {
        this.deptid = deptid;
    }
    
}
