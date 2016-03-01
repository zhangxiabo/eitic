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
import java.util.Random;

import org.apache.struts2.ServletActionContext;
import org.pigeon.eitic.constants.BaseUnit;
import org.pigeon.eitic.dao.PaperDAO;
import org.pigeon.eitic.dao.TaskDAO;
import org.pigeon.eitic.vo.Paper;
import org.pigeon.eitic.vo.Task;

import com.opensymphony.xwork2.ActionSupport;


public class UploadAction extends ActionSupport{
    
    private static final long serialVersionUID = -3219322692201847997L;
    private static final int BUFFER_SIZE = 16 * 1024;
    
    private File paper;
    private String paperFileName;
    private String newPaperName;
    private String paperContentType;
    
    private Task task;
    private Paper mypaper;
    
    private String taskid;
    private String message;
    private String savePath;
    
    public String uploadPaper(){
        
        if(paperFileName == "" || paperFileName == null){
            message = "没有选择要上传的文件";
            return "success";
        }
        
        //文件名后缀
        String suffix = paperFileName.split("\\.")[paperFileName.split("\\.").length - 1];
        //随机生成的纯数字文件名
        newPaperName = BaseUnit.getLoginUser().getUsername() + "-" + new Random().nextInt(999999) + "." + suffix;
        
        String dstPath = ServletActionContext.getServletContext().getRealPath(this.getSavePath())
                            + "/" + newPaperName;
        
        File dstFile = new File(dstPath);
        copy(this.paper, dstFile);
        
        PaperDAO paperDao = new PaperDAO();
        TaskDAO taskDao = new TaskDAO();
        try {
            paperDao.insertPaper(taskid, paperFileName, newPaperName);
            taskDao.updateStatus(taskid, "8");  //修改课题状态
        } catch (SQLException e) {
            e.printStackTrace();
            message = "系统错误";
            return "notexist";
        }
        
        message = "上传论文成功！";
        return "success";
    }
    
    public String toDownloadPage(){
        TaskDAO taskDao = new TaskDAO();
        PaperDAO paperDao = new PaperDAO();
        
        try {
            if (taskid == "" || taskid == null) {
                task = taskDao.getTaskByUsername(BaseUnit.getLoginUser().getUsername());
            } else {
                task = taskDao.getTaskByID(taskid);
            }
            
            if (task == null){
                message = "还没有申请课题，请查看选题信息";
                return "success";
            }
            
            mypaper = paperDao.getPaperByTaskid(task.getTaskid());
            
            if(mypaper == null){
                message = "论文还未上传，请查看选题信息";
                return "success";
            } else {
                return "todownloadpage";
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            message = "系统错误";
            return "notexist";
        }
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

    public File getPaper() {
        return paper;
    }

    public void setPaper(File paper) {
        this.paper = paper;
    }

    public String getPaperFileName() {
        return paperFileName;
    }

    public void setPaperFileName(String paperFileName) {
        this.paperFileName = paperFileName;
    }

    public String getPaperContentType() {
        return paperContentType;
    }

    public void setPaperContentType(String paperContentType) {
        this.paperContentType = paperContentType;
    }

    public String getTaskid() {
        return taskid;
    }

    public void setTaskid(String taskid) {
        this.taskid = taskid;
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

    public String getNewPaperName() {
        return newPaperName;
    }

    public void setNewPaperName(String newPaperName) {
        this.newPaperName = newPaperName;
    }

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }

    public Paper getMypaper() {
        return mypaper;
    }

    public void setMypaper(Paper mypaper) {
        this.mypaper = mypaper;
    }
}
