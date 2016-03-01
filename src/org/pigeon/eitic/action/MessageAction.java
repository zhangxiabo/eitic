package org.pigeon.eitic.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.List;
import java.util.Random;

import org.apache.struts2.ServletActionContext;
import org.pigeon.eitic.constants.BaseUnit;
import org.pigeon.eitic.dao.MessageDAO;
import org.pigeon.eitic.dao.TaskDAO;
import org.pigeon.eitic.dao.UserDAO;
import org.pigeon.eitic.vo.Message;
import org.pigeon.eitic.vo.Task;
import org.pigeon.eitic.vo.User;

import com.opensymphony.xwork2.ActionSupport;

public class MessageAction extends ActionSupport{

    private static final long serialVersionUID = -7068584475342566206L;
    private static final int BUFFER_SIZE = 16 * 1024;
    
    private File attach;
    private String attachFileName;
    private String newattachName;
    private String attachContentType;
    private String savePath;
    
    private String messtitle;
    private String mystus;
    private String messcontent;
    private String messageid;
    
    private Message mess;   //用户发送的短信息
    private String fromname;  //发件人姓名
    private String toname;    //收件人姓名
    
    private String message;  //提示信息
    
    private List<User> students = null;
    private List<Message> inbox = null;
    private List<Message> outbox = null;
    
    
    public String sendMessage(){
        
        User user = BaseUnit.getLoginUser();
        MessageDAO messDao = new MessageDAO();
        TaskDAO taskDao = new TaskDAO();
        
        String fromid = user.getUsername();;
        String toid = "";
        
        try {
            if("student".equals(user.getRole())){
                toid = taskDao.getTeaidByStuid(user.getUsername());
            } else if ("teacher".equals(user.getRole())){
                toid = mystus;
            }
            
            if(attach == null){
                messDao.insertMess(fromid, toid, messtitle, messcontent);
            } else {
                //文件名后缀
                String suffix = attachFileName.split("\\.")[attachFileName.split("\\.").length - 1];
                //随机生成的纯数字文件名
                newattachName = BaseUnit.getLoginUser().getUsername() + "-" + new Random().nextInt(999999) + "." + suffix;
                
                String dstPath = ServletActionContext.getServletContext().getRealPath(this.getSavePath())
                                    + "/" + newattachName;
                
                File dstFile = new File(dstPath);
                copy(attach, dstFile);
                
                messDao.insertMess(fromid, toid, messtitle, messcontent, attachFileName, newattachName);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            message = "获取专业列表失败";
            return "notexist";
        }
        
        message = "发送信息成功！";
        return "success";
    }
    
    public String toMessagePage(){
        User user = BaseUnit.getLoginUser();
        MessageDAO messDao = new MessageDAO();
        TaskDAO taskDao = new TaskDAO();
        
        try {
            Task task = taskDao.getTaskByUsername(user.getUsername());
            if ("student".equals(user.getRole()) && task == null){
                message = "还没有申请课题，请查看选题信息";
                return "success";
            }
            if ("teacher".equals(user.getRole()) && taskDao.getStudentNum(user.getUsername()) <= 0) {
                message = "还没有学生申请课题";
                return "success";
            }
            
            inbox = messDao.getInbox(user.getUsername());
            outbox = messDao.getOutbox(user.getUsername());
        } catch (SQLException e) {
            e.printStackTrace();
            message = "系统错误";
            return "notexist";
        }
        
        return "messagePage";
    }
    
    
    public String toSendPage(){
        User user = BaseUnit.getLoginUser();
        UserDAO userDao = new UserDAO();
        
        try {
            if("teacher".equals(user.getRole())){
                students = userDao.getStusByTeaid(user.getUsername());
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            message = "获取导师所带学生列表失败";
            return "notexist";
        }
        
        return "success";
    }
    
    
    public String messageDetail(){
        MessageDAO messDao = new MessageDAO();
        UserDAO userDao = new UserDAO();
        try {
            mess = messDao.getMessageByID(messageid);
            fromname = userDao.getUserByName(mess.getFromid()).getRealname();
            toname = userDao.getUserByName(mess.getToid()).getRealname();
        } catch (SQLException e) {
            e.printStackTrace();
            message = "获取消息列表失败";
            return "notexist";
        }
        
        return "success";
    }
    
    public String deleteMessage(){
        MessageDAO messageDao = new MessageDAO();
        try {
            messageDao.deleteMessage(messageid);
        } catch (SQLException e) {
            e.printStackTrace();
            message = "系统错误";
            return "notexist";
        }
        
        message = "删除消息成功！";
        return "success";
    }
    
    
    public static void copy(File src, File dst){
        InputStream in = null ; 
        OutputStream out = null ; 
        try { 
            in = new BufferedInputStream( new FileInputStream(src), BUFFER_SIZE ); 
            out = new BufferedOutputStream( new FileOutputStream(dst), 
                    BUFFER_SIZE ); 
            byte [] buffer = new byte [ BUFFER_SIZE ]; 
            int len = 0; 
            while ((len = in.read(buffer)) > 0) { 
                out.write(buffer, 0, len); 
            } 
        } catch (Exception e) { 
            e.printStackTrace(); 
        } finally { 
            if ( null != in) { 
                try { 
                    in.close(); 
                } catch (IOException e) { 
                    e.printStackTrace(); 
                } 
            } 
            if ( null != out) { 
                try { 
                    out.close(); 
                } catch (IOException e) { 
                    e.printStackTrace(); 
                } 
            } 
        } 
        
    }
    


    public File getAttach() {
        return attach;
    }


    public void setAttach(File attach) {
        this.attach = attach;
    }


    public String getAttachFileName() {
        return attachFileName;
    }


    public void setAttachFileName(String attachFileName) {
        this.attachFileName = attachFileName;
    }


    public String getNewattachName() {
        return newattachName;
    }


    public void setNewattachName(String newattachName) {
        this.newattachName = newattachName;
    }


    public String getAttachContentType() {
        return attachContentType;
    }


    public void setAttachContentType(String attachContentType) {
        this.attachContentType = attachContentType;
    }


    public String getMesstitle() {
        return messtitle;
    }
    public void setMesstitle(String messtitle) {
        this.messtitle = messtitle;
    }
    
    public String getMystus() {
        return mystus;
    }

    public void setMystus(String mystus) {
        this.mystus = mystus;
    }

    public String getMesscontent() {
        return messcontent;
    }
    public void setMesscontent(String messcontent) {
        this.messcontent = messcontent;
    }

    public String getSavePath() {
        return savePath;
    }

    public void setSavePath(String savePath) {
        this.savePath = savePath;
    }


    public String getMessage() {
        return message;
    }


    public void setMessage(String message) {
        this.message = message;
    }

    public List<User> getStudents() {
        return students;
    }

    public void setStudents(List<User> students) {
        this.students = students;
    }

    public List<Message> getInbox() {
        return inbox;
    }

    public void setInbox(List<Message> inbox) {
        this.inbox = inbox;
    }

    public List<Message> getOutbox() {
        return outbox;
    }

    public void setOutbox(List<Message> outbox) {
        this.outbox = outbox;
    }

    public String getMessageid() {
        return messageid;
    }

    public void setMessageid(String messageid) {
        this.messageid = messageid;
    }

    public Message getMess() {
        return mess;
    }

    public void setMess(Message mess) {
        this.mess = mess;
    }

    public String getFromname() {
        return fromname;
    }

    public void setFromname(String fromname) {
        this.fromname = fromname;
    }

    public String getToname() {
        return toname;
    }

    public void setToname(String toname) {
        this.toname = toname;
    }
    
}
