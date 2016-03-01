package org.pigeon.eitic.vo;

public class Message {
    
    private String messageid;
    private String fromid;
    private String toid;
    
    private String title;
    private String content;
    
    private String filename;  //上传文件名
    private String newname;   //上传文件所对应的数字名称
    private String subtime;
    
    
    public Message() {
        super();
    }
    
    public Message(String messageid, String fromid, String toid, String title,
            String content, String filename, String newname, String subtime) {
        super();
        this.messageid = messageid;
        this.fromid = fromid;
        this.toid = toid;
        this.title = title;
        this.content = content;
        this.filename = filename;
        this.newname = newname;
        this.subtime = subtime;
    }
    public String getMessageid() {
        return messageid;
    }
    public void setMessageid(String messageid) {
        this.messageid = messageid;
    }
    public String getFromid() {
        return fromid;
    }
    public void setFromid(String fromid) {
        this.fromid = fromid;
    }
    public String getToid() {
        return toid;
    }
    public void setToid(String toid) {
        this.toid = toid;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
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
