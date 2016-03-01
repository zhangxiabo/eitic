package org.pigeon.eitic.action;

import java.sql.SQLException;
import java.util.List;

import org.pigeon.eitic.constants.BaseUnit;
import org.pigeon.eitic.dao.ClassDAO;
import org.pigeon.eitic.dao.DeptDAO;
import org.pigeon.eitic.dao.TaskDAO;
import org.pigeon.eitic.dao.UserDAO;
import org.pigeon.eitic.vo.Task;
import org.pigeon.eitic.vo.User;

public class TaskAction {
    
    List<User> teachers = null;   //学生所在学院的教师列表
    
    private String message;
    private Task task;
    private User teacher;  //导师信息
    private User student;  //学生信息
    
    private String taskid;
    private String tasktitle;
    private String teaid;
    private String summary;
    
    private String deptname;  //学生所在专业名称
    private String classname;  //学生所在班级名称

    /**
     * 获取学生所在院系的所有老师
     * @return
     */
    public String toSubmitTaskPage(){
        TaskDAO taskDao = new TaskDAO();
        UserDAO userDao = new UserDAO();
        
        if(taskDao.isExist(BaseUnit.getLoginUser().getUsername())){
            try {
                task = taskDao.getTaskByUsername(BaseUnit.getLoginUser().getUsername());
                teacher = userDao.getUserByName(task.getTeaid());
            } catch (SQLException e) {
                e.printStackTrace();
                message = "获取学生提交的课题失败";
                return "notexist";
            }
            return "taskdetail";
        }
        
        try {
            teachers = userDao.getTeacherList(BaseUnit.getLoginUser().getCollegeid());
        } catch (SQLException e) {
            e.printStackTrace();
            message = "获取学生所在院系的所有老师失败";
            return "notexist";
        }
        
        return "success";
    }
    
    public String submitTaskTitle(){
        UserDAO userDao = new UserDAO();
        if("0".equals(teaid)){
            try {
                teachers = userDao.getTeacherList(BaseUnit.getLoginUser().getCollegeid());
            } catch (SQLException e) {
                e.printStackTrace();
                message = "获取学生所在院系的所有老师失败";
                return "notexist";
            }
            message = "请选择导师";
            return "subtask";
        }
        
        TaskDAO taskDao = new TaskDAO();
        if(taskDao.titleIsExist(tasktitle)){
            try {
                teachers = userDao.getTeacherList(BaseUnit.getLoginUser().getCollegeid());
            } catch (SQLException e) {
                e.printStackTrace();
                message = "获取学生所在院系的所有老师失败";
                return "notexist";
            }
            message = "此题目已有人提交，不可重复提交！";
            return "subtask";
        }
        
        try {
            taskDao.insertTask(tasktitle, BaseUnit.getLoginUser().getUsername(), teaid, summary);
            message = "提交课题成功！";
            return "success";
        } catch (SQLException e) {
            e.printStackTrace();
            message = "系统错误";
            return "notexist";
        }
        
    }
    
    public String getTaskDetail(){
        TaskDAO taskDao = new TaskDAO();
        UserDAO userDao = new UserDAO();
        DeptDAO deptDao = new DeptDAO();
        ClassDAO classDao = new ClassDAO();
        
        try {
            task = taskDao.getTaskByID(taskid);
            
            if ("deptadmin".equals(BaseUnit.getLoginUser().getRole())){
                teacher = userDao.getUserByName(task.getTeaid()); 
            }
            
            student = userDao.getUserByName(task.getStuid());
            deptname = deptDao.getNameById(student.getDeptid());
            classname = classDao.getNameById(student.getClassid());
        } catch (SQLException e) {
            e.printStackTrace();
            message = "系统错误";
            return "notexist";
        }
        
        return "success";
    }
    
    public String toModifyPage(){
        TaskDAO taskDao = new TaskDAO();
        try {
            task = taskDao.getTaskByID(taskid);
        } catch (SQLException e) {
            e.printStackTrace();
            message = "系统错误";
            return "notexist";
        }
        
        return "success";
    }
    
    public String updateTask(){
        TaskDAO taskDao = new TaskDAO();
        try {
            taskDao.updateTask(taskid, tasktitle, summary);
        } catch (SQLException e) {
            e.printStackTrace();
            message = "系统错误";
            return "notexist";
        }
        
        message = "修改课题信息成功！";
        return "success";
    }


    public void setTeachers(List<User> teachers) {
        this.teachers = teachers;
    }

    public List<User> getTeachers() {
        return teachers;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getTasktitle() {
        return tasktitle;
    }

    public void setTasktitle(String tasktitle) {
        this.tasktitle = tasktitle;
    }

    public String getTeaid() {
        return teaid;
    }

    public void setTeaid(String teaid) {
        this.teaid = teaid;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }

    public User getTeacher() {
        return teacher;
    }

    public void setTeacher(User teacher) {
        this.teacher = teacher;
    }

    public String getTaskid() {
        return taskid;
    }

    public void setTaskid(String taskid) {
        this.taskid = taskid;
    }

    public User getStudent() {
        return student;
    }

    public void setStudent(User student) {
        this.student = student;
    }

    public String getDeptname() {
        return deptname;
    }

    public void setDeptname(String deptname) {
        this.deptname = deptname;
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname;
    }
    
}
