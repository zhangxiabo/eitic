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
                        <li><a HREF="subtask">选题信息</a></li>
                        <li><a HREF="viewreport">开题报告</a></li> 
                        <li><a HREF="viewinspect">中期检查</a></li>
                        <li><a HREF="mypaper">论文</a></li>
                        <li><a HREF="message">消息</a></li> 
                        </s:elseif>
                    <s:elseif test='#session.loginUser.role=="teacher"'>
                        <li><a HREF="userinfo">个人信息</a></li>
                        <li><a HREF="approval">待我审批</a></li>
                        <li class="current"><a HREF="tasksoftea">课题状态</a></li> 
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
            <h1>位置>>导师所带课题状态</h1>
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
            <section class="column width6 first">
                <table class="stylized full">
                    <caption>所有课题</caption>
                    <thead>
                        <tr>
                            <th>题目</th>
                            <th>提交时间</th>
                            <th>课题状态</th>
                            <th>详细</th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="tasksoftea" id="task">
                            <tr class="high">
                                <td><s:property value="title" /></td>
                                <td><s:property value="subtime" /></td>
                                <td>
                                   <s:if test='status == "1"'>
                                       学生已提交课题，等待导师审批
                                   </s:if> <s:elseif test='status == "2"'>
                                       未通过导师审批，等待学生修改
                                   </s:elseif> <s:elseif test='status == "3"'>
                                       导师审批通过，等待学院审批
                                   </s:elseif> <s:elseif test='status == "4"'>
                                       未通过学院审批，等待学生修改
                                   </s:elseif> <s:elseif test='status == "5"'>
                                       学院已批准本课题，等待学生提交开题报告
                                   </s:elseif> <s:elseif test='status == "6"'>
                                       开题报告已提交，等待学生提交中期检查
                                   </s:elseif> <s:elseif test='status == "7"'>
                                       中期检查已提交，等待学生提交论文
                                   </s:elseif> <s:elseif test='status == "8"'>
                                       论文已提交
                                   </s:elseif> 
                                </td>
                                <td><a href="taskdetail?taskid=<s:property value="taskid" />">详细</a></td>
                            </tr>
                        </s:iterator>

                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="4">
                                请点击详细查看课题信息
                            </td>
                        </tr>
                    </tfoot>
                </table>

              </section>
               <!-- End of Left column/section -->
            
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