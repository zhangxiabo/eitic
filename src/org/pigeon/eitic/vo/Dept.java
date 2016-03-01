package org.pigeon.eitic.vo;

public class Dept {
    private String deptid;
    private String dname;
    private String collegeid;
    
    public Dept() {
        super();
    }
    public Dept(String deptid, String dname, String collegeid) {
        super();
        this.deptid = deptid;
        this.dname = dname;
        this.collegeid = collegeid;
    }
    public String getDeptid() {
        return deptid;
    }
    public void setDeptid(String deptid) {
        this.deptid = deptid;
    }
    public String getDname() {
        return dname;
    }
    public void setDname(String dname) {
        this.dname = dname;
    }
    public String getCollegeid() {
        return collegeid;
    }
    public void setCollegeid(String collegeid) {
        this.collegeid = collegeid;
    }
    
}
