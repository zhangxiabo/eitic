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
    
    // validate form on keyup and submit
    var validator = $("#sampleform").validate({
        rules: {
            overview: "required",
            goal: "required",
            method: "required",
            innovation: "required",
            progress: "required",
            requirement: "required"
        },
        messages: {
        	overview: "请填写此项内容",
        	goal: "请填写此项内容",
        	method: "请填写此项内容",
        	innovation: "请填写此项内容",
        	progress: "请填写此项内容",
        	requirement: "请填写此项内容"
        },
        // the errorPlacement has to take the layout into account
        errorPlacement: function(error, element) {
            error.insertAfter(element.parent().find('label:first'));
        },

        // set new class to error-labels to indicate valid fields
        success: function(label) {
            // set &nbsp; as text for IE
            label.html("&nbsp;").addClass("ok");
        }
    });
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
                        <li><a HREF="subtask">选题信息</a></li>
                        <li class="current"><a HREF="viewreport">开题报告</a></li> 
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
            <h1>位置>>开题报告</h1>
            <!-- Quick search box -->
            <form action="notexist" method="post"><input class="" type="text" id="q" name="q" /></form>
        </div>
    </div>
    <!-- End of Page title -->
    
    <!-- Page content -->
    <div id="page">
        <!-- Wrapper -->
        <div class="wrapper">
        
            <section  class="column width6 first">
                <form id="sampleform" method="post" action="subreport?taskid=${task.taskid }">
                    <fieldset>
                        <legend>提交开题报告</legend>
                        <p>课题题目：${task.title }</p>
                        
                        <p>
                            <label class="required" for="overview">本课题的意义、国内外研究概况、应用前景等（列出主要参考文献）：</label><br/>
                            <textarea class="large full" name="overview"></textarea>
                        </p>
                        
                        <p>
                            <label class="required" for="goal">研究的目标、内容和拟解决的关键问题：</label><br/>
                            <textarea class="large full" name="goal"></textarea>
                        </p>
                        
                        <p>
                            <label class="required" for="method">研究方法、技术路线、实验方案及可行性分析：</label><br/>
                            <textarea class="large full" name="method"></textarea>
                        </p>
                        
                        <p>
                            <label class="required" for="innovation">特色或创新之处：</label><br/>
                            <textarea class="large full" name="innovation"></textarea>
                        </p> 
                        
                        <p>
                            <label class="required" for="progress">研究计划及预期进展：</label><br/>
                            <textarea class="large full" name="progress"></textarea>
                        </p> 
                         
                        <p>
                            <label class="required" for="requirement">已具备的条件、尚缺少的条件和拟解决的途径（包括利用教学实验中心、科研实验室、实习基地、校外其它企事业单位等条件的计划与落实情况）：</label><br/>
                            <textarea class="large full" name="requirement"></textarea>
                        </p>                         
                        
                        <p>
                            <input type="submit" class="btn btn-green big" value="提交"/>
                             or 
                            <input type="reset" class="btn" value="重置"/>
                        </p>                                                                      
                        
                    </fieldset>
                </form>

            </section> 
                     
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