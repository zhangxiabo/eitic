<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<jsp:include page="header.jsp"></jsp:include>

<script type="text/javascript">
$(document).ready(function(){
    
    /* setup navigation, content boxes, etc... */
    Administry.setup();

});

</script>

<body>
    <!-- Header -->
    <header id="top">
        <div class="wrapper">
            <!-- Title/Logo - can use text instead of image -->
            <div id="title"><span>毕业设计指导系统</span></div>
            <!-- Top navigation -->
            <div id="topnav">
                <a href="#"><img class="avatar" SRC="img/user_32.png" alt="" /></a>
                <b>
                    <s:if test='#session.loginUser.role=="sysadmin"'>
                        系统管理员
                    </s:if>
                    <s:elseif test='#session.loginUser.role=="student"'>
                        学生
                    </s:elseif>
                    <s:elseif test='#session.loginUser.role=="teacher"'>
                        导师
                    </s:elseif>
                    <s:elseif test='#session.loginUser.role=="deptadmin"'>
                        系管理员
                    </s:elseif>
                </b>界面
                <span>|</span> <a href="logout">注销</a><br />
            </div>
            <!-- End of Top navigation -->
            <!-- Main navigation -->
            <nav id="menu">
                <ul class="sf-menu">
                    <li><a HREF="main.jsp">首页</a></li>
                    <s:if test='#session.loginUser.role=="sysadmin"'>
                        <li><a HREF="college">管理学院</a></li>
                        <li><a HREF="dept">管理专业</a></li>
                        <li><a HREF="class">管理班级</a></li> 
                        <li><a HREF="adduser">注册用户</a></li>
                        <li><a HREF="notice.jsp">发布校级通知</a></li>
                    </s:if>
                    <s:elseif test='#session.loginUser.role=="student"'>
                        <li><a HREF="userinfo">个人信息</a></li>
                        <li class="current"><a HREF="subtask">选题信息</a></li>
                        <li><a HREF="viewreport">开题报告</a></li> 
                        <li><a HREF="viewinspect">中期检查</a></li>
                        <li><a HREF="mypaper">论文</a></li>
                        <li><a HREF="message">消息</a></li> 
                        </s:elseif>
                    <s:elseif test='#session.loginUser.role=="teacher"'>
                        <li><a HREF="userinfo">个人信息</a></li>
                        <li><a HREF="approval">待我审批</a></li>
                        <li><a HREF="tasksoftea">课题状态</a></li> 
                        <li><a HREF="message">消息</a></li>  
                    </s:elseif>
                    <s:elseif test='#session.loginUser.role=="deptadmin"'>
                        <li><a HREF="userinfo">个人信息</a></li>
                        <li><a HREF="approval">待我审批</a></li>
                        <li><a HREF="notice.jsp">发布院级通知</a></li>
                    </s:elseif>
                </ul>
            </nav>
            <!-- End of Main navigation -->
            <!-- Aside links -->
            <aside>
                <b>欢迎您：</b> 
                <a href="#">
                    <s:if test="#session.loginUser.realname==null">
                        <s:property value="#session.loginUser.username" />
                    </s:if>
                    <s:else>
                        <s:property value="#session.loginUser.realname" />
                    </s:else>
                </a>&middot; 
                <b>身份：</b> 
                <a href="#">
                    <s:if test='#session.loginUser.role=="sysadmin"'>
                        系统管理员
                    </s:if>
                    <s:elseif test='#session.loginUser.role=="student"'>
                        学生
                    </s:elseif>
                    <s:elseif test='#session.loginUser.role=="teacher"'>
                        导师
                    </s:elseif>
                    <s:elseif test='#session.loginUser.role=="deptadmin"'>
                        系管理员
                    </s:elseif>
                </a>
            </aside>
            <!-- End of Aside links -->
        </div>
    </header>
    <!-- End of Header -->
    
    <!-- Page title -->
    <div id="pagetitle">
        <div class="wrapper">
            <h1>位置>>已提交课题信息</h1>
            <!-- Quick search box -->
            <form action="notexist" method="post"><input class="" type="text" id="q" name="q" /></form>
        </div>
    </div>
    <!-- End of Page title -->
    
    <!-- Page content -->
    <div id="page">
        <!-- Wrapper -->
        <div class="wrapper">
        
            <!-- Left column/section -->
            
            <!-- 学生查询课题详细信息 -->
            <s:if test='#session.loginUser.role == "student"'>
	            <section class="column width6 first"> 
	                <div class="colgroup leading">
	                    <div class="column width3 first">
	                        <fieldset>
	                            <legend>已提交课题</legend>
	                            <p>课题题目：${task.title }</p>
	                            <p>提交时间：${task.subtime }</p>
	                            <p>课题简介：${task.summary }</p>
	                        </fieldset>
	                   </div>
	                   <div class="column width3">
	                       <fieldset>
	                            <legend>导师信息</legend>
	                            <p>导师：${teacher.realname }</p>
	                            <p>邮箱：${teacher.email }</p>
	                            <p>手机：${teacher.telphone }</p>
	                       </fieldset>
	                   </div>
	               </div>
	               <h4>
	                   课题状态：<s:property value="task.status" />
	                   <s:if test='task.status == "1"'>
	                       学生已提交课题，等待导师审批
	                   </s:if> <s:elseif test='task.status == "2"'>
	                       未通过导师审批，请<a href="modifypage?taskid=${task.taskid }">修改</a>
	                   </s:elseif> <s:elseif test='task.status == "3"'>
	                       导师审批通过，等待学院审批
	                   </s:elseif> <s:elseif test='task.status == "4"'>
	                       未通过学院审批，请<a href="modifypage?taskid=${task.taskid }">修改</a>
	                   </s:elseif> <s:elseif test='task.status == "5"'>
	                       学院已批准本课题，请<a href="openreport?taskid=${task.taskid }">提交开题报告</a>
	                   </s:elseif> <s:elseif test='task.status == "6"'>
	                       开题报告已提交，请<a href="inspection?taskid=${task.taskid }">提交中期检查</a>
	                   </s:elseif> <s:elseif test='task.status == "7"'>
	                       中期检查已提交，请上传论文<br><br>
	                       <form action="uploadpaper?taskid=${task.taskid }" method="post" enctype="multipart/form-data">
	                           <label  class="required" for="paper">选择文件</label>
	                           <input type="file" name="paper" id="paper" class="half"/>
	                           <input type="submit" class="btn btn-green big" value="上传"/>
	                       </form>
	                   </s:elseif> <s:elseif test='task.status == "8"'>
	                       论文已提交
	                   </s:elseif> 
	               </h4>
	               <div class="clear">&nbsp;</div>
	            </section>
            </s:if>
            
            <!-- 导师查询课题详细信息 -->
            <s:elseif test='#session.loginUser.role == "teacher"'>
                <section class="column width6 first"> 
                    <div class="colgroup leading">
                        <div class="column width3 first">
                            <fieldset>
                                <legend>已提交课题</legend>
                                <p>课题题目：${task.title }</p>
                                <p>提交时间：${task.subtime }</p>
                                <p>课题简介：${task.summary }</p>
                            </fieldset>
                       </div>
                       <div class="column width3">
                           <fieldset>
                                <legend>学生信息</legend>
                                <p>学生：${student.realname }</p>
                                <p>专业：${deptname }</p>
                                <p>班级：${classname }</p>
                                <p>邮箱：${student.email }</p>
                                <p>手机：${student.telphone }</p>
                           </fieldset>
                       </div>
                   </div>
                   <h4>
                       课题状态：<s:property value="task.status" />
                       <s:if test='task.status == "1"'>
                           学生已提交课题，等待导师审批
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <a href="updatestatus?status=3&taskid=${task.taskid }">审批通过</a>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <a href="updatestatus?status=2&taskid=${task.taskid }">审批不通过</a>
                       </s:if> <s:elseif test='task.status == "2"'>
                           未通过导师审批，等待学生修改
                       </s:elseif> <s:elseif test='task.status == "3"'>
                           导师审批通过，等待学院审批
                       </s:elseif> <s:elseif test='task.status == "4"'>
                           未通过学院审批，等待学生修改
                       </s:elseif> <s:elseif test='task.status == "5"'>
                           学院已批准本课题，等待学生提交开题报告
                       </s:elseif> <s:elseif test='task.status == "6"'>
                           开题报告已提交，等待学生提交中期检查<br><br>
                           查看开题报告<a href='viewreport?taskid=${task.taskid }'>点这里</a>
                       </s:elseif> <s:elseif test='task.status == "7"'>
                           中期检查已提交，等待学生提交论文<br><br>
                           查看开题报告<a href='viewreport?taskid=${task.taskid }'>点这里</a>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           查看中期检查<a href='viewinspect?taskid=${task.taskid }'>点这里</a>
                       </s:elseif> <s:elseif test='task.status == "8"'>
                           论文已提交<br><br>
                           查看开题报告<a href='viewreport?taskid=${task.taskid }'>点这里</a>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           查看中期检查<a href='viewinspect?taskid=${task.taskid }'>点这里</a>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           下载论文<a href='mypaper?taskid=${task.taskid }'>点这里</a>
                       </s:elseif> 
                   </h4>
                   <div class="clear">&nbsp;</div>
                </section>
            </s:elseif>
            
            <!-- 系管理员查询课题详细信息 -->
            <s:elseif test='#session.loginUser.role == "deptadmin"'>
                <section class="column width6 first"> 
                    <div class="colgroup leading">
                        <div class="column width3 first">
                            <fieldset>
                                <legend>已提交课题</legend>
                                <p>课题题目：${task.title }</p>
                                <p>提交时间：${task.subtime }</p>
                                <p>课题简介：${task.summary }</p>
                            </fieldset>
                       </div>
                       <div class="column width3">
                           <fieldset>
                                <legend>导师信息</legend>
                                <p>导师：${teacher.realname }</p>
                                <p>邮箱：${teacher.email }</p>
                                <p>手机：${teacher.telphone }</p>
                           </fieldset>
                           
                           <fieldset>
                                <legend>学生信息</legend>
                                <p>学生：${student.realname }</p>
                                <p>专业：${deptname }</p>
                                <p>班级：${classname }</p>
                                <p>邮箱：${student.email }</p>
                                <p>手机：${student.telphone }</p>
                           </fieldset>
                       </div>
                   </div>
                   <h4>
                       课题状态：<s:property value="task.status" />
                       <s:if test='task.status == "1"'>
                           学生已提交课题，等待导师审批
                       </s:if> <s:elseif test='task.status == "2"'>
                           未通过导师审批，等待学生修改
                       </s:elseif> <s:elseif test='task.status == "3"'>
                           导师审批通过，等待学院审批
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <a href="updatestatus?status=5&taskid=${task.taskid }">审批通过</a>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <a href="updatestatus?status=4&taskid=${task.taskid }">审批不通过</a>
                       </s:elseif> <s:elseif test='task.status == "4"'>
                           未通过学院审批，等待学生修改
                       </s:elseif> <s:elseif test='task.status == "5"'>
                           学院已批准本课题，等待学生提交开题报告
                       </s:elseif> <s:elseif test='task.status == "6"'>
                           开题报告已提交，等待学生提交中期检查
                       </s:elseif> <s:elseif test='task.status == "7"'>
                           中期检查已提交，等待学生提交论文
                       </s:elseif> <s:elseif test='task.status == "8"'>
                           论文已提交
                       </s:elseif> 
                   </h4>
                   <div class="clear">&nbsp;</div>
                </section>
            </s:elseif>
            
                     
            <!-- Right column/section -->
            <aside class="column width2">
                <jsp:include page="aside.jsp"></jsp:include>
            </aside>
            <!-- End of Right column/section -->
                
        </div>
        <!-- End of Wrapper -->
    </div>
    <!-- End of Page content -->
    
    <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>