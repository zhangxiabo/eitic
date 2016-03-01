package org.pigeon.eitic.vo;

import java.io.Serializable;

public class Notice implements Serializable{
    
    private static final long serialVersionUID = -2021952796058251952L;
    private int noticeid;
    private String ntitle;
    private String scope;
    private String ncontent;
    private String time;
    
    public Notice() {
        super();
    }
    
    public Notice(String ntitle, String scope, String ncontent) {
        super();
        this.ntitle = ntitle;
        this.scope = scope;
        this.ncontent = ncontent;
    }

    public Notice(int noticeid, String ntitle, String scope, String ncontent,
            String time) {
        super();
        this.noticeid = noticeid;
        this.ntitle = ntitle;
        this.scope = scope;
        this.ncontent = ncontent;
        this.time = time;
    }
    
    public int getNoticeid() {
        return noticeid;
    }
    public void setNoticeid(int noticeid) {
        this.noticeid = noticeid;
    }
    public String getNtitle() {
        return ntitle;
    }
    public void setNtitle(String ntitle) {
        this.ntitle = ntitle;
    }
    public String getScope() {
        return scope;
    }
    public void setScope(String scope) {
        this.scope = scope;
    }
    public String getNcontent() {
        return ncontent;
    }
    public void setNcontent(String ncontent) {
        this.ncontent = ncontent;
    }
    public String getTime() {
        return time;
    }
    public void setTime(String time) {
        this.time = time;
    }
    
}
