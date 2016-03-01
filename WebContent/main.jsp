<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
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
                    <li class="current"><a HREF="main.jsp">首页</a></li>
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
            <h1>位置>>首页</h1>
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
                
                    <div class="colgroup leading">
                        <div class="column width3 first">
                            <h3>欢迎回来， 
                                  <s:if test='#session.loginUser.role == "sysadmin"'>
                                      <s:property value="#session.loginUser.username" />
                                  </s:if><s:else>
                                      <a href="userinfo"><s:property value="#session.loginUser.realname" /></a>
                                  </s:else>
                            </h3>
                            
                            <p>
                                您的身份是<b>
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
                                </b>.<br />
                            </p>
                        </div>
                        <div class="column width3">
                            <s:if test="#session.loginUser.lasttime==null">
                                    <h4>您是首次登录</h4>
                                    <p class="box box-info">请完善个人资料！</p>
                            </s:if>
                            <s:else>
                                    <h4>上次登录时间</h4>
                                    <p>
                                        <s:property value="#session.loginUser.lasttime" />
                                    </p>
                            </s:else>

                        </div>
                    </div>
                    
                    <div class="colgroup leading">
                        <div class="column width3 first">
                            <h4>校级通知：
                                <a href="morenotice?scope=all">more</a>
                            </h4>
                            <hr/>
                            <table class="no-style full">
                                <tbody>
                                    <s:iterator value="#session.allList" id="a">
                                        <tr>
                                            <td><a href="viewnotice?id=<s:property value="#a.noticeid" />"><s:property value="#a.ntitle" /></a></td>
                                            <td></td>
                                            <td><s:property value="#a.time" /></td>
                                        </tr>
                                    </s:iterator>
                                </tbody>
                            </table>
                        </div>
                        <div class="column width3">
                            <h4>最新通知：
                                <a href="morenotice?scope=<s:property value="#session.loginUser.collegeid" />">more</a>
                            </h4>
                            <hr/>
                            <table class="no-style full">
                                <tbody>
                                    <s:iterator value="#session.collegeList" id="c">
                                        <tr>
                                            <td><a href="viewnotice?id=<s:property value="#c.noticeid" />"><s:property value="#c.ntitle" /></a></td>
                                            <td></td>
                                            <td><s:property value="#c.time" /></td>
                                        </tr>
                                    </s:iterator>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                
                    
                    <div class="clear">&nbsp;</div>
                
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