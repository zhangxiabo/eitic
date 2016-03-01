package org.pigeon.eitic.vo;

public class College {
    
    private String collegeid;
    private String cname;
    
    public College() {
        super();
    }
    
    public College(String collegeid, String cname) {
        super();
        this.collegeid = collegeid;
        this.cname = cname;
    }
    
    public String getCollegeid() {
        return collegeid;
    }
    public void setCollegeid(String collegeid) {
        this.collegeid = collegeid;
    }
    public String getCname() {
        return cname;
    }
    public void setCname(String cname) {
        this.cname = cname;
    }
    
}
