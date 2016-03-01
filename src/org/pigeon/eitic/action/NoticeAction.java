package org.pigeon.eitic.action;

import java.sql.SQLException;
import java.util.List;

import org.pigeon.eitic.constants.BaseUnit;
import org.pigeon.eitic.dao.NoticeDAO;
import org.pigeon.eitic.vo.Notice;
import org.pigeon.eitic.vo.User;

public class NoticeAction {
    
    private String message;
    
    private Notice notice;
    private String ntitle;
    private String ncontent;
    
    private int id;  //查看通知是所使用的ID
    private String scope; //查看校级（院级）通知列表时使用的参数
    private List<Notice> notices = null;  //首页通知列表
    
    public String submitNotice(){
        
        User user = BaseUnit.getLoginUser();
        if("sysadmin".equalsIgnoreCase(user.getRole())){
            notice = new Notice(ntitle, "all", ncontent);
        } else {
            notice = new Notice(ntitle, user.getCollegeid(), ncontent);
        }
        
        NoticeDAO noticeDao = new NoticeDAO();
        try {
            noticeDao.insert(notice);
        } catch (Exception e) {
            e.printStackTrace();
            message = "发布通知失败";
            return "notexist";
        }
        
        message = "发布通知成功";
        return "success";
    }
    
    public String viewNotice(){
        NoticeDAO noticeDao = new NoticeDAO();
        try {
            notice = noticeDao.getNoticeById(id);
            return "success";
        } catch (SQLException e) {
            e.printStackTrace();
            message = "查看通知内容失败。";
            return "notexist";
        }
    }
    
    public String moreNotice(){
        NoticeDAO noticeDao = new NoticeDAO();
        try {
            notices = noticeDao.getNoticeList(0,100,scope);
        } catch (SQLException e) {
            e.printStackTrace();
            message = "系统错误";
            return "notexist";
        }
        
        return "success";
    }
    
    public String notexist(){
        return "notexist";
    }
    
    public Notice getNotice() {
        return notice;
    }

    public void setNotice(Notice notice) {
        this.notice = notice;
    }

    public String getNtitle() {
        return ntitle;
    }

    public void setNtitle(String ntitle) {
        this.ntitle = ntitle;
    }

    public String getNcontent() {
        return ncontent;
    }

    public void setNcontent(String ncontent) {
        this.ncontent = ncontent;
    }


    public String getMessage() {
        return message;
    }


    public void setMessage(String message) {
        this.message = message;
    }


    public int getId() {
        return id;
    }


    public void setId(int id) {
        this.id = id;
    }

    public String getScope() {
        return scope;
    }

    public void setScope(String scope) {
        this.scope = scope;
    }

    public List<Notice> getNotices() {
        return notices;
    }

    public void setNotices(List<Notice> notices) {
        this.notices = notices;
    }
    
}
